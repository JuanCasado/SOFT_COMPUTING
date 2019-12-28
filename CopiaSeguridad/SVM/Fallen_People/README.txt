Install
sudo apt install python3-pip
sudo apt install python3-gi python3-gi-cairo gir1.2-gtk-3.0
pip3 install numpy

Run
python3 anotation.py IMG

to anotate the images on directory IMG and all their folder


'e' + '1' Erase 1st anotation
'e' + '2' Erase 2nd anotation
'e' + '3' Erase 3rd anotation
'e' + '4' Erase 4th anotation
'e' + '5' Erase 5th anotation

With Mouse clicks the four coordenates of the bounding box are introduced:
Left, Upper, Right and Botton

If the last click is done with the left  botton, the annotation is as fallen (red).
If the last click is done with the right botton, the annotation is as no fallen (green).

To change the class fallen/no fallen or viceversa:

'i' + '1' Invert 1st anotation
'i' + '2' Invert 2nd anotation
'i' + '3' Invert 3rd anotation
'i' + '4' Invert 4th anotation
'i' + '5' Invert 5th anotation

Use Left and Right arrows to move backwards and forward.

To finish Close the Window.



gcc translate.c -o translate

./translate img.txt salida.txt

./svm-predict salida.txt fall_model salida_svm.txt

The accuracy is given, you can check how the system work for several images.


