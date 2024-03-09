# Funcion para verificar si es seguro colocar una reina en la posicion (fila, columna) del tablero
def es_seguro(tablero, fila, columna):
    # Comprobar si hay una reina en la misma columna
    for i in range(fila):
        if tablero[i] == columna:
            return False
    
    # Comprobar diagonal superior izquierda
    for i, j in zip(range(fila, -1, -1), range(columna, -1, -1)):
        if tablero[i] == j:
            return False
    
    # Comprobar diagonal superior derecha
    for i, j in zip(range(fila, -1, -1), range(columna, len(tablero))):
        if tablero[i] == j:
            return False
    
    return True

# Funcion para resolver el problema de las n reinas recursivamente
def resolver(tablero, fila):
    if fila == len(tablero):  # Si todas las reinas han sido colocadas
        return True
    
    for columna in range(len(tablero)):
        if es_seguro(tablero, fila, columna):  # Verificar si es seguro colocar una reina en esta posicion
            tablero[fila] = columna  # Colocar una reina en la posicion (fila, columna)
            if resolver(tablero, fila + 1):  # Llamar recursivamente para la siguiente fila
                return True
            tablero[fila] = -1  # Si no se encuentra una solucion, retroceder y probar otra columna
    
    return False

# Funcion principal para resolver el problema de las n reinas
def resolver_n_reinas(n):
    tablero = [-1] * n  # Inicializar el tablero con -1 para indicar que ninguna reina ha sido colocada
    if resolver(tablero, 0):  # Llamar a la funcion resolver
        print("Solucion encontrada:")
        for fila in range(n):
            fila_str = ['♕' if tablero[fila] == columna else '□' for columna in range(n)]  # Representar las reinas como '♕' y los espacios vacíos como '□'
            print(' '.join(fila_str))  # Imprimir el tablero
    else:
        print("No se encontro solucion.")  # Si no se encuentra ninguna solucion valida

# Resolver el problema de las 8 reinas
resolver_n_reinas(8)