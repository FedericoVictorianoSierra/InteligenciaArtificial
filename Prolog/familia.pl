% Hechos
hombre(antonio).
hombre(juan).
hombre(luis).
hombre(rodrigo).
hombre(ricardo).
mujer(isabel).
mujer(ana).
mujer(marta).
mujer(carmen).
mujer(laura).
mujer(alicia).

% Hechos que definen las relaciones familiares
matrimonio(antonio, ana).
matrimonio(juan, carmen).
matrimonio(luis, isabel).
matrimonio(rodrigo, laura).

hijo(juan, antonio).
hijo(juan, ana).
hijo(rodrigo, antonio).
hijo(rodrigo, ana).
hijo(marta, antonio).
hijo(marta, ana).

hijo(carmen, luis).
hijo(carmen, isabel).

hijo(ricardo, juan).
hijo(ricardo, carmen).

hijo(alicia, rodrigo).
hijo(alicia, isabel).

% Regla para matrimonio reflexivo
matrimonio_reflexivo(X, Y) :-
    matrimonio(X, Y);
    matrimonio(Y, X).

% Regla para obtener los nietos de una persona
nieto(Nieto, Abuelo) :-
    hijo(Nieto, Padre),
    hijo(Padre, Abuelo).

% Regla para obtener los abuelos de una persona
abuelo(Abuelo, Nieto) :-
    nieto(Nieto, Abuelo).

% Regla para obtener los hermanos de una persona
hermano(Hermano1, Hermano2) :-
    hijo(Hermano1, Padre),
    hijo(Hermano2, Padre),
    Hermano1 \= Hermano2.

% Regla para obtener los tíos de una persona
tio(Tio, Sobrino) :-
    hijo(Sobrino, Padre),
    hermano(Tio, Padre).

% Regla para obtener las tías de una persona
tia(Tia, Sobrino) :-
    mujer(Tia),
    tio(Tia, Sobrino).

% Regla para obtener los primos de una persona
primo(Primo, Persona) :-
    hijo(Persona, Padre),
    tio(Tio, Persona),
    hijo(Primo, Tio),
    Primo \= Persona.

% Regla para obtener las primas de una persona
prima(Prima, Persona) :-
    mujer(Prima),
    primo(Prima, Persona).

% Regla para obtener los suegros de una persona
suegro(Suegro, Persona) :-
    matrimonio(Suegro, Hijx),
    hijo(Persona, Hijx),
    hombre(Suegro).

suegra(Suegra, Persona) :-
    matrimonio(Suegra, Hijx),
    hijo(Persona, Hijx),
    mujer(Suegra).



% Preguntas sobre la familia
%?- hijo(Hijo, antonio), hijo(Hijo, ana). %  ¿Quiénes son los hijos de Antonio y Ana?
%?- hijo(Hijo, luis), hijo(Hijo, isabel). %  ¿Quiénes son los hijos de Luis e Isabel?
%?- hijo(carmen, Padre), hijo(carmen, Madre). % ¿Quiénes son los padres de Carmen?
%?- hermano(Hermano, juan). %  ¿Quiénes son los hermanos de Juan?
%?- tio(Tio, alicia). % ¿Quiénes son los tíos de Alicia?
%?- prima(Prima, marta). % ¿Quiénes son las primas de Marta?
%?- (suegro(Suegro, ricardo) ; suegra(Suegra, ricardo)). % ¿Quiénes son los suegros de Ricardo?

% consult('C:/Users/feder/Documents/Prolog/familia.pl').
