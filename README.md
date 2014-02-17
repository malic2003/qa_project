qa_project
==========
Introduccion:

Cucumber es una herramienta, escrita originalmente en Ruby, que ejecuta descripciones funcionales en texto plano como test automáticos y aplicada a la hora de realizar TDD.
La idea principal es que pueda ser entendido y usado no solo por desarrolladores sino por los clientes y gente de negocio.
El lenguaje que usa Cucumber para definir los requisitos se llama Gherkin, el cual nos permite traducir esas especificaciones en un lenguaje cercano al natural en especificaciones de test en el lenguaje que queramos.

Cada feature ( característica ) se define en un archivo, una característica normalmente consiste en una serie de escenarios, el texto entre Característica y "Esquema del escenario" permite definir libremente ya que este texto no será usado para ninguna funcionalidad de Cucumber, es meramente descriptivo.

Este código nos generará un esqueleto ( dependiendo del lenguaje en el que vayamos a producir los test y el adaptador que estemos usando ), el cual pasará los test con los distintos casos que le hayamos definido. Luego será nuestra tarea la de definir los casos de prueba que comprobarán las diferentes características.

Se pueden diferenciar claramente tres grupos que cumplen funciones distintas:

Feature: Aquí es donde indicamos el nombre de la característica a probar.
Scenario: Esta "keyword" describe los distintos escenarios que van a probar las diferentes posibilidades.
Given (Dado) : El propósito de los "Dado" es el de poner al sistema en el estado deseado para pasar los test deseados, antes de que el usuario ( o un sistema externo ), interactúe con el sistema.
When ( Cuando ) : En este caso el propósito de los "Cuando" es el describir la acción que realiza el usuario, la cual vamos a probar.
Then ( Entonces ) : El propósito de los "Entonces" es observar los resultados, estas observaciones han de ser realizadas desde el punto de vista de negocio y el valor para el usuario. Estas observaciones también deben de estar en algún sitio visible para el usuario, no en una base de datos o capas inferiores del sistema.
And, But ( Y, Pero ): Estas "keywords" están destinadas a aumentar la legibilidad y pueden ser usadas en vez de definir repetidas veces cualquiera de las anteriores.


Como configuramos nuestro ambiente de test?
Dentro del Gemfile debemos ubicar estas gemas:
"capybara"
Y dentro del grupo de test:
	'rspec'
	'rspec-rails'
	'cucumber-rails'
Luego instalamos Cucumber con este comando:
	rails g cucumber:install


Como escribir casos de test?
De una forma muy natural, como describiendo el caso de test. Dentro del archivo manage_articles.features tenemos 2 escenarios lso cuales estan escrito muy sencillo. La idea es siempre reutilizar las sentencias y no tenes 3 o 4 sentencias que refieren a lo mismo.

Como ejecutarlos?
Utilizando la consola nos ubicamos dentro de la carpeta del proyecto y una vez alli ejecutamos
	cucumber features
Ese comando correra todos los tests escrito con cucumber. En la consola podremos ver cuales pasos de los tests pasaron, cuales no estan definidos y cuales nos genera error. Para aquellos que no estan definidos, cucumber nos dara un ejemplo de como hacerlo.

Como lograr definir los casos de test?
Cuando instalamos cucumber, se crea una carpeta llamada Features donde se van a ubicar los casos de test. 
Dentro de esa carpeta tenemos una subcarpeta llamada Step_Definitions, ahi dentro pondremos los archivos necesarios para definir de los casos de test. En este ejemplo tenemos un archivo llamado Article_Steps donde ubicaremos los metodos necesarios para definir los tests.

La idea es darle a cada uno de los pasos utilizadas en los casos de test, un comportamiento. Y como muchos pasos pueden ser iguales, se utilizan expresiones regulares para acotar el comportamiento de dichos pasos.
Una vez ubicado el comportamiento para el paso en cuestion, se utilizan metodos que provee la gema Capybara, la cual nos ayuda a realizar las acciones que cualquier usuario haria. Si por algun motivo no encontramos la accion requerida en ningun metodo de Capybara, podremos crearlo nosotros. En el ejemplo, podemos ver como definimos el metodo path_to.

