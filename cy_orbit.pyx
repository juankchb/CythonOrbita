#cython: language_level=3

cimport cython

cdef extern from "math.h":
    double sqrt(double x) nogil


cdef class Planet(object):
    cdef public double x,y,z,vx,vy,vz,m

    def __init__(self):
        self.x = 1.0
        self.y = 0.0
        self.z = 0.0
        self.vx = 0.0
        self.vy = 0.5
        self.vz = 0.0
        self.m = 1.0

@cython.cdivision(True)

cdef void single_step(Planet planet, float dt) nogil:
    
    cdef float distance = sqrt(planet.x**2 + planet.y**2 + planet.z**2)
    cdef float Fx = -planet.x / (distance**3)
    cdef float Fy = -planet.y / (distance**3)
    cdef float Fz = -planet.z / (distance**3)
    

    planet.x += dt * planet.vx
    planet.y += dt * planet.vy
    planet.z += dt * planet.vz

    planet.vx += (dt * Fx) / planet.m
    planet.vy += (dt * Fy) / planet.m
    planet.vz += (dt * Fz) / planet.m


cdef step_time(Planet planet,float time_span,int n_steps):
    cdef float dt

    dt = time_span / n_steps
    cdef int j
    with nogil:
        for j in range(n_steps):
           single_step(planet, dt)
