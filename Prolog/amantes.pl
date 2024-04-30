% Hechos
ama(juan, ana).
ama(ana, miguel).
ama(luis, isabel).
ama(miguel, ana).
ama(laura, juan).
ama(isabel, luis).

% Regla para identificar amantes mutuos
amantes_mutuos(X, Y) :-
    ama(X, Y),
    ama(Y, X).

% Regla para identificar personas que aman sin ser correspondidas
sin_correspondencia(X) :-
    ama(X, Y),
    \+ ama(Y, X).

% Preguntas
%?- ama(juan, Quien). % ¿A quién ama Juan? R=ana
%?- ama(Quien, ana). % ¿Quién ama a Ana? R=juan
%?- ama(Alguien, _). % ¿Quién ama a alguien? 
%?- ama(_, Alguien). % ¿Quién es amado por alguien?
%?- amantes_mutuos(X, Y). % ¿Quiénes se aman mutuamente?
%?- sin_correspondencia(X). % ¿Quién ama sin ser correspondido?
