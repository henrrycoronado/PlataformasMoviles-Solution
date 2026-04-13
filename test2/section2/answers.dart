//codigo ejecutable en https://dartpad.dev/ sin necesidad de levantar una aplicación Flutter
import 'package:flutter/material.dart';

// Pregunta 5
enum EstadoPedido {
  pendiente,
  enviado,
  entregado;

  String descripcion() {
    switch (this) {
      case EstadoPedido.pendiente:
        return "Su pedido está siendo preparado";
      case EstadoPedido.enviado:
        return "Su pedido está en camino";
      case EstadoPedido.entregado:
        return "Su pedido ha sido entregado";
    }
  }
}

// Pregunta 6
class Usuario {
  final String nombre;
  final int edad;

  Usuario({required this.nombre, required this.edad});
}

void navegarAPerfil(BuildContext context) {
  final usuario = Usuario(nombre: "Juan Pérez", edad: 28);

  Navigator.pushNamed(context, '/perfil', arguments: usuario);
}

// Pregunta 7
class TarjetaProducto extends StatelessWidget {
  final String nombreProducto;
  final double precio;
  final bool enOferta;

  const TarjetaProducto({
    Key? key,
    required this.nombreProducto,
    required this.precio,
    this.enOferta = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda'), elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            nombreProducto,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            '\$${precio.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          enOferta
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.local_offer, color: Colors.red, size: 28),
                    const SizedBox(width: 8),
                    Text(
                      'En Oferta',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Text(
                  'Precio regular',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              print("Producto agregado: $nombreProducto");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Producto agregado al carrito')),
              );
            },
            child: const Text('Agregar al Carrito'),
          ),
          const SizedBox(height: 20),
          // Botón para navegar al perfil
          OutlinedButton(
            onPressed: () {
              navegarAPerfil(context);
            },
            child: const Text('Ver Perfil'),
          ),
        ],
      ),
    );
  }
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
            // Botón para volver a la tienda
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
  print("\n=== Pregunta 5: Enhanced Enums ===");
  print("Estado Pendiente: ${EstadoPedido.pendiente.descripcion()}");
  print("Estado Enviado: ${EstadoPedido.enviado.descripcion()}");
  print("Estado Entregado: ${EstadoPedido.entregado.descripcion()}");

  print("\n=== Pregunta 6: Navegación y Datos ===");
  final usuario = Usuario(nombre: "Juan Pérez", edad: 28);
  print("Usuario creado: ${usuario.nombre}, ${usuario.edad} años");
  print("Navegable a: '/perfil' con argumento Usuario");

  print("\n=== Pregunta 7: Composición de Widgets ===");
  print("Iniciando aplicación Flutter...\n");

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TarjetaProducto(
        nombreProducto: "Laptop Dell XPS",
        precio: 1299.99,
        enOferta: true,
      ),
      routes: {
        '/perfil': (context) {
          final usuario = ModalRoute.of(context)!.settings.arguments as Usuario;
          return PantallaPerfil(usuario: usuario);
        },
      },
    ),
  );
}
