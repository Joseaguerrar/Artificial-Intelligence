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
