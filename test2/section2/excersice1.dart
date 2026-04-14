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

void main() {
  print("\n=== Pregunta 5: Enhanced Enums ===");
  print("Estado Pendiente: ${EstadoPedido.pendiente.descripcion()}");
  print("Estado Enviado: ${EstadoPedido.enviado.descripcion()}");
  print("Estado Entregado: ${EstadoPedido.entregado.descripcion()}");
}
