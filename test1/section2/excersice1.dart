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

void main() async {
  print("\n=== Pregunta 5: Clases y Abstracción ===");
  GoogleAuth auth = GoogleAuth();
  auth.login("usuario", "contraseña");
}
