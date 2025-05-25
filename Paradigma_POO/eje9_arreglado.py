from typing import List
from datetime import datetime
from datetime import date


class Catedra:
    def __init__(self, nombre: str):
        self.__nombre = nombre

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre):
        self.__nombre = nuevo_nombre


class Examen:
    def __init__(self, nota: float, fecha: date, alumno: 'Alumno', catedra: 'Catedra'):
        self.__nota = nota
        self.__fecha_examen = fecha
        self.__alumno = alumno
        self.__catedra = catedra

    @property
    def nota(self):
        return self.__nota

    @nota.setter
    def nota(self, nueva_nota):
        self.__nota = nueva_nota

    @property
    def fecha_examen(self):
        return self.__fecha_examen

    @fecha_examen.setter
    def fecha_examen(self, nueva_fecha):
        self.__fecha_examen = nueva_fecha

    @property
    def alumno(self):
        return self.__alumno

    @property
    def catedra(self):
        return self.__catedra

class Alumno:
    def __init__(self, nombre: str, fecha_egreso: date):
        self.__nombre = nombre
        self.__fecha_egreso = fecha_egreso

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre):
        self.__nombre = nuevo_nombre

    @property
    def fecha_egreso(self):
        return self.__fecha_egreso


class Carrera:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__c_alumnos: List[Alumno] = []
        self.__examenes: List[Examen] = []

    def listar_egresados(self) -> None: #Ya no devuelve un entero porque pide listar solamente

        iter_alumnos = iter(self.__c_alumnos)
        alumno = next(iter_alumnos, None)
        while alumno is not None:
            f_egreso = alumno.fecha_egreso
            if f_egreso is not None:
                acumula_notas = 0
                cant_examenes_aprobados = 0
                for examen in self.__examenes:
                    if examen.alumno is alumno and examen.nota >=6:
                        acumula_notas += examen.nota
                        cant_examenes_aprobados += 1
                promedio = acumula_notas / cant_examenes_aprobados
                print(f"Egresado {alumno.nombre} - Promedio {promedio:.2f}")
            alumno = next(iter_alumnos, None)

    def agregar_alumno(self, nuevo_alumno: Alumno) -> None:
        self.__c_alumnos.append(nuevo_alumno)

    def agregar_examen(self, nuevo_examen: Examen) -> None:
        self.__examenes.append(nuevo_examen)


# Ejemplo de uso
if __name__ == "__main__":
    catedra_1 = Catedra("Unica")
    alumno_1 = Alumno("Angel", None)
    alumno_2 = Alumno("Matias", datetime.today())

    examen_1 = Examen(8,date(2024,12,15),alumno_2,catedra_1)
    examen_2 = Examen(5,date(2024,11,7),alumno_2,catedra_1)
    examen_3 = Examen(8,date(2024,10,23),alumno_2,catedra_1)

    carrera_1 = Carrera("Ing")

    carrera_1.agregar_alumno(alumno_1)
    carrera_1.agregar_alumno(alumno_2)
    carrera_1.agregar_examen(examen_1)
    carrera_1.agregar_examen(examen_2)
    carrera_1.agregar_examen(examen_3)

    carrera_1.listar_egresados()
