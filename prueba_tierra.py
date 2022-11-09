import py_orbit
import cy_orbit
import time


#Incializacion planeta para python
tierraPy=py_orbit.Planet()
tierraPy.x=100*10**3
tierraPy.y=300*10**3
tierraPy.z=700*10**3
tierraPy.vx=2.015*10**3
tierraPy.vy=29.48*10**3
tierraPy.vz=0.34*10**3
tierraPy.m=5.9710*10*24



#Incializacion planeta para cython
tierraCy=cy_orbit.Planet()
tierraCy.x=100*10**3
tierraCy.y=300*10**3
tierraCy.z=700*10**3
tierraCy.vx=2.015*10**3
tierraCy.vy=29.48*10**3
tierraCy.vz=0.34*10**3
tierraCy.m=5.9710*10*24


time_span=400
n_steps=20000000


formato_datos="{:.5f},{:5f}\n"


for i in range(30):
	inicioPy=time.time()
	py_orbit.step_time(tierraPy,time_span,n_steps)
	finalPy=time.time()-inicioPy

	inicioCy=time.time()
	cy_orbit.step_time(tierraCy,time_span,n_steps)
	finalCy=time.time()-inicioCy

	with open("tierra.csv","a") as archivo:
		archivo.write(formato_datos.format(finalPy,finalCy))

