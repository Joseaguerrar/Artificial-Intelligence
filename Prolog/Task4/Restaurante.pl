% Sistema de consultas para saloneros de restaurante

% --- Platos simples ---
plato(pasta).
plato(hongos_al_horno).
plato(ensalada_cesar).
plato(helado).

% --- Ingredientes de platos simples ---
ingredientes(pasta, [pasta, oregano, tomate, aceite, sal]).
ingredientes(hongos_al_horno, [hongos, queso, mantequilla, sal]).
ingredientes(ensalada_cesar, [lechuga, tomate, sal, vinagre]).
ingredientes(helado, [miel, leche, fresas]).

% --- Platos especiales ---

% Un plato especial es combinación de una base y un acompañamiento
plato(especial(Base, Acompanamiento)) :-
    bases_principales(Base),
    acompanamientos(Acompanamiento).

% Posibles bases principales
bases_principales([pollo, lomito, pescado, atun, hongos]).

% Posibles acompañamientos
acompanamientos([papa, hongos, zucchini, arroz]).

% Ingredientes de un plato especial
ingredientes(especial(Base, Acompanamiento), Ingredientes) :-
    bases_principales(Base),
    acompanamientos(Acompanamiento),
    Ingredientes = [Base, cebolla, sal, vinagre, Acompanamiento].