"""
Este módulo define las funciones básicas de una calculadora
"""
AUTORES = ""


def sumar(a, b):
    """
    Suma dos números y devuelve el resultado.
    """
    return a + b


def restar(a, b):
    """
    Resta dos números y devuelve el resultado.
    """
    return a - b


def multiplicar(a, b):
    """
    Multiplica dos números y devuelve el resultado.
    """
    return a * b


def dividir(a, b):
    """
    Divide dos números y devuelve el resultado.
    """
    if b == 0:
        raise ZeroDivisionError("No se puede dividir por cero")
    return a / b
