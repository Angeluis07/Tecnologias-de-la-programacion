from typing import List
from datetime import datetime
from datetime import date

class Docente:
    def __init__(self, nombre):
        self.__nombre = nombre

class Alumno:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__examenes: List['Examen'] = []
        self.__inscripciones: List['Inscripcion'] = []
        self.__cursadas: List['Cursada'] = []

    def agregar_examen(self, nuevo_examen: 'Examen'):
        self.__examenes.append(nuevo_examen)

    def agregar_inscripcion(self, nueva_inscripcion: 'Inscripcion'):
        self.__inscripciones.append(nueva_inscripcion)

    def agregar_cursada(self, nueva_cursada):
        self.__cursadas.append(nueva_cursada)

    @property
    def nombre(self):
        return self.__nombre

    @property
    def examenes(self) -> List['Examen']:
        return self.__examenes

    @property
    def inscripciones(self) -> List['Inscripcion']:
        return self.__inscripciones

    @property
    def cursadas(self) -> List['Cursada']:
        return self.__cursadas


class Catedra:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__examenes: List['Examen'] = []

    def agregar_examen(self, nuevo_examen: 'Examen'):
        self.__examenes.append(nuevo_examen)

    @property
    def nombre(self):
        return self.__nombre

    @property
    def examenes(self) -> List['Examen']:
        return self.__examenes

class Examen:
    def __init__(self, nota: float, fecha: date, alumno: Alumno, catedra: Catedra):
        self._nota = nota
        self._fecha_examen = fecha
        self._alumno = alumno
        self._catedra = catedra

        alumno.agregar_examen(self)
        catedra.agregar_examen(self)

    @property
    def nota(self):
        return self._nota

    @property
    def fecha_examen(self) -> date:
        return self._fecha_examen

    @property
    def alumno(self) -> 'Alumno':
        return self._alumno

    @property
    def catedra(self) -> 'Catedra':
        return self._catedra

class Parcial(Examen):
    def __init__(self, nota: float, fecha: date, alumno: Alumno, catedra: Catedra):
        super().__init__(nota,fecha,alumno,catedra)

class Final(Examen):
    def __init__(self, nota: float, fecha: date, alumno: Alumno, catedra: Catedra):
        super().__init__(nota,fecha,alumno,catedra)

class Inscripcion:
    def __init__(self, fecha: date, alumno: 'Alumno', carrera: 'Carrera'):
        self.__fecha_ingreso = fecha
        self.__fecha_egreso = None
        self.__alumno = alumno
        self.__carrera = carrera

        alumno.agregar_inscripcion(self)
        carrera.agregar_inscripcion(self)

    @property
    def egreso(self) -> date:
        return self.__fecha_egreso

    @egreso.setter
    def egreso(self, fecha: date):
        self.__fecha_egreso = fecha

    @property
    def fecha_ingreso(self) -> date:
        return self.__fecha_ingreso

    @property
    def alumno(self) -> 'Alumno':
        return self.__alumno

    @property
    def carrera(self) -> 'Carrera':
        return self.__carrera

class Carrera:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__inscripciones: List['Inscripcion'] = []

    def agregar_inscripcion(self, nueva_inscripcion: 'Inscripcion'):
        self.__inscripciones.append(nueva_inscripcion)

    @property
    def nombre(self):
        return self.__nombre

    @property
    def inscripciones(self) -> List['Inscripcion']:
        return self.__inscripciones

class Cursada:
    def __init__(self, fecha: date, condicion: bool, alumno: Alumno, comision: 'Comision'):
        self.__alumno = alumno
        self.__comision = comision
        self.__fecha_inicio = fecha
        self.__condicion = condicion

        alumno.agregar_cursada(self)
        comision.agregar_cursada(self)

    @property
    def fecha_inicio(self) -> date:
        return self.__fecha_inicio

    @property
    def condicion(self) -> bool:
        return self.__condicion

    @property
    def alumno(self) -> Alumno:
        return self.__alumno

    @property
    def comision(self) -> 'Comision':
        return self.__comision

class Comision:
    def __init__(self, nombre, docente: Docente):
        self.__nombre = nombre
        self.__docente = docente
        self.__cursadas: List[Cursada] = []

    def agregar_cursada(self, nueva_cursada):
        self.__cursadas.append(nueva_cursada)

    @property
    def nombre(self):
        return self.__nombre

    @property
    def docente(self) -> Docente:
        return self.__docente

class Universidad:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__carreras: List['Carrera'] = []
        self.__alumnos: List['Alumno'] = []
        self.__catedras: List['Catedra'] = []
        self.__comisiones: List['Comision'] = []
        self.__docentes: List['Docente'] = []
