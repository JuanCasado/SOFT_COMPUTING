ADABOOST

En esta práctica se realizarán tres partes, ambas basadas en el artículo:

"Rapid object detection using a boosted cascade of simple features," 
P. Viola and M. Jones, 
Proceedings of the 2001 IEEE Computer Society Conference on 
Computer Vision and Pattern Recognition. CVPR 2001, 2001, pp. I-511-I-518 vol.1.
doi: 10.1109/CVPR.2001.990517

En dicho artículo se describe un procedimiento para la clasificación 
de objetos mediante una cascada de clasificadores fuertes que se obtinen
a partir de una serie de clasificadores débiles.

La primera parte de la práctica consistirá en un análisis del artículo de
Viola & Jones de la que se obtendrán los parámetros fundamentales que intervienen
en la clasificación.

La segunda parte consiste en una aplicación para detectar la cara utilizando
el algoritmo de Viola & Jones a partir de imágenes tomadas en vivo con una 
cámara USB y con dicha detección se implementa una funcionalidad para decir 
"SI" o "NO" mediante movimientos suaves de la cabeza.
Esta parte de la práctica consiste en ajustar la visualización y tamaño de la 
cabeza con respecto a la imagen para que el algoritmo funcione correctamente.
El código se proporciona en C para compilarse en linux en el laboratorio y con 
las cámaras que se entregan.

La tercera parte de la práctica consiste en ajustar los parámetros del 
algoritmo de Viola & Jones para conseguir una buena clasificación de la señal 
de limitación de velocidad a 40 proporcionada en la práctica.
Los parámetros que se pueden modificar son:

- Número de etapas en cascada del clasificador total.
- Número de clasficadores débiles que conforman cada etapa o clasificador fuerte.
- Factor de umbralización, en el artículo en la Tabla aparece un factor 1/2 que 
multiplica a la suma de los alfas y en la implementación suministrada esta factor 
se puede cambiar (CONST_ALPHA). (Si se desea modificar el CONST_ALPHA para cada 
etapa se tendría que cambiar el código dado que sólo se considerar uno para todas
las etapas).
- Introducir nuevas características de haar.

Los entregables son los ADABOOST%02.mat que genera el programa y los parámetros 
con los que se han generado para comprobar su funcionamiento con un conjunto de
datos de test que no han sido proporcionados y los ficheros haar_feat.m y sim_haar_feat.m
caso de haberse modificado.


El material proporcinado es:
- Artículo de Viola & Jones en pdf.
- Software de FaceDetection
- Carpeta S1: Carpeta con 999 señales de 40 de 31x31 pixels.
- Carpeta Ruido: Carpeta con trozos de 31x31 que no son señales de 40.
- adaboost_demo.m Función que realiza el entrenamiento
- adaboost_demo_test.m Programa para realizar el test
- haar_feat.m: Función que obtiene las características de haar programadas
- sim_haar_feat.m: Función que obtiene una característica haar concreta.



P.D.
Es necesario considerar que los procesos tanto de entrenamiento como test consumen bastante tiempo.
