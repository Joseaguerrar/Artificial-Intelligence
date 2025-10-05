# Tarea 5

- José Guerra Rodríguez: C33510
- Jerson Bonilla Fernández: C31225
- Jose Raúl Martínez Quesada: C34637

# Guía de Consultas

**Notas:**
* Todos los nombres son en minúscula (p. ej. ruth, samuel).
* Use _ o variables (X, Y, Z) para listar resultados.
* Presione ; para ver más soluciones (backtracking).

## Pom / Mamá / Papá
* pom(P, H): P es progenitor/progenitora de H.
* mama(M, H): M es madre de H.
* papa(P, H): P es padre de H.

Ejemplos de consultas:
```prolog
% Ver si una persona es progenitora de otra.
?- pom(ruth, samuel).

% Ver si una persona es mamá de otra.
?- mama(ruth, esteban).

% Ver si una persona es papá de otra.
?- papa(luis, samuel).

% Ver quién es el papá de samuel.
?- papa(P, samuel).

% Ver de quién es madre ruth.
?- mama(ruth, Hijo).

```

## Hermanx / Hermano / Hermana
* hermanx(A, B): A y B son hermanxs (comparten al menos un progenitor), A ≠ B.
* hermano(A, B): como arriba y A es hombre.
* hermana(A, B): como arriba y A es mujer.

Ejemplos de consultas:
```prolog
?- hermanx(diego, kattia).
?- hermano(diego, kattia).
?- hermana(raquel, ruth).

% Listar hermanxs de alguien
?- hermanx(X, andrea).

```

## Primx / Primo / Prima
* primx(A, B): A y B son primos (los progenitores de A y B son hermanxs entre sí).
* primo(A, B): como arriba y A es hombre.
* prima(A, B): como arriba y A es mujer.

Ejemplos de consultas:
```prolog
?- primx(david, samuel).
?- primo(ruben, esteban).
?- prima(X, samuel).

```

## PrimxSegundo / PrimoSegundo / PrimaSegunda
* primx_segundo(A, B): A y B son primos segundos (sus progenitores son primos).
* primo_segundo(A, B): como arriba y A es hombre.
* prima_segunda(A, B): como arriba y A es mujer.

Ejemplos de consultas:
```prolog
?- primx_segundo(Nombre1, Nombre2).
?- primo_segundo(Nombre1, Nombre2).
?- prima_segunda(Nombre1, Nombre2).

```

## Tix / Tío / Tía
* tix(A, B): A es tío/tía consanguíneo de B (A es hermanx del progenitor de B).
* tio(A, B): como arriba y A es hombre.
* tia(A, B): como arriba y A es mujer.

Ejemplos de consultas:
```prolog
?- tia(raquel, samuel).
?- tio(diego, andrea).
?- tix(X, caleb).

```

## TixPolitico / TioPolitico / TiaPolitica
* tix_politico(A, B): A es tío/tía político/a de B.
* tio_politico(A, B): hombre.
* tia_politica(A, B): mujer.

Ejemplos de consultas:
```prolog
?- tio_politico(oscar, ruben).
?- tia_politica(raquel, andrea).
?- tix_politico(X, ruben).

```

## Sobrinx / Sobrino / Sobrina
* sobrinx(A, B): A es sobrino/a de B (equivale a tix(B, A)).
* sobrino(A, B): A es hombre.
* sobrina(A, B): A es mujer.

Ejemplos de consultas:
```prolog
?- sobrina(andrea, diego).
?- sobrino(ruben, raquel).
?- sobrinx(X, diego).

```

## Abuelx / Abuelo / Abuela
* abuelx(A, B): A es abuelo/a de B (A es pom de quien es pom de B).
* abuelo(A, B): hombre.
* abuela(A, B): mujer.

Ejemplos de consultas:
```prolog
?- abuela(ruthb, samuel).
?- abuelo(virgilio, ruth).
?- abuelx(X, caleb).

```

## Bisabuelx / Bisabuelo / Bisabuela
* bisabuelx(A, B): A es bisabuelo/a de B 
* bisabuelo(A, B): hombre.
* bisabuela(A, B): mujer.

Ejemplos de consultas:
```prolog
?- bisabuela(ruthb, david).
?- bisabuelo(virgilio, ruben).
?- bisabuelx(X, andrea).

```

## Cuñadx (que tenga hijxs) / Cuñado / Cuñada
* cunhadx(A, B): A es cuñado/a de B si:
    * A es hermanx de la pareja de B, o
    * A es pareja del hermanx de B,
    * y además A tiene hijxs.

* cunhado(A, B): A es hombre.
* cunhada(A, B): A es mujer.

Ejemplos de consultas:
```prolog
?- cunhado(diego, erick).
?- cunhada(X, erick).
?- cunhadx(X, Y).

```

## Suegrx / Suegro / Suegra
* suegrx(A, B): A es suegro/a de B si A es progenitor de la pareja de B.
* suegro(A, B): hombre.
* suegra(A, B): mujer.

Ejemplos de consultas:
```prolog
?- suegro(olman, erick).
?- suegra(carmen, erick).
?- suegrx(X, erick).

```