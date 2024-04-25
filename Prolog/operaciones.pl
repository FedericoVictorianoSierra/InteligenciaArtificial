% Mínimo de dos números
minimo(X, Y, Min) :-
    X =< Y,
    Min is X.
minimo(X, Y, Min) :-
    Y < X,
    Min is Y.

% Área de un círculo
area_circulo(Radio, Area) :-
    Area is pi * Radio * Radio.

% Área de un trapecio
area_trapecio(Base1, Base2, Altura, Area) :-
    Area is (Base1 + Base2) * Altura / 2.

% Producto de los números comprendidos entre dos dados
producto_entre(X, Y, Producto) :-
    X =< Y,
    producto_entre_aux(X, Y, Producto).
producto_entre(X, Y, Producto) :-
    Y < X,
    producto_entre_aux(Y, X, Producto).

producto_entre_aux(X, Y, Producto) :-
    X =:= Y,
    Producto is X.
producto_entre_aux(X, Y, Producto) :-
    X < Y,
    Next is X + 1,
    producto_entre_aux(Next, Y, Resto),
    Producto is X * Resto.



% Preguntas para "Mínimo de dos números"
%?- minimo(3, 7, Min). % ¿Cuál es el mínimo entre 3 y 7?
%?- minimo(12, 5, Min). % ¿Cuál es el mínimo entre 12 y 5?
%?- minimo(-1, 10, Min). % ¿Cuál es el mínimo entre -1 y 10?

% Preguntas para "Área de un círculo"
%?- area_circulo(5, Area). % ¿Cuál es el área de un círculo con radio 5?
%?- area_circulo(10, Area). % ¿Cuál es el área de un círculo con radio 10?

% Preguntas para "Área de un trapecio"
%?- area_trapecio(3, 5, 4, Area). % ¿Cuál es el área de un trapecio con bases 3 y 5 y altura 4?
%?- area_trapecio(7, 9, 6, Area). % ¿Cuál es el área de un trapecio con bases 7 y 9 y altura 6?

% Preguntas para "Producto de los números comprendidos entre dos dados"
%?- producto_entre(2, 5, Producto). % ¿Cuál es el producto de los números entre 2 y 5?
%?- producto_entre(1, 10, Producto). % ¿Cuál es el producto de los números entre 1 y 10?

%halt