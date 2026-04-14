import 'package:flutter/material.dart';

// Pregunta 6
class Usuario {
  final String nombre;
  final int edad;

  Usuario({required this.nombre, required this.edad});
}

class PantallaPerfil extends StatelessWidget {
  final Usuario usuario;

  const PantallaPerfil({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil'), elevation: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 20),
            Text(
              'Nombre: ${usuario.nombre}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              'Edad: ${usuario.edad} años',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver a la Tienda'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  print("\n=== Pregunta 6: Navegación y Datos ===");
  final usuario = Usuario(nombre: "Juan Pérez", edad: 28);
  print("Usuario creado: ${usuario.nombre}, ${usuario.edad} años");
  print("Navegable a: '/perfil' con argumento Usuario");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaPrincipal(usuario: usuario),
      routes: {
        '/perfil': (context) {
          final usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
          return PantallaPerfil(usuario: usuario);
        },
      },
    ),
  );
}

class PantallaPrincipal extends StatelessWidget {
  final Usuario usuario;

  const PantallaPrincipal({Key? key, required this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenido a la Tienda'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/perfil', arguments: usuario);
              },
              child: const Text('Ver Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
