% Facts

% Hombres 
hombre(ruben).
hombre(david).
hombre(caleb).
hombre(esteban).
hombre(samuel).
hombre(andres).
hombre(roy).
hombre(oscar2).
hombre(jeancarlos).
hombre(daniel).
hombre(juan).
hombre(erick).
hombre(oscar).
hombre(diego).
hombre(noe).
hombre(luis).
hombre(virgilio).
hombre(olman).
hombre(gollo).
hombre(wilis).
hombre(alvaro).
hombre(kenneth).

% Mujeres
mujer(china).
mujer(andrea).
mujer(gabriela).
mujer(ariana).
mujer(wilisa).
mujer(maricruz).
mujer(kattia).
mujer(marisol).
mujer(raquel).
mujer(ruth).
mujer(desire).
mujer(carmen).
mujer(ruthb).
mujer(leonarda).

% Padre de o madre de
pom(ruth, samuel).
pom(ruth, esteban).
pom(luis, samuel).
pom(luis, esteban).
pom(desire, andres).
pom(desire, china).
pom(noe, andres).
pom(noe, china).
pom(china, caleb).
pom(roy, caleb).
pom(raquel, david).
pom(raquel, ruben).
pom(diego, david).
pom(diego, ruben).
pom(marisol, oscar2).
pom(marisol, jeancarlos).
pom(oscar, oscar2).
pom(oscar, jeancarlos).
pom(kattia, andrea).
pom(erick, andrea).
pom(maricruz, gabriela).
pom(maricruz, daniel).
pom(juan, gabriela).
pom(juan, daniel).
pom(wilis, alvaro).
pom(wilis, ariana).
pom(wilisa, alvaro).
pom(wilisa, ariana).
pom(carmen, diego).
pom(carmen, kattia).
pom(carmen, maricruz).
pom(carmen, marisol).
pom(carmen, wilis).
pom(olman, diego).
pom(olman, kattia).
pom(olman, maricruz).
pom(olman, marisol).
pom(olman, wilis).
pom(olman, kenneth).
pom(ruthb, noe).
pom(ruthb, ruth).
pom(ruthb, raquel).
pom(virgilio, noe).
pom(virgilio, ruth).
pom(virgilio, raquel).
pom(gollo, virgilio).
pom(leonarda, virgilio).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rules

% X es papá de Y (es pom y es hombre)
papa(X, Y) :- pom(X, Y), hombre(X).

% X es mamá de Y (es pom y es mujer)
mama(X, Y) :- pom(X, Y), mujer(X).

% X es hermano o hermana de Y (comparten padres o madres)
hermanx(X, Y) :- pom(Z, X), pom(Z, Y) , X \= Y.

% X es hermano de Y (son hermanxs y es hombre)
hermano(X, Y) :- hermanx(X, Y), hombre(X).

% X es hermana de Y (son hermanxs y es mujer)
hermana(X, Y) :- hermanx(X, Y), mujer(X).

% X es hermano o hermana total de Y (comparten papá y mamá)
hermanxtotal(X, Y) :- papa(Z, X), papa(Z, Y) , mama(A, X), mama(A, Y).

% X es medio hermano o media hermana de Y (son hermanos pero no totales)
mediohermanx(X, Y) :- hermanx(X, Y), \+ hermanxtotal(X,Y).

% X es abuelo de Y (X es pom de Z y Z es pom de Y)
abuelx(X, Y) :- pom(X, Z), pom(Z, Y).


%%%%%%% Reglas auxilares %%%%%%%

% X es pareja de Y: suponemos que dos personas son pareja si comparten al menos un/a hijx
pareja(X, Y) :- pom(X, Z), pom(Y, Z), X \= Y.

% H es Hijo/Hija de P si P es pom de H.
hijx(H, P) :- pom(P, H).

% tiene_hijxs: cierta persona tiene al menos un/a hijx (se ocupa para cuñadx)
tiene_hijxs(X) :- pom(X, _).

%%%%%%% Abuelos %%%%%%%
% X es abuelo de Y si es abuelo o abuela y es hombre.
abuelo(X, Y) :- abuelx(X, Y), hombre(X).

% X es abuela de Y si es abuelo o abuela y es mujer.
abuela(X, Y) :- abuelx(X, Y), mujer(X).

%%%%%%% Cuñadx (que tenga hijxs)%%%%%%%
% 1. Hermanx de la pareja
% 2. Pareja de hermanox

% X es cuñadx de Y si Y es pareja de Z y X es hermano de Z
% o si X es pareja de Z y Z es hermanx de Y.
cunnadx(X, Y) :- (pareja(Y, Z), hermanx(X, Z));
    (hermanx(Z, Y), pareja(X, Z)).

% X es cuñado de Y si es cuñado o cuñada y es hombre.
cunnado(X, Y) :- cunnadx(X, Y), hombre(X).

% X es cuñado de Y si es cuñado o cuñada y es mujer.
cunnada(X, Y) :- cunnadx(X, Y), mujer(X).