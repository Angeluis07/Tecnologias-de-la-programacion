import datetime
from typing import List

mercosur = ["Argentina","Brasil","Paraguay","Uruguay","Venezuela","Bolivia"]

class Estado:
    def descripcion(self):
        pass

class Nuevo(Estado):
    def __init__(self):
        self.__kilometraje = 0

    @property
    def kilometraje(self):
        return self.__kilometraje

    def descripcion(self):
        return "Vehiculo Nuevo (0 km)"

class Usado(Estado):
    def __init__(self, nombre, apellido, tel, kilometraje):
        self.__nombre = nombre
        self.__apellido = apellido
        self.__tel = tel
        self.__kilometraje = kilometraje

    def descripcion(self):
        return f"Vehiculo Usado ({self.__kilometraje} km)"

    @property
    def nombre(self):
        return self.__nombre

    @nombre.setter
    def nombre(self, nombre):
        self.__nombre = nombre

    @property
    def apellido(self):
        return self.__apellido

    @apellido.setter
    def apellido(self, apellido):
        self.__apellido = apellido

    @property
    def tel(self):
        return self.__tel

    @tel.setter
    def tel(self, tel):
        self.__tel = tel

    @property
    def kilometraje(self):
        return self.__kilometraje

    @kilometraje.setter
    def kilometraje(self, kilometraje):
        self.__kilometraje = kilometraje

class Vehiculo:
    def __init__(self, marca, modelo, patente, precio, estado: Estado):
        self._marca = marca
        self._modelo = modelo
        self._patente = patente
        self._precio = precio
        self._estado = estado

    def calcular_precio_venta(self) -> int:
        return self._precio

    def generar_detalle(self) -> str:
        return "..."

    @property
    def marca(self):
        return self._marca

    @marca.setter
    def marca(self, marca):
        self._marca = marca

    @property
    def modelo(self):
        return self._modelo

    @modelo.setter
    def modelo(self, modelo):
        self._modelo = modelo

    @property
    def patente(self):
        return self._patente

    @patente.setter
    def patente(self, patente):
        self._patente = patente

    @property
    def precio(self):
        return self._precio

    @precio.setter
    def precio(self, precio):
        self._precio = precio

    @property
    def estado(self):
        return self._estado

    @estado.setter
    def estado(self, estado):
        self._estado = estado

class AutoNacional(Vehiculo):
    def __init__(self, marca, modelo, patente, precio, estado: Estado, provincia):
        super().__init__(marca,modelo,patente,precio,estado)
        self.__provincia = provincia

    def calcular_precio_venta(self):
        return self._precio

    @property
    def provincia(self):
        return self.__provincia

    @provincia.setter
    def provincia(self, provincia):
        self.__provincia = provincia

    def generar_detalle(self):
        return f"Marca: {self._marca}, Modelo: {self._modelo}, Patente: {self._patente}, Estado: {self._estado.descripcion()}"

class AutoImportado(Vehiculo):
    def __init__(self, marca, modelo, patente, precio, estado: Estado, pais_origen, impuesto):
        super().__init__(marca,modelo,patente,precio,estado)
        self.__pais_origen = pais_origen
        self.__impuesto = impuesto

    def calcular_precio_venta(self) -> int:
        if self.__pais_origen not in mercosur:
            return self._precio + self.__impuesto
        else:
            return self._precio + (self.__impuesto * 0.6)

    def generar_detalle(self):
        return f"Marca: {self._marca}, Modelo: {self._modelo}, Patente: {self._patente}, Estado: {self._estado.descripcion()}"

    @property
    def pais_origen(self):
        return self.__pais_origen

    @property
    def impuesto(self):
        return self.__impuesto

    @impuesto.setter
    def impuesto(self, impuesto):
        self.__impuesto = impuesto

class Camioneta(Vehiculo):
    def __init__(self, marca, modelo, patente, precio, estado: Estado, traccion):
        super().__init__(marca,modelo,patente,precio,estado)
        self.__traccion = traccion

    def calcular_precio_venta(self):
        return self.__precio

    @property
    def traccion(self):
        return self.__traccion

    @traccion.setter
    def traccion(self, traccion):
        self.__traccion = traccion



class Motocicleta(Vehiculo):
    def __init__(self, marca, modelo, patente, precio, estado: Estado, cilindrada):
        super().__init__(marca,modelo,patente,precio,estado)
        self.__cilindrada = cilindrada

    def calcular_precio_venta(self):
        return self.__precio

    @property
    def cilindrada(self):
        return self.__cilindrada

    @cilindrada.setter
    def cilindrada(self, cilindrada):
        self.__cilindrada = cilindrada

class Venta:
    def __init__(self, vehiculo: Vehiculo, fecha: datetime.date, apellido, nombre, dni):
        self.__vehiculo = vehiculo
        self.__precio_venta = vehiculo.calcular_precio_venta()
        self.__detalles = vehiculo.generar_detalle()
        self.__fecha = fecha
        self.__apellido_comprador = apellido
        self.__nombre_comprador = nombre
        self.__dni_comprador = dni

    @property
    def vehiculo(self):
        return self.__vehiculo

    @vehiculo.setter
    def vehiculo(self, vehiculo):
        self.__vehiculo = vehiculo

    @property
    def precio_venta(self):
        return self.__precio_venta

    @precio_venta.setter
    def precio_venta(self, precio_venta):
        self.__precio_venta = precio_venta

    @property
    def detalles(self):
        return self.__detalles

    @detalles.setter
    def detalles(self, detalles):
        self.__detalles = detalles

    @property
    def fecha(self):
        return self.__fecha

    @fecha.setter
    def fecha(self, fecha):
        self.__fecha = fecha

    @property
    def apellido_comprador(self):
        return self.__apellido_comprador

    @apellido_comprador.setter
    def apellido_comprador(self, apellido):
        self.__apellido_comprador = apellido

    @property
    def nombre_comprador(self):
        return self.__nombre_comprador

    @nombre_comprador.setter
    def nombre_comprador(self, nombre):
        self.__nombre_comprador = nombre

    @property
    def dni_comprador(self):
        return self.__dni_comprador

    @dni_comprador.setter
    def dni_comprador(self, dni):
        self.__dni_comprador = dni

class Concesionaria:
    def __init__(self, nombre):
        self.__nombre = nombre
        self.__ventas: List[Venta] = []

    def agregar_venta(self,venta: Venta):
        self.__ventas.append(venta)

    def calcular_total_usados_nacionales(self) -> int:
        total = 0
        for venta in self.__ventas:
            if(isinstance(venta.vehiculo,AutoNacional) and isinstance(venta.vehiculo.estado,Usado)):
                total = total + venta.vehiculo.calcular_precio_venta()
        return total


if __name__ == '__main__':

    auto_1 = AutoImportado("Mercedes","GLE","ABC123",20000,Usado("Junior","Albarenque","343555555",22000),"Chile",3000)
    auto_2 = AutoImportado("Peugeot","504","ZXC789",5000,Nuevo(),"Brasil",3000)

    auto_3 = AutoNacional("Renault","12","JKL654",6000,Nuevo(),"Entre Rios")
    auto_4 = AutoNacional("Citroen","C3","QWE123",7000,Usado("Pedro","Sanchez","32123421",50000),"Santa Cruz")

    print(auto_1.generar_detalle())
    print(auto_1.calcular_precio_venta())

    print(auto_2.generar_detalle())
    print(auto_2.calcular_precio_venta())

    print(auto_3.generar_detalle())
    print(auto_3.calcular_precio_venta())

    print(auto_4.generar_detalle())
    print(auto_4.calcular_precio_venta())



    hoy = datetime.datetime.today()

    venta_1 = Venta(auto_1,hoy,"Palacios","Angel","20000000")
    venta_2 = Venta(auto_2,hoy,"Palacios","Angel","20000000")
    venta_3 = Venta(auto_3,hoy,"Palacios","Angel","20000000")
    venta_4 = Venta(auto_4,hoy,"Palacios","Angel","20000000")

    conc = Concesionaria("Pepe")
    conc.agregar_venta(venta_1)
    conc.agregar_venta(venta_2)
    conc.agregar_venta(venta_3)
    conc.agregar_venta(venta_4)

    print(conc.calcular_total_usados_nacionales())
