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