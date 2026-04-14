// Pregunta 6
Future<String> procesarPago(double monto, String moneda) async {
  await Future.delayed(Duration(seconds: 2));
  return "Procesando $monto $moneda";
}

void main() async {
  print("\n=== Pregunta 6: Asincronía y Tipos ===");
  await procesarPago(100.50, "USD").then((resultado) {
    print(resultado);
  });
}
