//codigo ejecutable en https://dartpad.dev/ sin necesidad de levantar una aplicación Flutter
import 'package:flutter/material.dart';

// Pregunta 5
abstract class Autenticador {
  void login(String user, String pass);
}

class GoogleAuth implements Autenticador {
  @override
  void login(String user, String pass) {
    print("Conectando con Google...");
  }
}

// Pregunta 6
Future<String> procesarPago(double monto, String moneda) async {
  await Future.delayed(Duration(seconds: 2));
  return "Procesando $monto $moneda";
}

// Pregunta 7
class EstadoUI extends StatefulWidget {
  const EstadoUI({Key? key}) : super(key: key);

  @override
  State<EstadoUI> createState() => _EstadoUIState();
}

class _EstadoUIState extends State<EstadoUI> {
  bool esActivo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estructura de UI')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {
                  print("Icono Home presionado");
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  print("Icono Settings presionado");
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              esActivo ? "Activo" : "Inactivo",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: esActivo ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              setState(() {
                esActivo = !esActivo;
              });
            },
            child: Text(esActivo ? "Desactivar" : "Activar"),
          ),
        ],
      ),
    );
  }
}

void main() async {
  print("\n=== Pregunta 5: Clases y Abstracción ===");
  GoogleAuth auth = GoogleAuth();
  auth.login("usuario", "contraseña");

  print("\n=== Pregunta 6: Asincronía y Tipos ===");
  await procesarPago(100.50, "USD").then((resultado) {
    print(resultado);
  });

  print("\n=== Pregunta 7: Estructura de UI ===");
  print("Iniciando aplicación Flutter: \n");

  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: EstadoUI()),
  );
}
