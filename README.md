# CythonOrbita
Prueba de rendimiento entre python y cython

Se encuentran los archivos py_orbit donde se encuentra el código original codificado en python.
El archivo cy_orbit que es el codigo adaptado a cython, se cambian la declaracion de variables.

el setup en el que se cytoniza el archivo y se crea el build. _py_cache_ y el cy_orbit.cpython-39-x86_64-linux-gnu.so

Ademas se encuentra el perfomarce.py en el que se evalua la diferencia de rendmiento siendo cython mucho más rápido que python.
Adicionalmente se agrego prueba para guardar los valores en un csv donde se guarda los tiempos de diferencia de rendimiento

Para ejecutar el programa haga en el terminal debera hacer un make all para generar los archivos, ademas puede hacer un make clean para eliminar todos los residuos de la compilacion. 

Para generar el csv de los resultados de las pruebas en el terminal ejecute python3 prueba_tierra.py

Hay un notebook donde podra verse los resultados de rendimiento y comparaciones mediante graficas.
