import 'dart:convert'; // Importa la biblioteca para trabajar con JSON.
import 'package:http/http.dart' as http; // Importa el paquete http para realizar solicitudes HTTP.
import 'package:empty/Exercici4/models/joke.dart'; // Importa el modelo de chiste.
import 'dart:math'; // Importa la biblioteca para generar números aleatorios.

class JokeController { // Define la clase JokeController, que se encargará de la lógica de obtención de chistes.
  static const String apiUrl = "https://api.sampleapis.com/jokes/goodJokes"; // URL de la API que proporciona chistes.

  Future<Joke> fetchJoke() async { // Método asíncrono que obtiene un chiste.
    final response = await http.get(Uri.parse(apiUrl)); // Realiza una solicitud GET a la API.

    if (response.statusCode == 200) { // Verifica si la respuesta es exitosa (código 200).
      List<dynamic> jokes = jsonDecode(response.body); // Decodifica la respuesta JSON en una lista de chistes.
      if (jokes.isNotEmpty) { // Verifica si la lista de chistes no está vacía.
        final randomIndex = Random().nextInt(jokes.length); // Genera un índice aleatorio dentro del rango de la lista de chistes.
        final randomJoke = jokes[randomIndex]; // Selecciona un chiste aleatorio de la lista.
        return Joke.fromJson(randomJoke); // Convierte el chiste aleatorio en un objeto Joke y lo devuelve.
      }
    }
    throw Exception("No s'ha pogut carregar l'acudit"); // Lanza una excepción si no se pudo cargar un chiste.
  }
}