class Joke { // Define la clase Joke, que representa un chiste.
  final String setup; // Parte de configuración del chiste.
  final String punchline; // Parte de punchline del chiste.

  Joke({required this.setup, required this.punchline}); // Constructor que requiere setup y punchline.

  factory Joke.fromJson(Map<String, dynamic> json) { // Método de fábrica para crear una instancia de Joke a partir de un mapa JSON.
    return Joke(
      setup: json['setup'] ?? '', // Asigna el valor de 'setup' del JSON, o una cadena vacía si no existe.
      punchline: json['punchline'] ?? '', // Asigna el valor de 'punchline' del JSON, o una cadena vacía si no existe.
    );
  }
}