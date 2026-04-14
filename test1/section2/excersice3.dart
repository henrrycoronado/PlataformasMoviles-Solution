import 'package:flutter/material.dart';

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
  print("\n=== Pregunta 7: Estructura de UI ===");
  print("Iniciando aplicación Flutter: \n");

  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: EstadoUI()),
  );
}
