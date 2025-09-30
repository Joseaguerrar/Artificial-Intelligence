% Sistema Experto de Restaurante - Versión Básica en Español

% --- Platos simples ---
plato(pasta).
plato(ensalada).
plato(pizza).
plato(sopa).

% --- Ingredientes por plato ---
ingredientes(pasta, [pasta, tomate, queso]).
ingredientes(ensalada, [lechuga, tomate, aceite]).
ingredientes(pizza, [masa, queso, tomate, carne]).
ingredientes(sopa, [verduras, agua, sal]).

% --- Clientes con restricciones ---
vegetariano(carlos).
alergico(maria, queso).
normal(juan).  % sin restricciones

% --- Reglas simples ---
% Verificar si un plato tiene un ingrediente específico
tiene_ingrediente(Plato, Ingrediente) :-
    ingredientes(Plato, Lista),
    member(Ingrediente, Lista).

% Regla simple: vegetarianos no pueden comer platos con carne
puede_comer(Cliente, Plato) :-
    vegetariano(Cliente),
    \+ tiene_ingrediente(Plato, carne).

% Regla simple: personas con alergias no pueden comer platos con su alérgeno
puede_comer(Cliente, Plato) :-
    alergico(Cliente, Alergeno),
    \+ tiene_ingrediente(Plato, Alergeno).

% Personas normales pueden comer cualquier cosa
puede_comer(Cliente, _) :-
    normal(Cliente).

% Recomendar platos que un cliente puede comer
recomendar(Cliente, Plato) :-
    plato(Plato),
    puede_comer(Cliente, Plato).