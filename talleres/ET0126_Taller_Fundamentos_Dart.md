# Taller práctico: Fundamentos de Dart

**I.U. Pascual Bravo · ET0126 · Programación de Dispositivos Móviles**

| | |
|---|---|
| **Asignado** | Miércoles 26 de agosto |
| **Entrega** | Domingo 13 de septiembre |
| **Herramienta** | DartPad — [dartpad.dev](https://dartpad.dev) |

Este taller no está pensado para que sigas una receta paso a paso. Cada parte plantea un problema o un escenario real; tú decides qué variables, estructuras o funciones necesitas para resolverlo. No hay una única forma correcta — lo que se evalúa es que la solución sea coherente con lo que se pide y que la puedas explicar.

## Cómo abordar cada problema

1. Lee el escenario completo antes de escribir una sola línea de código.
2. Pregúntate qué información necesitas representar y qué tipo de dato le corresponde a cada una.
3. Si te ayuda, escribe primero en español (pseudocódigo) los pasos que seguirías.
4. Programa en DartPad, ejecuta seguido — no esperes a tener todo listo para correr por primera vez.
5. Prueba tu solución con al menos un caso límite (un valor vacío, cero, negativo, nulo) antes de darla por terminada.

Resuelve todo el taller en un único proyecto de DartPad, separando cada parte con un comentario (`// -- Parte 1 --`, etc.). Puedes usar IA como copiloto, pero debes poder explicar cualquier línea que entregues — es la misma política de todo el curso.

---

## Parte 1 · Variables y tipos

**Problema.** Vas a construir la ficha digital de un estudiante para un sistema de matrícula. Decide qué información básica necesita contener esa ficha y qué tipo de dato le corresponde a cada dato (piensa en nombre, edad, promedio, estado de matrícula, entre otros que consideres relevantes). Represéntala en Dart e imprime la ficha completa como la vería un funcionario de admisiones.

**Para pensar.** Si guardaras la edad del estudiante como `String` en lugar de `int`, ¿qué problemas te traería más adelante si necesitas hacer cálculos con ella? Déjalo escrito como comentario en tu código.

---

## Parte 2 · Null safety

**Problema.** No todos los estudiantes tienen un apodo registrado en el sistema. Diseña una variable que refleje esa realidad usando null safety, y escribe la lógica que muestre el apodo si existe, o un mensaje alternativo si no lo tiene. Justifica en un comentario por qué esa variable debe ser nullable y otras de la ficha (Parte 1) no.

**Para pensar.** Prueba en DartPad qué ocurre si usas el operador `!` sobre una variable que sí es `null`. ¿En qué momento aparece el error — al escribir el código o al ejecutarlo? Anota tu conclusión.

---

## Parte 3 · Funciones

**Problema.** El coordinador académico necesita dos herramientas rápidas: una que le diga si un estudiante aprueba o no una materia a partir de su nota, y otra que calcule el promedio de un semestre completo a partir de un listado de notas. Diseña tú las funciones necesarias — decide los parámetros, el tipo de retorno, y si alguna conviene escribirla como función flecha.

**Para pensar.** ¿Alguna de tus funciones podría fallar si el listado de notas llega vacío? ¿Cómo lo manejarías?

---

## Parte 4 · Colecciones

**Problema.** Estás modelando el salón de clase con tres necesidades distintas:

- una lista de asistentes del día, donde un mismo nombre podría repetirse si hay un error de registro;
- el conjunto de lenguajes de programación que un estudiante ya conoce, donde no tiene sentido que se repita uno;
- una relación que permita buscar rápidamente la nota de un estudiante a partir de su nombre.

Decide qué colección de Dart (`List`, `Set` o `Map`) usarías para cada caso, constrúyela con datos de ejemplo, y justifica por qué esa y no otra.

**Para pensar.** ¿Qué pasaría si usaras una `List` en lugar de un `Set` para el segundo caso? Compruébalo agregando un valor repetido.

---

## Parte 5 · Control de flujo

**Problema A.** El sistema necesita clasificar automáticamente el rendimiento de todos los estudiantes de un curso a partir de un listado de notas, y mostrar cuántos quedaron en cada categoría (reprobado, aprobado, sobresaliente).

**Problema B.** El proceso de inscripción permite un número limitado de intentos para ingresar una contraseña correcta; al agotarlos, el sistema debe bloquear el acceso.

Resuelve ambos escenarios combinando las estructuras de control (`if`, `for`, `while`) que consideres adecuadas para cada uno.

**Para pensar.** ¿Por qué el problema A se resuelve mejor con un `for` y el B con un `while`? Escribe tu razonamiento en un comentario.

---

## Parte 6 · Clases y POO

**Problema.** El sistema universitario necesita representar a los estudiantes como entidades con su propia información y comportamiento, no como variables sueltas. Diseña la clase que consideres adecuada, decidiendo qué atributos y qué métodos debe tener para poder responder preguntas como *"¿este estudiante está al día con sus notas?"*. Crea varios estudiantes de prueba, incluyendo al menos uno que no esté al día, y demuéstralo.

**Para pensar.** ¿Qué ventaja tiene modelar esto como una clase frente a tener, por ejemplo, tres listas separadas (nombres, semestres, promedios) sincronizadas por posición?

---

## Reto integrador (obligatorio) · Sistema de gestión de tareas

Una app de productividad necesita un motor simple que gestione tareas pendientes. El diseño de la solución queda en tus manos: piensa qué necesita representar una tarea, cómo se sabe si ya fue completada, cómo se cuentan las pendientes, y cómo se muestra el listado de forma clara según su prioridad.

Antes de programar, valida tu diseño contra estos criterios (no son pasos a seguir en orden, son condiciones que tu solución final debe cumplir):

- Existe una forma de representar una tarea individual con al menos: título, prioridad y estado (completada o no).
- Es posible marcar una tarea como completada después de haberla creado.
- Se puede trabajar con un conjunto de varias tareas a la vez (mínimo 5).
- El programa puede responder "¿cuántas tareas quedan pendientes?" en cualquier momento.
- El listado se puede recorrer completo, mostrando cada tarea de forma distinta según su prioridad.

**Bonus (opcional).** Agrega una forma de contar cuántas tareas hay por cada nivel de prioridad.

**Para pensar.** ¿Tu diseño resistiría si mañana te piden agregar una fecha límite opcional a cada tarea? Si no, ¿qué cambiarías?

---

## Cómo entregar

1. Resuelve y prueba todo el taller en DartPad primero.
2. Copia tu solución final a un archivo `taller_fundamentos_dart.dart` y súbelo a tu repositorio de práctica en GitHub.
3. Sube también este enunciado (`ET0126_Taller_Fundamentos_Dart.md`) al mismo repositorio, junto a tu solución.
4. Comparte el link del repositorio (o del commit) por el canal de Google Chat del curso, antes del domingo 13 de septiembre.

*Este taller es formativo — su objetivo es que consolides estas bases antes de iniciar la Unidad 2. Cualquier duda, escribe por el canal del curso.*

---
*I.U. Pascual Bravo · ET0126 · Docente: Juan Duque · Semestre Ago–Nov 2026*
