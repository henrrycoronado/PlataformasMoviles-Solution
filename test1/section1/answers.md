# Sección I: Teoría (40 puntos) 

1. Selección Múltiple (10 pts): ¿Cuál es la principal ventaja de utilizar un Enum con esteroides (Enhanced Enums) en Dart frente a un Enum tradicional? 

    - [ ] a) Permite que el enum sea extendido por otras clases mediante herencia. 
    
    - [x] b) Permite definir campos de instancia finales, constructores constantes y métodos estáticos o de instancia dentro del enum.

    - [ ] c) Es la única forma de que un Enum funcione dentro de un Switch de Dart.

    - [ ] d) Permite cambiar los valores de las constantes del Enum en tiempo de ejecución.

2. Verdadero o Falso (10 pts): 

   - En Dart, no existe la palabra reservada interface; cualquier clase puede actuar como una interfaz si se utiliza con la palabra implements.
     - [x] Verdadero
     - [ ] Falso

   - Un StatelessWidget puede redibujarse si sus propiedades de configuración (parámetros del constructor) cambian desde un widget padre.
     - [x] Verdadero
     - [ ] Falso

3. Rellenar Espacios (10 pts): Para ocultar la etiqueta roja que aparece en la esquina superior derecha de una aplicación Flutter recién creada, se debe configurar la propiedad **debugShowCheckedModeBanner** del widget **MaterialApp** como false. 

4. Arquitectura de Widgets (10 pts): Explica la diferencia técnica entre el procedimiento void main() y el método Widget build(BuildContext context). ¿Por qué uno es el punto de entrada de la app y el otro del widget?

**Respuesta:**

- **void main()** es la función principal de la aplicación y el punto de entrada del programa. Se ejecuta una sola vez al iniciar la aplicación. Su responsabilidad es inicializar la aplicación llamando a `runApp()` con el widget raíz. Es independiente de la UI y se ejecuta en el contexto global de la aplicación.

- **Widget build(BuildContext context)** es un método que construye la interfaz del widget. Se ejecuta cada vez que el widget necesita redibujarse (cuando cambia su estado o sus propiedades). Este método es específico de cada widget y retorna el árbol de widgets que representa la UI de ese componente.

La diferencia radica en que `void main()` es el punto de entrada global de toda la aplicación (se ejecuta una vez), mientras que `build()` es local a cada widget y se puede ejecutar múltiples veces a lo largo del ciclo de vida de la aplicación. `main()` inicializa y arranca la app, mientras que `build()` es responsable de la construcción incremental de la interfaz gráfica.