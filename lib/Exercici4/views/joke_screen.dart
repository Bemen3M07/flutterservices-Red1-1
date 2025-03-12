// lib/views/joke_screen.dart
import 'package:flutter/material.dart'; // Importa el paquete de Flutter para usar widgets y material design.
import '../controllers/joke_controller.dart'; // Importa el controlador de chistes.
import '../models/joke.dart'; // Importa el modelo de chiste.

class JokeScreen extends StatefulWidget { // Define una clase JokeScreen que extiende StatefulWidget, lo que significa que tiene estado mutable.
  @override
  _JokeScreenState createState() => _JokeScreenState(); // Crea el estado asociado a este widget.
}

class _JokeScreenState extends State<JokeScreen> { // Define la clase de estado para JokeScreen.
  final JokeController _controller = JokeController(); // Crea una instancia de JokeController para manejar la lógica de obtención de chistes.
  Joke? _currentJoke; // Variable para almacenar el chiste actual, inicializada como nula.
  bool _isLoading = false; // Variable para indicar si se está cargando un chiste.

  void _getNewJoke() async { // Método para obtener un nuevo chiste de forma asíncrona.
    setState(() { // Actualiza el estado para indicar que se está cargando.
      _isLoading = true;
    });
    try {
      Joke joke = await _controller.fetchJoke(); // Intenta obtener un nuevo chiste del controlador.
      setState(() { // Actualiza el estado con el nuevo chiste.
        _currentJoke = joke;
      });
    } catch (e) { // Maneja cualquier error que ocurra durante la obtención del chiste.
      setState(() { // Actualiza el estado para mostrar un mensaje de error.
        _currentJoke = Joke(setup: "Error carregant l'acudit", punchline: "");
      });
    }

    setState(() { // Finaliza la carga.
      _isLoading = false;
    });
  }

  @override
  void initState() { // Método que se llama cuando se inicializa el estado.
    super.initState(); // Llama al método de la clase base.
    _getNewJoke(); // Obtiene un nuevo chiste al iniciar la pantalla.
  }

  @override
  Widget build(BuildContext context) { // Método que describe cómo se debe construir el widget.
    return Scaffold( // Devuelve un widget Scaffold, que proporciona una estructura básica para la pantalla.
      appBar: AppBar(title: Text("Acudit Aleatori")), // Barra de aplicación con el título "Acudit Aleatori".
      body: Center( // Centra el contenido en la pantalla.
        child: _isLoading // Verifica si se está cargando un chiste.
            ? CircularProgressIndicator() // Muestra un indicador de progreso mientras se carga.
            : _currentJoke != null // Verifica si hay un chiste actual.
                ? Padding( // Si hay un chiste, lo muestra en un Padding.
                    padding: const EdgeInsets.all(16.0), // Aplica un padding de 16 píxeles.
                    child: Column( // Usa un Column para organizar los widgets verticalmente.
                      mainAxisAlignment: MainAxisAlignment.center, // Centra los widgets en el eje vertical.
                      children: [
                        Text( // Muestra la parte de configuración del chiste.
                          _currentJoke!.setup,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Estilo del texto.
                          textAlign: TextAlign.center, // Centra el texto.
                        ),
                        SizedBox(height: 10), // Espacio entre los textos.
                        Text( // Muestra la parte de punchline del chiste.
                          _currentJoke!.punchline,
                          style: TextStyle(fontSize: 18), // Estilo del texto.
                          textAlign: TextAlign.center, // Centra el texto.
                        ),
                        SizedBox(height: 20), // Espacio entre el punchline y el botón.
                        ElevatedButton( // Botón para obtener un nuevo chiste.
                          onPressed: _getNewJoke, // Llama a _getNewJoke cuando se presiona.
                          child: Text("Un altre acudit!"), // Texto del botón.
                        ),
                      ],
                    ),
                  )
                : Text("No s'ha pogut carregar l'acudit"), // Mensaje de error si no se pudo cargar un chiste.
      ),
    );
  }
}