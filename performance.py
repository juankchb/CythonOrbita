#Fichero para la prueba y comparativa rendimiento

import time
import py_orbit
import cy_orbit

planeta_cy = cy_orbit.Planet()
planeta_py = py_orbit.Planet()


init_time = time.time()
py_orbit.step_time(planeta_py, 20,20)
fin_time = time.time()
total_time_python = fin_time - init_time
print("tiempo total python: ", total_time_python)


init_time = time.time()
cy_orbit.step_time(planeta_cy, 20,20)
fin_time = time.time()
total_time_cython = fin_time - init_time
print("tiempo total cython: ", total_time_cython)

print(f"cython es {total_time_python/total_time_cython} mas rapido que python")
