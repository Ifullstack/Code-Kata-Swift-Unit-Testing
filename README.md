# Code Kata Unit Testing - Nivel Básico
### Objetivo de este Code Kata:

Es aprender los conceptos básicos sobre Testing, en especial los Test Unitarios, prácticar y pasarlo bien haciendo lo que nos gusta 🙂.
### Importancia de hacer Tests en nuestras Aplicaciones:

De una manera muy global, es la manera de **asegurar**  la calidad del producto que estamos creando.

Y de una manera más específica, se podría decir, que es la manera que tenemos de encontrar bugs, antes de enviar nuestro trabajo y no después.

Para ser muy claros el Testing, es una inversión, requiere recursos para crear, correr y mantener los tests, por tanto, cada equipo, busca estrategias y herramientas que le ayuden a minimizar costes y maximizar el retorno de la misma.

Existen metodologías basadas en el testing del producto (quiere decir que primero escribimos los test en el momento de desarrollar y programamos enfocados en los test). 

Hay metodologías tradicionales como el RUP( Rational Unified Proccess) y el modelo V.

![Modelo V](https://insights.sei.cmu.edu/media/images/F1_-_Traditional_V_Model.original.jpg)

O Metodologías ágiles como: 

- TDD (Test Driven Development) - “No escribas código hasta que no tengas los casos de prueba que ese código deberá satisfacer”, para conseguirlo puedes seguir un proceso llamado RED - GREEN - REFACTOR
- TDRE (Test Driven Requirement Engineering) - “No implementes un requisito hasta que no tengas definidas las pruebas de aceptación que ese requisito debe satisfacer”
- BDD (Behavior Driven Development ) - Tanto en TDD como en BDD, las pruebas se deben definir antes del desarrollo, aunque en BDD, las pruebas se centran en el usuario y el comportamiento del programa, a diferencia del TDD que se centra en funcionalidades. La principal diferencia en mi opinión, es ser consciente de la necesidad de definir "la especificación del comportamiento de un usuario" en lugar de "la prueba unitaria de una clase".

### Qué tipos de Test podemos hacer en nuestras Apps:

Podemos hacer test unitarios, test de integración, test de interfaz de usuario, y por qué no, test para pruebas de rendimiento.

Estos tests sirven entre otras cosas para: 

- Afirmar que se cumplen ciertas condiciones en la ejecución de nuestro programa.
- Si estas condiciones no se cumplen, podemos registrar fallos de las pruebas, problemas de UI, de performance y gestionarlo con el equipo.
- También estos tests puedes interactuar con la UI para validar flujos, experiencias de usuarios y rendimiento de nuestra App.

### Que son los test unitarios, test de integración y test de UI:

Estos tres tipos son lo que se llaman niveles de abstración de nuestros Test, una buena estrategia de testing combina múltiples tests de cada tipo para maximizar resultados.

![Modelo V](https://docs-assets.developer.apple.com/published/ef95ee6af585ccd974aa64b61db87a7a/testing-your-apps-in-xcode-1@2x.png)

Existe lo que se llama la pirámide de distribución de tests, esta recomienda realizar: 

- Una gran cantidad de rápidos e independientes test unitarios, para cubrir cada pequeña lógica de tu App.
- Un número pequeño de test de integración para demostrar que estas pequeñas partes están conectadas correctamente.
- Pruebas de UI, para afirmar el comportamiento correcto de los diferentes casos de usos de nuestra App de cara al usuario. Estas son el indicador definitivo de que su aplicación funciona para los usuarios de la forma esperada.

La pirámide de distribución de tests equilibra las pruebas de alta fidelidad (UI test) que demuestran que los usuarios pueden completar sus tareas, con pruebas muy específicas que le brindan feedback rápido sobre la lógica de su aplicación y el impacto de los cambios que vas realizando en tu código.

### Conceptos importantes a aprender:

1- Cómo añadir Test a nuestro proyecto en Xcode, y los diferentes sitios de la interfaz de Xcode destinados a tests.
Podemos crear el target para tests, justo al crear el proyecto, sino lo hicimos al inicio, podemos añadirlo posteriormente.
Para crear un archivo de test, la manera más simple, es crear un nuevo file, y decirle que sea de tipo unit test o ui test.

2- Que es un TestCase, un TestMethod, que conforma el template inicial.

Un TestMethod  es un método pequeño e independiente, que prueba un bloque específico de tu código. Para añadir un test method, él mismo debe no tener ningún argumento y regresar void, y ponerle el nombre iniciando con la palabra test(nombre del método).
Un TestCase no es más que un grupo de TestMethods que están relacionados entre sí, además de proveer otros métodos que nos ayudarán en el ciclo de vida de nuestros tests.

3- Bases para crear un tests unitarios.

Como vimos anteriormente en la pirámide de distribución de Tests, los test unitarios son la base de la misma. Para ello tenemos que saber algunas técnicas para hacer buen uso de ellos. Técnicas tales como:

- Cada test unitario tiene que afirmar (assert) el comportamiento esperado de una singular parte de tu código, de un solo bloque del mismo. Si quieres cubrir multiples comportamientos, entonces deberías escribir un test para cada diferente escenario que puede darse. Por ejemplo: Si tienes un método, que recibe un parámetro que puede ser nil, y dependiendo de si viene valor o no, el método reacciona o retorna valores diferentes, entonces deberías crear un unit test para cada escenario.
- Usar técnicas en tu código como **encapsulación**, inyección de dependencias, programación orientada a protocolos entre otras, para una mejor implementación de los tests.
El test unitario debe de seguir tres simples pasos:

- Arrange - Given: De que depende el test, quién es sujeto u objeto a testear. Aquí se pueden usar diferentes técnicas como los “stubs” o “mocks” usando programación orientada a protocolos o inyección de dependencias, los sujetos que vamos a testear son los más flexibles para sustituirlo o usar el verdadero.
- Act - When: Llamar al método que estamos testeando, usando la configuración que implementamos en el primera fase.
- Assert - Then: Aquí usamos las test Assertions para determinar si el método que llamamos en la fase anterior, se comporta de la manera que esperamos o cumple las espectativas correctas. Cualquier Assertion que tenga un resultado falso, hará que el test falle.

5- Que son los Test Assertions.

Estos son métodos que nos permite verificar los valores y resultados esperados en los métodos de prueba.

Ejemplo básicos de estos son:
Boolean Assertions: Testea una condición que devuelve un resultado true o false.
Nil and Non-Nil Assertions: Testea si una condición tiene o no tiene un valor.
Equality and Inequality Assertions: Testea si dos valores son iguales o no.

Ejemplos un poco más avanzados son:
Error Assertions: Testea sin un método lanza o no un error.
Unconditional Test Failures: Genera un fallo de test inmediatamente dada cualquier condición.
Expected Failures: Anticipa fallos en los test, para prevenir que estos afecten tu flujo de los mismos.
Methods for Skipping Tests: Salta un determinado test cuando ocurre una determinada condición.

6- Test asíncronos y expectativas

Estas te permiten obtener el performance de tareas largas o tareas que ocurran en el background, esperar por ellas y ver si cumplen alguna condición especificada.

### ¿Y ahora qué?
Ahora es momento de practicar, y mejorar la calidad de nuestro software usando testing junto a las diferentes técnicas y metodologías existentes.
Y sin más, nos vemos en el siguiente Code kata.

### Bibliografía y recursos:

Mundo Testing:
[https://mundotesting.com/que-metodologias-existen-para-el-control-de-calidad-del-software/#Modelos_de_mejora_de_procesos_de_pruebas](https://mundotesting.com/que-metodologias-existen-para-el-control-de-calidad-del-software/#Modelos_de_mejora_de_procesos_de_pruebas)

Documentación de Apple:
[https://developer.apple.com/documentation/xctest](https://developer.apple.com/documentation/xctest)

Swift code kata:
[https://qualitycoding.org/swift-code-kata/#t-1601857680305](https://qualitycoding.org/swift-code-kata/#t-1601857680305)

Swift code kata:
[https://project-awesome.org/gamontal/awesome-katas#codekata](https://project-awesome.org/gamontal/awesome-katas#codekata)

Unit testing Articles:
[https://qualitycoding.org/ios-unit-testing/](https://qualitycoding.org/ios-unit-testing/)

This Code Kata Source Code: 
[https://github.com/Ifullstack/Code-Kata-Swift-Unit-Testing/tree/main](https://github.com/Ifullstack/Code-Kata-Swift-Unit-Testing/tree/main)



1- Cómo añadir Test a nuestro proyecto en Xcode, y los diferentes sitios de la interfaz de Xcode destinados a tests.

Podemos crear el target para tests, justo al crear el proyecto, sino lo hicimos al inicio, podemos añadirlo posteriormente.
