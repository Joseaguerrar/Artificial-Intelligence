% Tarea 5
%- José Guerra Rodríguez: C33510
%- Jerson Bonilla Fernández: C31225
%- Jose Raúl Martínez Quesada: C34637

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

%%%%%%% Papá %%%%%%%
% X es papá de Y (es pom y es hombre)
papa(X, Y) :- pom(X, Y), hombre(X).

%%%%%%% Mamá %%%%%%%
% X es mamá de Y (es pom y es mujer)
mama(X, Y) :- pom(X, Y), mujer(X).

%%%%%%% Hermanos %%%%%%%
% X es hermano o hermana de Y (comparten padres o madres)
hermanx(X, Y) :- pom(Z, X), pom(Z, Y) , X \= Y.

% X es hermano de Y (son hermanxs y es hombre)
hermano(X, Y) :- hermanx(X, Y), hombre(X).

% X es hermana de Y (son hermanxs y es mujer)
hermana(X, Y) :- hermanx(X, Y), mujer(X).

%%%%%%% Hermanos totales %%%%%%%
% X es hermano o hermana total de Y (comparten papá y mamá)
hermanxtotal(X, Y) :- papa(Z, X), papa(Z, Y), mama(A, X), mama(A, Y), X \= Y.

% X es hermanx total de Y y X es mujer
hermanatotal(X, Y) :- hermanxtotal(X, Y), mujer(X).

% X es hermanx total de Y y X es hombre
hermanatotal(X, Y) :- hermanxtotal(X, Y), hombre(X).

%%%%%%% Medio hermanos %%%%%%%
% X es medio hermano o media hermana de Y (son hermanos pero no totales)
mediohermanx(X, Y) :- hermanx(X, Y), \+ hermanxtotal(X,Y).

% X es mediohermanx de Y y X es mujer
mediahermana(X, Y) :- mediohermanx(X, Y), mujer(X).

% X es mediohermanx de Y y X es hombre
mediohermano(X, Y) :- mediohermanx(X, Y), hombre(X).

%%%%%%% Primos %%%%%%%
% X es primo o prima de Y (el papá o mamá de X es hermanx del papá o mamá de Y)
primx(X, Y) :- (pom(Z, X), hermanx(Z, W), pom(W, Y)), X \= Y.

% X es prima de Y (son primos y X es mujer)
prima(X, Y) :- primx(X, Y), mujer(X).

% X es primo de Y (son primos y X es hombre)
primo(X, Y) :- primx(X, Y), hombre(X).

%%%%%%% Primos segundos %%%%%%%
% X es primo o prima segunda de Y si los progenitores de ambos son primos
primx_segundo(X, Y) :- pom(Z, X), pom(W, Y), primx(Z, W), X \= Y.

% X es primo segundo de Y (son primos segundos y X es hombre)
primo_segundo(X, Y) :- primx_segundo(X, Y), hombre(X).

% X es prima segunda de Y (son primos segundos y X es mujer)
prima_segunda(X, Y) :- primx_segundo(X, Y), mujer(X).

%%%%%%% Tíos %%%%%%%
% X es tío o tía de Y (X es hermanx de Z y Z es pom de Y)
tix(X, Y) :- (hermanx(X, Z), pom(Z, Y)).

% X es tía de Y (X es tix de Y, y X es mujer)
tia(X, Y) :- tix(X, Y), mujer(X).

% X es tío de Y (X es tix de Y, y X es hombre)
tio(X, Y) :- tix(X, Y), hombre(X).

%%%%%% Sobrinos %%%%%%%
% X es sobrino o sobrina de Y (Y es tix de X)
sobrinx(X, Y) :- tix(Y, X).

% X es sobrina de Y si Y es tix de X, y X es mujer
sobrina(X, Y) :- sobrinx(X, Y), mujer(X).

% X es sobrino de Y si Y es tix de X, y X es hombre
sobrino(X, Y) :- sobrinx(X, Y), hombre(X).

%%%%%%% Abuelos %%%%%%%
% X es abuelo de Y (X es pom de Z y Z es pom de Y)
abuelx(X, Y) :- pom(X, Z), pom(Z, Y).

% X es abuelo de Y si es abuelo o abuela y es hombre.
abuelo(X, Y) :- abuelx(X, Y), hombre(X).

% X es abuela de Y si es abuelo o abuela y es mujer.
abuela(X, Y) :- abuelx(X, Y), mujer(X).

%%%%%%% Bisabuelos %%%%%%%
% X es bisabuelo o bisabuela de Y (X es abuelx de Z y Z es pom de Y)
bisabuelx(X, Y) :- abuelx(X, Z), pom(Z, Y).

% X es bisabuela de Y si X es bisabuelx y es mujer.
bisabuela(X, Y) :- bisabuelx(X, Y), mujer(X).

% X es bisabuelo de Y si X es bisabuelx y es hombre.
bisabuelo(X, Y) :- bisabuelx(X, Y), hombre(X).

%%%%%%% Suegros %%%%%%%
% X es suegro o suegra de Y (X es pom de Z y Z es pareja de Y)
suegrx(X, Y) :- pom(X, Z), pareja(Z, Y).

% X es suegra de Y si X es suegrx y es mujer.
suegra(X, Y) :- suegrx(X, Y), mujer(X).

% X es suegro de Y si X es suegrx y es hombre.
suegro(X, Y) :- suegrx(X, Y), hombre(X).

%%%%%%% Reglas auxilares %%%%%%%

% X es pareja de Y: suponemos que dos personas son pareja si comparten al menos un/a hijx
pareja(X, Y) :- pom(X, Z), pom(Y, Z), X \= Y.

% H es Hijo/Hija de P si P es pom de H.
hijx(H, P) :- pom(P, H).

% Tiene_hijxs: cierta persona tiene al menos un/a hijx (se ocupa para cuñadx)
tiene_hijxs(X) :- pom(X, _).

%%%%%%% Tíos políticos %%%%%%%
% 1. Pareja de un tío o tía.
% 2. Hermanx de la pareja de un progenitor

% X es tíx político de Y si X es la pareja de Z y
% Z es tío o tía de Y. También si P es progenitor
% de Y, P es pareja de S, y X y S son hermanos.
tix_politico(X, Y) :- (pareja(X, Z), tix(Z, Y));  
    (pom(P, Y), pareja(P, S), \+ pom(S, Y), hermanx(X, S)).

% Tío político
tio_politico(X, Y)  :- tix_politico(X, Y), hombre(X).

% Tía política
tia_politica(X, Y)  :- tix_politico(X, Y), mujer(X).

%%%%%%% Cuñadx (que tenga hijxs)%%%%%%%
% 1. Hermanx de la pareja
% 2. Pareja de hermanox

% X es cuñadx de Y si Y es pareja de Z y X es hermano de Z
% o si X es pareja de Z y Z es hermanx de Y.
cunhadx(X, Y) :- ((pareja(Y, Z), hermanx(X, Z));
    (hermanx(Z, Y), pareja(X, Z))),
    tiene_hijxs(X).

% X es cuñado de Y si es cuñado o cuñada y es hombre.
cunhado(X, Y) :- cunhadx(X, Y), hombre(X).

% X es cuñado de Y si es cuñado o cuñada y es mujer.
cunhada(X, Y) :- cunhadx(X, Y), mujer(X).