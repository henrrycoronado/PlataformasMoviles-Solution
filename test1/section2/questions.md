# Sección II: Práctica (60 puntos)

5. Clases y Abstracción (20 pts)

    Crea una clase abstracta llamada `Autenticador` con un método sin implementar llamado `login(String user, String pass)`. Luego, crea una clase `GoogleAuth` que implemente esa interfaz y que imprima "Conectando con Google..." al ejecutar el método.

6. Asincronía y Tipos (20 pts)

    Escribe una función que reciba un `double` (monto) y un `String` (moneda). La función debe devolver un `Future<String>` que, tras una espera simulada, retorne el texto: "Procesando $monto $moneda".

7. Estructura de UI (20 pts)

    Escribe el código de un `StatefulWidget` básico donde el `body` del `Scaffold` sea una `Column` que contenga una `Row` en la parte superior con dos iconos, y un `Text` en el centro de la columna que cambie de "Activo" a "Inactivo" al presionar un botón.
