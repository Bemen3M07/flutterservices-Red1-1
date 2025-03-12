import 'package:flutter/material.dart'; // Importa el paquete de Flutter para usar widgets y material design.
import 'views/joke_screen.dart'; // Importa la pantalla de chistes desde el directorio 'views'.

void main() {
  runApp(const MyApp()); // La función main es el punto de entrada de la aplicación. Llama a runApp para iniciar la aplicación con MyApp.
}

class MyApp extends StatelessWidget { // Define una clase MyApp que extiende StatelessWidget, lo que significa que es un widget inmutable.
  const MyApp({super.key}); // Constructor de MyApp, utiliza 'super.key' para pasar la clave al constructor de la clase base.

  @override
  Widget build(BuildContext context) { // Método build que describe cómo se debe construir el widget.
    return MaterialApp( // Devuelve un widget MaterialApp, que es la raíz de la aplicación.
      debugShowCheckedModeBanner: false, // Desactiva la etiqueta de depuración en la esquina superior derecha.
      title: 'Acudits App', // Establece el título de la aplicación, que se muestra en la barra de título del sistema operativo.
      theme: ThemeData( // Define el tema de la aplicación.
        primarySwatch: Colors.blue, // Establece el color primario de la aplicación a azul.
      ),
      home: JokeScreen(), // Establece la pantalla inicial de la aplicación a JokeScreen, que es donde se mostrarán los chistes.
    );
  }
}