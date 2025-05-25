from typing import List
import datetime

def dias_habiles(fecha_desde: datetime.date, fecha_hasta: datetime.date, feriados: list) -> int:
    # Lista de días hábiles (lunes=0, ..., viernes=4)
    dias_habiles = 0
    dia_actual = fecha_desde

    while dia_actual <= fecha_hasta:
        # Verificar si el día es hábil (lunes a viernes) y no es feriado
        if dia_actual.weekday() < 5 and dia_actual not in feriados:
            dias_habiles += 1
        dia_actual += datetime.timedelta(days=1)

    return dias_habiles

feriados = [
    datetime.date(2023, 5, 1),  # Día del trabajador
    datetime.date(2023, 5, 8)   # Ejemplo de otro feriado
]

class Empresa:
    def __init__(self,nombre):
        self.__nombre = nombre
        self.__trabajadores: List[Trabajador] = []

    def agregar_trabajador(self, nuevo_trabajador: 'Trabajador'):
        self.__trabajadores.append(nuevo_trabajador)

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre):
        self.__nombre = nuevo_nombre

    @property
    def trabajadores(self) -> List['Trabajador']:
        return self.__trabajadores

class Trabajador:
    def __init__(self, nombre, apellido, direccion, dni):
        self.__nombre = nombre
        self.__apellido = apellido
        self.__direccion = direccion
        self.__dni = dni

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre: str):
        self.__nombre = nuevo_nombre

    @property
    def apellido(self):
        return self.__apellido

    @apellido.setter
    def apellido(self, nuevo_apellido: str):
        self.__apellido = nuevo_apellido

    @property
    def direccion(self):
        return self.__direccion

    @direccion.setter
    def direccion(self, nueva_direccion: str):
        self.__direccion = nueva_direccion

    @property
    def dni(self):
        return self.__dni

    @dni.setter
    def dni(self, nuevo_dni: str):
        self.__dni = nuevo_dni

    def __calcular_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        pass

    def mostrar_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        return self.__calcular_salario(fecha_desde,fecha_hasta)

class Categoria:
    def __init__(self, nombre, monto):
        self.__nombre = nombre
        self.__monto = monto

    @property
    def monto(self):
        return self.__monto

    @monto.setter
    def monto(self, nuevo_monto: float):
        self.__monto = nuevo_monto

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nuevo_nombre: str):
        self.__nombre = nuevo_nombre

class Jefe(Trabajador):
    def __init__(self, nombre, apellido, direccion, dni, salario_fijo):
        super().__init__(nombre, apellido, direccion, dni)
        self.__salario_fijo = salario_fijo

    def __calcular_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        # Calcular la diferencia en años y meses
        anos = fecha_hasta.year - fecha_desde.year
        meses = fecha_hasta.month - fecha_desde.month
        # Convertir todo a meses
        total_meses = anos * 12 + meses
        return self.__salario_fijo*total_meses

    def mostrar_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        print(self.__calcular_salario(fecha_desde,fecha_hasta))

class Mensualizado(Trabajador):
    def __init__(self, nombre, apellido, direccion, dni, cat: Categoria, jefe: Jefe):
        super().__init__(nombre, apellido, direccion, dni)
        self.__jefe = jefe
        self.__cat = cat
        #Solo para que no joda el Pylint vvv
        print(self.__jefe.direccion)

    def __calcular_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        # Calcular la diferencia en años y meses
        anos = fecha_hasta.year - fecha_desde.year
        meses = fecha_hasta.month - fecha_desde.month
        # Convertir todo a meses
        total_meses = anos * 12 + meses
        return self.__cat.monto*total_meses

    def mostrar_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        print(self.__calcular_salario(fecha_desde,fecha_hasta))

class Jornalizado(Trabajador):
    def __init__(self, nombre, apellido, direccion, dni, salario, jefe: Jefe):
        super().__init__(nombre, apellido, direccion, dni)
        self.__jefe = jefe
        self.__salario = salario
        #Solo para que no joda el Pylint vvv
        print(self.__jefe.direccion)

    def __calcular_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        dias = dias_habiles(fecha_desde,fecha_hasta,feriados)
        horas_trabajadas = dias*8
        if horas_trabajadas <= 40:
            return horas_trabajadas * self.__salario
        else:
            horas_extras = horas_trabajadas - 40
            return self.__salario * 40 + horas_extras * (self.__salario * 0.7)

    def mostrar_salario(self, fecha_desde: datetime.date, fecha_hasta: datetime.date):
        print(self.__calcular_salario(fecha_desde,fecha_hasta))

if __name__ == "__main__":
    fecha_desde = datetime.date(2023, 5, 1)
    fecha_hasta = datetime.date(2025, 4, 1)

    categoria_A = Categoria("A",1500)

    jefe_1 = Jefe("Angel","Palacios","Gob. 2630","44556041",2000)
    empleado_1 = Mensualizado("Juan","Quiroga","Av. 264","50000000",categoria_A,jefe_1)
    empleado_2 = Jornalizado("Enrique","Sanchez","Bv. 777","24354882",8,jefe_1)

    empresa_1 = Empresa("VSC")
    empresa_1.agregar_trabajador(jefe_1)
    empresa_1.agregar_trabajador(empleado_1)
    empresa_1.agregar_trabajador(empleado_2)

    for empleado in empresa_1.trabajadores:
        empleado.mostrar_salario(fecha_desde,fecha_hasta)
