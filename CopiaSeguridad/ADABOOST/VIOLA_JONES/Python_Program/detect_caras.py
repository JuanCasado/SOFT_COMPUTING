# -*- coding: utf-8 -*-
import numpy as np
import cv2
import time
from video import VideoStream
import os, errno

# Función para cambiar el formato de la imagen

def resize(image, width=None, height=None, inter=cv2.INTER_AREA):
    # initialize the dimensions of the image to be resized and
    # grab the image size
    dim = None
    (h, w) = image.shape[:2]

    # if both the width and height are None, then return the
    # original image
    if width is None and height is None:
        return image

    # check to see if the width is None
    if width is None:
        # calculate the ratio of the height and construct the
        # dimensions
        r = height / float(h)
        dim = (int(w * r), height)

    # otherwise, the height is None
    else:
        # calculate the ratio of the width and construct the
        # dimensions
        r = width / float(w)
        dim = (width, int(h * r))

    # resize the image
    resized = cv2.resize(image, dim, interpolation=inter)

    # return the resized image
    return resized


##########################################################################################################
##########################################################################################################
###
###       Aquí empieza
###
##########################################################################################################
##########################################################################################################


face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_alt.xml')


captura = VideoStream(usePiCamera=False).start()
time.sleep(1.0)

# Con ESCALA seleccionamos el tamaño de la imagen que deseamos procesar para agilizar los cálculos
# Con ESCALA=1 marcamos un tamaño 320x240 pixels
ESCALA=0.85

IMAGE_WIDTH= 320
IMAGE_HEIGHT= 240

# Tomamos sólo la parte central de la imagen como zona de interés.
INI_ROI_Y=  int(60*ESCALA)
INI_ROI_X=  int(50*ESCALA)
FIN_ROI_Y=  int(240*ESCALA)
FIN_ROI_X=  int(200*ESCALA)

# alpha es el parámetro que indica la velocidad de seguimiento del centro de la cara.
# se representa un cículo blanco en la posición. Un seguimiento muy lento no permite 
# ajustarse a los movimientos de la cabeza y uno muy rápido no permite diferenciar 
#los movimientos de afirmación o negación.
alpha=0.01*ESCALA
cara_aux_x=0.0
cara_aux_y=0.0

# Desplazamientos que se deben realizar respecto al centro para iniciar o concluir un movimiento
# de afirmación o negación.
Margen_afirmar =4.0*ESCALA
Margen_negar =5.0*ESCALA

Cara_normal=(0,0)

# Flags utilizados para el seguimiento de la detección de afirmación y/o negación
Fijado = False      # Fijado o no el centro inicial
Normal = False      # Indica si estamos en estado normal para visualizar es estado una vez
Izquierda = False   # Indica que se ha iniciado un movimiento hacia la izquierda (falta mover a derecha para completar negación).
Arriba = False      # Indica que se ha iniciado un movimiento hacia la arriba  (falta mover a abajo para completar afirmación).
Derecha = False     # Indica que se ha iniciado un movimiento hacia la derecha (falta mover a izquierda para completar negación).
Abajo = False       # Indica que se ha iniciado un movimiento hacia la abajo (falta mover a arriba para completar afirmación).


# Coordenadas de los puntos para visualizar "LEDs" de supervisión
center3=(30,220)
center4=(160,220)

#######################################################################
# Estas variables controlan cuantas iteraciones se está esperando completar una afirmación o negación
# Obviamente tendrán que ajustarse de forma muy diferente para un PC rápido y una Raspberry
#######################################################################

T_contador_reset=70
T_contador1=50
T_contador2=50

# y los respectivos contadores
#######################################################################
contador1 = T_contador1
contador2 = T_contador2
contador_reset=0


contador_img=0
try:
    os.makedirs('caras')
except OSError as e:
    if e.errno != errno.EEXIST:
        raise

while 1:
   #captura de imagen y redimensionado
   img = captura.read()
   img = resize(img, width=IMAGE_WIDTH)
   
   # Eliminamos las partes menos interesantes
   #img[0:INI_ROI_X, :,:]=0 
   #img[FIN_ROI_X:-1, :,:]=0 
   #img[:,0:INI_ROI_Y,:]=0 
   #img[:,FIN_ROI_Y:-1,:]=0 

   #img[INI_ROI_X, :,2]=255 
   #img[INI_ROI_X, :,0]=255 
   #img[:,INI_ROI_Y,2]=255 
   #img[:,INI_ROI_Y,0]=255 

   #img[FIN_ROI_X, :,2]=255 
   #img[:,FIN_ROI_Y,2]=255 
  
   # Convertimos a Blanco y Negro y ecualizamos 
   gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
   gray = cv2.equalizeHist(gray)

   # Detección de caras
   faces=face_cascade.detectMultiScale(gray, 1.1, 2, 0|cv2.CASCADE_SCALE_IMAGE, (50, 50), (300, 300) )
   
   cv2.circle(img, Cara_normal, 4, (255, 255, 255), 4, 8, 0 )


   # Draw the Red point for N iterations: NEGATIVE movement
   if (contador1 < T_contador1):
      cv2.circle(img, center3, 6, (0, 0, 255), 10, 8, 0 )
      contador1+=1
   elif (contador2 < T_contador2):
      # Draw the Green point for N iterations: AFIRMATIVE movement
      cv2.circle(img, center4, 6, (0, 255, 0), 10, 8, 0 )
      contador2+=1
   elif (contador_reset<T_contador_reset):
      contador_reset+=1
   else:
          Arriba=False
          Abajo=False
          Izquierda=False
          Derecha=False
         

   if Derecha: 
      cv2.circle(img, center3, 6, ( 255, 255, 255 ), 10, 8, 0 );
   if Izquierda: 
      cv2.circle(img, center3, 6, ( 255, 255, 0 ), 10, 8, 0 );
   if Arriba: 
      cv2.circle(img, center4, 6, ( 255, 255, 255 ), 10, 8, 0 );
   if Abajo: 
      cv2.circle(img, center4, 6, ( 255, 255, 0 ), 10, 8, 0 );

   if len(faces):
       x,y,w,h=faces[0]
       centro=(x+int(h/2),y+int(w/2))
       cv2.ellipse( img, centro, (int(h/2),int(w/2)), 0, 0, 360 , (0,0,255), 2, 8, 0)

       #////////////////////////////////////////////
       #// Código para salvar trozos de la cara
       faceROI=gray[y:y+h, x:x+w]
       #cv2.imshow( "Prueba", faceROI);
       contador_img+=1
       cadena="caras/f"+'{:03d}'.format(contador_img)+".jpg"
       #printf("%s\n",cadena);
	   ## LA SIGUIENTE LLAMADA PERMITE SALVAR LA CARA EN UN FICHERO JPG
       #cv2.imwrite(cadena,faceROI);

       #////////////////////////////////////////////////////////////////
       #// Set the new position of face center using acumulative calculation
       cara_aux_x=centro[0]*alpha+cara_aux_x*(1.0-alpha)
       cara_aux_y=centro[1]*alpha+cara_aux_y*(1.0-alpha)
       Cara_normal=(int(cara_aux_x),int(cara_aux_y))
       #////////////////////////////////////////////////////////////////
       #// Get the initial center
       if not Fijado:
          Fijado=True
          Cara_normal=centro
          cara_aux_x=centro[0]
          cara_aux_y=centro[1]

       #print contador_reset
       if contador_reset<T_contador_reset:
          if ((centro[0]>(Cara_normal[0] + Margen_negar) and Izquierda) or (centro[0]<(Cara_normal[0] - Margen_negar) and Derecha)):
          #printf("%d %d===> %d, %d  HH %d,%d\n",center.x,center.y, Cara_normal.x, Cara_normal.y,(int)Margen_negar,(int)Margen_afirmar);
             print( "Estas Negando")
             Izquierda=False
             Derecha=False
             Normal=False
             cv2.circle(img, center3, 6, ( 0, 0, 255 ), 10, 8, 0 )
             contador1=0
             contador_reset=0
          elif ((centro[1]<(Cara_normal[1] - Margen_afirmar) and Arriba) or (centro[1] > (Cara_normal[1] + Margen_afirmar) and Abajo)):
             print( "Estas Afirmando")
             Arriba=False
             Abajo=False
             Normal=False
             cv2.circle(img, center4, 6, ( 0, 255, 0 ), 10, 8, 0 )
             contador2=0
             contador_reset=0
       else:
             Izquierda=False
             Derecha=False
             Arriba=False
             Abajo=False
             
             if (centro[0]<(Cara_normal[0] - Margen_negar)):
                 Izquierda=True
                 contador_reset=0
                 cv2.circle(img, center3, 6, ( 255, 255, 0 ), 10, 8, 0 )
             elif (centro[0]>(Cara_normal[0] + Margen_negar)): 
                 Derecha=True
                 contador_reset=0
                 cv2.circle(img, center3, 6, ( 255, 255, 255 ), 10, 8, 0 )
             elif (centro[1]>(Cara_normal[1] + Margen_afirmar)):
                 Arriba=True
                 contador_reset=0
             elif (centro[1]<(Cara_normal[1] - Margen_afirmar)): 
                 Abajo=True
                 contador_reset=0

       if not Normal and contador1>=T_contador1 and contador2>=T_contador2:
          print( "Estado normal")
          Normal=True


   cv2.imshow('img',img)
   
   #Se sale con ESC
   tecla = cv2.waitKey(5) & 0xFF
   if tecla == 27:
      break

##########################################################################################
##
##  Hasta aquí el bucle
## 
##########################################################################################

cv2.destroyAllWindows()
captura.stop()
