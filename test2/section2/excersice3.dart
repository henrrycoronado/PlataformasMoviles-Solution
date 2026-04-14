import 'package:flutter/material.dart';

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
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      const Icon(
                        Icons.local_offer,
                        color: Colors.red,
                        size: 28,
                      ),
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
          ],
        ),
      ),
    );
  }
}

class PantallaTienda extends StatelessWidget {
  const PantallaTienda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tienda'), elevation: 0),
      body: Center(
        child: TarjetaProducto(
          nombreProducto: "Laptop lenovo",
          precio: 1299.99,
          enOferta: true,
        ),
      ),
    );
  }
}

void main() {
  print("\n=== Pregunta 7: Composición de Widgets ===");
  print("Iniciando aplicación Flutter...\n");

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PantallaTienda(),
    ),
  );
}
