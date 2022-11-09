#cython: language_level=3

cimport cython


"""
#Programa: planeta en orbita
#Autor: Juan Fernandez
"""

"""
Funcion externa para el calculo de la raiz
"""
cdef extern from "math.h":
	double sqrt(double x) nogil 


cdef class Planet(object):

	"""Declaracion tipo de datos publica"""
	cdef public double x,y,z,vx,vy,vz,m
	
	def __init__(self):
		self.x =1.0
		self.y =0.0
		self.z =0.0
		self.vx =0.0
		self.vy =0.5
		self.vz =0.0
			
		
		self.m =1.0
"""Que pasa se distance = 0? se usara un decorador de cython para evitar la division sobre cero y no sea costo computacional"""
		
@cython.cdivision(True)
		
cdef void single_step(Planet planet, float dt) nogil:
	"""Declaracion tipo de datos publica"""
	cdef double distance,Fx,Fy,Fz
		
		
	distance= sqrt(planet.x**2 + planet.y**2 +planet.z**2)
	Fx= -planet.x /distance**3
	Fy= -planet.y /distance**3
						
		
	planet.x += dt *planet.vx
	planet.y += dt *planet.vy
	planet.z += dt *planet.vz	
				
				
	planet.vx += dt *Fx /planet.m
	planet.vy += dt *Fy /planet.m
	planet.vz += dt *Fz /planet.m
	
def step_time (Planet planet, float time_snap, int n_steps):
	cdef float dt
	cdef int j
	dt =time_snap/n_steps
	with nogil:
		for j in range(n_steps):
			single_step(planet, dt)
		
