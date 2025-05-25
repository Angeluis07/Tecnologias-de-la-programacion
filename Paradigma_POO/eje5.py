from datetime import date
from typing import List


class Cliente:
    def __init__(self, nombre: str, cuit: str):
        self.__nombre = nombre
        self.__cuit = cuit

    def __str__(self):
        return f"{self.__nombre} - CUIT: {self.__cuit}"


class DetalleFactura:
    def __init__(self, descripcion: str, cantidad: int, precio_unitario: float):
        self.__descripcion = descripcion
        self.__cantidad = cantidad
        self.__precio_unitario = precio_unitario

    def subtotal(self) -> float:
        return self.__cantidad * self.__precio_unitario

    def __str__(self):
        return f"{self.__descripcion} - {self.__cantidad} unid. - Total Item: ${self.subtotal():.2f}"


class Factura:
    def __init__(self, numero: str, client: Cliente, fecha: date):
        self.__numero = numero
        self.__cliente = client
        self.__fecha = fecha
        self.__detalles: List[DetalleFactura] = []

    def agregar_detalle(self, detalle: DetalleFactura):
        self.__detalles.append(detalle)

    def total(self) -> float:
        return sum(detalle.subtotal() for detalle in self.__detalles)

    def __str__(self):
        detalles_str = "\n".join([f"  - {detalle}" for detalle in self.__detalles])
        return (
            f"Factura nro {self.__numero}\n"
            f"Cliente: {self.__cliente}\n"
            f"Fecha: {self.__fecha}\n"
            f"Total: ${self.total():.2f}\n"
            f"Detalles:\n{detalles_str}"
        )


class Empresa:
    def __init__(self, nombre: str, tipo_iva: str):
        self.__nombre = nombre
        self.__tipo_iva = tipo_iva
        self.__facturas: List[Factura] = []

    def agregar_factura(self, factura: Factura):
        self.__facturas.append(factura)

    def total_facturas(self) -> float:
        return sum(factura.total() for factura in self.__facturas)

    def __str__(self):
        facturas_str = "\n\n".join([str(factura) for factura in self.__facturas])
        return (
            f"Nombre de la Empresa: {self.__nombre} - IVA: {self.__tipo_iva}\n\n"
            f"Facturas:\n{facturas_str}\n\n"
            f"Total acumulado de todas las facturas: ${self.total_facturas():.2f}"
        )


# Ejemplo de uso
if __name__ == "__main__":
    # Crear cliente
    cliente = Cliente("Gilcomat SRL", "30-12345678-1")

    # Crear factura
    factura = Factura("0001-0100", cliente, date(2015, 5, 1))
    factura.agregar_detalle(DetalleFactura("Porcelanato 45x45", 100, 6.0))
    factura.agregar_detalle(DetalleFactura("Grifería FV", 1, 400.0))

    # Crear empresa y agregar factura
    empresa = Empresa("Mayorista S.A.", "Monotributo")
    empresa.agregar_factura(factura)

    # Mostrar información
    print(empresa)
