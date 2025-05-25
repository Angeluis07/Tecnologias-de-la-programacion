import hashlib
import datetime

class Persona:
    def __init__(self, nombre, apellido, anio, mes, dia, password):
        self.__nombre = nombre
        self.__apellido = apellido
        self.__fecha_nacimiento = datetime.date(anio,mes,dia)
        self.__password = hashlib.sha256()
       
        

juan = Persona("Juan", "Perez", "1990-11-11", "password")
#print(juan.validar_password("password"))  # Salida: True
#print(juan.validar_password("incorrecto"))  # Salida: False