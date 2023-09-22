//! Librerias importadas
import 'dart:io';

//! Librerias creadas

/// clearScreen()
//Funcion para limpiar la pantalla segun el sistema operativo
void clearScreen() {
  if (Platform.isWindows) {
    // Si el sistema operativo es Windows, ejecutar el comando 'cls'
    stdout.write('\x1B[2J\x1B[0;0H');
  } else {
    // Si el sistema operativo es Unix o Mac, ejecutar el comando 'clear'
    stdout.write('\x1B[2J\x1B[3J\x1B[1;1H');
  }
}

/// Función que cuenta la cantidad de palabras en un texto.
int contadorDePalabras(String texto) {
  // Usar una expresión regular para encontrar palabras en el texto.
  RegExp regExp = RegExp(r'\b\w+\b');
  Iterable<Match> matches = regExp.allMatches(texto);

  // Contar las coincidencias encontradas.
  int cantidadPalabras = matches.length;

  return cantidadPalabras;
}

/// Función que cuenta la cantidad de veces que aparece una palabra clave en un texto.
int contadorDePalabrasClave(String texto, String palabraClave) {
  // Convertir la palabra clave y el texto a minúsculas para hacer la búsqueda insensible a mayúsculas y minúsculas.
  palabraClave = palabraClave.toLowerCase();
  texto = texto.toLowerCase();

  // Dividir el texto en palabras y contar las que coinciden con la palabra clave.
  List<String> palabras = texto.split(RegExp(r'[^a-zA-Z0-9_]'));
  // Usamos el método where() para filtrar las palabras que coinciden con la palabra clave.
  int cantidadCoincidencias = palabras.where((palabra) => palabra == palabraClave).length;

  return cantidadCoincidencias;
}

/// Función que cuenta la cantidad de caracteres en un texto.
int contadorDeCaracteres(String texto) {
  // Utilizamos la propiedad length de la cadena para contar la cantidad de caracteres.
  int cantidadCaracteres = texto.length;

  return cantidadCaracteres;
}