% =======================================
% Sistema de consultas para saloneros de restaurante
% =======================================

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% INGREDIENTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ingredientes del restaurante
ingrediente(lomito).
ingrediente(pollo).
ingrediente(pescado).
ingrediente(leche).
ingrediente(mantequilla).
ingrediente(arroz).
ingrediente(frijoles).
ingrediente(pasta).
ingrediente(tomate).
ingrediente(lechuga).
ingrediente(huevo).
ingrediente(miel).
ingrediente(chile).
ingrediente(maiz).
ingrediente(zucchini).
ingrediente(hongos).
ingrediente(cebolla).
ingrediente(sal).
ingrediente(queso).
ingrediente(repollo).
ingrediente(oregano).
ingrediente(apio).
ingrediente(remolacha).
ingrediente(atun).
ingrediente(papa).
ingrediente(aceite).
ingrediente(tofu).
ingrediente(leche_de_almendra).
ingrediente(cafe).
ingrediente(chocolate).
ingrediente(agua).
ingrediente(vinagre).
ingrediente(fresas).

% Clasificación de carnes
carne(lomito).
carne(pollo).
carne(pescado).
carne(atun).

% Productos de origen animal
origen_animal(lomito).
origen_animal(pollo).
origen_animal(pescado).
origen_animal(leche).
origen_animal(mantequilla).
origen_animal(huevo).
origen_animal(miel).
origen_animal(queso).
origen_animal(atun).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLATOS BÁSICOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plato(pasta_basica, [pasta, oregano, tomate, aceite, sal]).
plato(hongos_al_horno, [hongos, queso, mantequilla, sal]).
plato(ensalada_cesar, [lechuga, tomate, sal, vinagre]).
plato(helado, [miel, leche, fresas]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PLATOS ESPECIALES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Un plato especial = carne principal + acompañamiento
principal(pollo).
principal(lomito).
principal(pescado).
principal(atun).
principal(hongos).

acompanamiento(papa).
acompanamiento(hongos).
acompanamiento(zucchini).
acompanamiento(arroz).

% Definición de platos especiales: se generan combinando
plato(especial(Principal, Acompanamiento),
      [Principal, cebolla, sal, vinagre, Acompanamiento]) :-
    principal(Principal),
    acompanamiento(Acompanamiento).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RESTRICCIONES: VEGETARIANOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Un plato es vegetariano si ninguno de sus ingredientes es carne
vegetariano(Plato) :-
    plato(Plato, Ingredientes),
    \+ (member(Ingrediente, Ingredientes), carne(Ingrediente)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RESTRICCIONES: VEGANOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Un plato es vegano si ninguno de sus ingredientes es de origen animal
vegano(Plato) :-
    plato(Plato, Ingredientes),
    \+ (member(I, Ingredientes), origen_animal(I)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RESTRICCIONES: ALÉRGICOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Un cliente no puede comer un plato si este contiene su alergeno
no_puede_comer(Cliente, Plato) :-
    alergico(Cliente, Ing),
    plato(Plato, Ingredientes),
    member(Ing, Ingredientes).

% Un cliente puede comer un plato si existe y no tiene ingredientes a los que es alérgico
puede_comer(Cliente, Plato) :-
    plato(Plato, _),
    \+ no_puede_comer(Cliente, Plato).

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CLIENTES Y SUS RESTRICCIONES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Declaración de clientes
cliente(israel).
cliente(carlos).
cliente(angie).
cliente(chiqui).
cliente(luis).
cliente(emilia).

% Israel es alérgico a los hongos
alergico(israel, hongos).

% Carlos es vegetariano (no come carne)
caracteristica(carlos, vegetariano).

% Angie es vegana (no consume nada de origen animal)
caracteristica(angie, vegano).

% Chiqui es omnívoro (come de todo)
caracteristica(chiqui, omnivoro).

% Luis no come pasta
no_come(luis, pasta).

% Emilia es intolerante a los lácteos
alergico(emilia, leche).
alergico(emilia, mantequilla).
alergico(emilia, queso).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CONSULTA GENERAL DE CLIENTES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Regla principal: un cliente puede comer un plato si cumple todas sus restricciones
puede_comer(Cliente, Plato) :-
    cliente(Cliente),
    plato(Plato, Ingredientes),
    cumple_restricciones(Cliente, Plato, Ingredientes).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EVALUACIÓN DE RESTRICCIONES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Caso 1: Si el cliente es vegano
cumple_restricciones(Cliente, Plato, Ingredientes) :-
    caracteristica(Cliente, vegano),
    vegano(Plato).

% Caso 2: Si el cliente es vegetariano
cumple_restricciones(Cliente, Plato, Ingredientes) :-
    caracteristica(Cliente, vegetariano),
    vegetariano(Plato).

% Caso 3: Si el cliente es omnívoro (puede comer de todo, excepto sus alergias si las tiene)
cumple_restricciones(Cliente, _, Ingredientes) :-
    caracteristica(Cliente, omnivoro),
    \+ (alergico(Cliente, Ing), member(Ing, Ingredientes)).

% Caso 4: Si el cliente tiene alergias
cumple_restricciones(Cliente, _, Ingredientes) :-
    \+ (alergico(Cliente, Ing), member(Ing, Ingredientes)).

% Caso 5: Restricción específica: Luis no come pasta
cumple_restricciones(luis, _, Ingredientes) :-
    \+ member(pasta, Ingredientes).

% Caso 6: Cliente sin restricciones explícitas (default: puede)
cumple_restricciones(_, _, _).