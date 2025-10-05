# Consultas en Prolog – Restaurante

Este documento presenta las consultas solicitadas en el enunciado, con el **comando Prolog**, el **output esperado** y una **explicación** de por qué el resultado es correcto según las restricciones de los clientes y las definiciones de los platos.

---

## 1. ¿Puede Chiqui comer Especial de Pasta con Hongos?

**Comando:**

```prolog
?- puede_comer(chiqui, especial(pasta, hongos)).
```

**Output esperado:**

```
false.
```

**Explicación:**  
No existe un plato especial con `pasta` como ingrediente principal, ya que los únicos principales válidos son `pollo, lomito, pescado, atún, hongos`.  
Por eso el sistema responde `false`. El profesor indicó que este resultado es correcto porque la combinación no está definida en la base de conocimiento.

---

## 2. ¿Especial de Hongos con Hongos tiene hongos?

**Comando:**

```prolog
?- plato(especial(hongos, hongos), Ingredientes), member(hongos, Ingredientes).
```

**Output esperado:**

```
Ingredientes = [hongos, cebolla, sal, vinagre, hongos].
```

**Explicación:**  
El plato `especial(hongos, hongos)` se construye correctamente y contiene `hongos` tanto como principal como acompañamiento.  
La consulta confirma que efectivamente tiene el ingrediente indicado.

---

## 3. ¿Qué puede comer Carlos?

**Comando:**

```prolog
?- puede_comer(carlos, Plato).
```

**Output esperado:**

```
Plato = pasta_basica ;
Plato = hongos_al_horno ;
Plato = ensalada_cesar ;
Plato = helado ;
Plato = especial(hongos, papa) ;
Plato = especial(hongos, hongos) ;
Plato = especial(hongos, zucchini) ;
Plato = especial(hongos, arroz) ;
false.
```

**Explicación:**  
Carlos es vegetariano, por lo que no puede consumir platos con carne (`pollo, lomito, pescado, atún`).  
La consulta devuelve únicamente los platos vegetarianos (incluyendo especiales con hongos).  
Esto cumple con el enunciado de recomendar opciones aptas para un cliente. Para seguir listando opciones
se debe pulsar `;`.

---

## 4. ¿Qué tienen con fresas?

**Comando:**

```prolog
?- plato(Plato, Ingredientes), member(fresas, Ingredientes).
```

**Output esperado:**

```
Plato = helado,
Ingredientes = [miel, leche, fresas] ;
false.
```

**Explicación:**  
El único plato que contiene `fresas` es el `helado`.  
La consulta lo identifica correctamente, cumpliendo la condición de recomendar platos con un ingrediente deseado.

---

## 5. ¿Qué hay para un tipo de vegano con arroz?

**Comando:**

```prolog
?- plato(Plato, Ingredientes), vegano(Plato), member(arroz, Ingredientes).
```

**Output esperado:**

```
Plato = especial(hongos, arroz),
Ingredientes = [hongos, cebolla, sal, vinagre, arroz] ;
false.
```

**Explicación:**  
De todos los platos con `arroz`, solo el especial de hongos cumple las condiciones veganas (no contiene ingredientes de origen animal).  
Esto responde correctamente a la necesidad de recomendar platos aptos para un vegano con un acompañamiento específico.

---

## 6. ¿Puede Angie comer especial de carne con arroz?

**Comando:**

```prolog
?- puede_comer(angie, especial(lomito, arroz)).
```

**Output esperado:**

```
false.
```

**Explicación:**  
Angie es vegana, y el plato contiene `lomito` que es un producto de origen animal.  
Por lo tanto, el sistema correctamente rechaza el plato, cumpliendo con la indicación de evitar aprobar alimentos que no corresponden a la dieta del cliente.

---

## 7. Fidel el Caníbal – ¿Qué puede comer?

**Comando:**

```prolog
?- puede_comer(fidel, Plato).
```

**Output esperado (extracto):**

```
Plato = pasta_basica ;
Plato = hongos_al_horno ;
Plato = ensalada_cesar ;
Plato = helado ;
...
Plato = especial(gato, arroz) ;
...
false.
```

**Explicación:**  
Fidel fue definido como caníbal y se agregó el plato `especial(gato, arroz)` a la base de conocimiento.  
La consulta devuelve todos los platos disponibles, incluyendo el especial con carne de gato.  
Lo importante es que efectivamente aparece la opción caníbal, cumpliendo el punto del enunciado de definir un cliente con características particulares.

---

# Conclusión

Los resultados de cada consulta coinciden con lo esperado según el enunciado.  
El sistema implementado en Prolog respeta las restricciones de cada cliente (vegetariano, vegano, alérgico o caníbal), y las consultas permiten responder preguntas de los saloneros sobre el menú y los ingredientes.
