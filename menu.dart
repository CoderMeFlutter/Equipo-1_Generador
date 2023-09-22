import 'Librerias.dart';
import 'dart:io';


void Menu(){
   //creamos una variable para el ciclo for
  bool valor = false;

  //ciclo for para el menu, que se detendra al retornar el valor como 'true'
  //!For Menu principal
  for( ; valor == false; ) {
    
  //impresion de nuestro menu
  clearScreen();
    print('------------------------------------------------------------');
    print('|                                                          |');
    print('|                   Analizador de texto.                   |');
    print('|                                                          |');
    print('------------------------------------------------------------');
    print('|                     MENU PRINCIPAL.                      |');
    print('|                                                          |');
    print('| Selecciona una opcion:                                   |');
    print('------------------------------------------------------------');
    print('|                                                          |');
    print('| 1. Analizar Texto en la terminal.                        |');
    print('|                                                          |');
    print('| 2. Analizar Texto en Documento ".txt".                   |');
    print('|                                                          |');
    print('| 3. Salir.                                                |');
    print('|                                                          |');
    print('------------------------------------------------------------');
    print('\n');
    print('---------------');
    print('Opcion:       |');

    int opcMenuPrincipal = int.parse(stdin.readLineSync()!);

    switch(opcMenuPrincipal) {

        case 1:
          clearScreen();
          print('Ingresa el texto a analizar:');
          String texto = stdin.readLineSync()!;
          print('\n \nEl texto ingresado es:\n $texto \n');
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          clearScreen();
          menuSecundario(opcMenuPrincipal, texto);
          break;

        case 2:
          clearScreen();
          // Solicita al usuario que ingrese la ruta completa del archivo a leer.
          stdout.write('Ingresa la ruta del archivo: ');
          String rutaArchivo = stdin.readLineSync()!;
          late String texto;

          // Intenta leer el contenido del archivo.
          try {
            File archivo = File(rutaArchivo);

            // Verifica si el archivo existe.
            if (archivo.existsSync()) {
              texto = archivo.readAsStringSync();
              print('Contenido del archivo:\n$texto');
              print('Presiona enter para continuar...');
              stdin.readLineSync()!;
              menuSecundario(opcMenuPrincipal, texto);
            } else {
              print('El archivo no existe en la ruta proporcionada.');
            }
          } catch (e) {
            print('Ocurrió un error al leer el archivo: $e');
          }
          break;

        case 3:
        clearScreen();
        print('Seguro que deseas salir?');
        print('S o N');
        String respuesta = stdin.readLineSync()!;
        if(respuesta == 'S' || respuesta == 's'){
          exit(0);
        }
        clearScreen();
          break;

    }//fin del switch
  }//fin del for
}//fin de la funcion menu


void menuSecundario(int opcMenuPrincipal, String texto){
    //creamos una variable para el ciclo for
    bool valor = false;

    //ciclo for para el menu, que se detendra al retornar el valor como 'true'
    //!For Menu secundario
    for( ; valor == false; ) {
    print('------------------------------------------------------------');
    print('|                     MENU "secundario".                   |');
    print('|                                                          |');
    print('| Selecciona una opcion:                                   |');
    print('------------------------------------------------------------');
    print('|                                                          |');
    print('| 1. Contar la cantidad de palabras.                       |');
    print('|                                                          |');
    print('| 2. Contar la frecuencia de una palabra clave.            |');
    print('|                                                          |');
    print('| 3. Imprimir contenido.                                   |');
    print('|                                                          |');
    print('| 4. Regresar al menu anterior.                            |');
    print('|                                                          |');
    print('| 5. Salir.                                                |');
    print('|                                                          |');
    print('------------------------------------------------------------');
    print('\n');
    int opcMenuSecundario = int.parse(stdin.readLineSync()!);

    if(opcMenuPrincipal == 2 && opcMenuSecundario == 1){
        opcMenuSecundario = 6;
      }
      else if(opcMenuPrincipal == 2 && opcMenuSecundario == 2){
        opcMenuSecundario = 7;
    }

    switch(opcMenuSecundario){
        
        case 1:
          clearScreen();
          print('Opcion 1');
          print("La cantidad de palabras es: ${contadorDePalabras(texto)}");
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;
  
        case 2:
          clearScreen();
          print('Opcion 2');
          print("Ingrese la palabra clave a buscar: ");
          String palabraClave = stdin.readLineSync()!;
          print("La frecuencia de la palabra es: ${contadorDePalabrasClave(texto, palabraClave)}");
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 3:
          clearScreen();
          print('Opcion 3');
          print("\nEl texto ingresado es:\n $texto \n\n");
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 6:
          clearScreen();
          print('Opcion 1');
          print("La cantidad de palabras es: ${contadorDePalabras(texto)}");
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 7:
          clearScreen();
          print('Opcion 2');
          print("Ingrese la palabra clave a buscar: ");
          String palabraClave = stdin.readLineSync()!;
          print("La frecuencia de la palabra es: ${contadorDePalabrasClave(texto, palabraClave)}");
          print('Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;
  
        case 4: //regresar al menu anterior
          clearScreen();
          print('Presiona enter para continuar...');
          Menu();
          break;
  
        case 5: //salir
          clearScreen();
          print('Seguro que deseas salir?');
          print('S o N');
          String respuesta = stdin.readLineSync()!;
          if(respuesta == 'S' || respuesta == 's'){
            exit(0);
          }
          clearScreen();
          break;
  
        default:
          clearScreen();
          print('Opcion no valida');
          clearScreen();
          break;
    }//fin del switch
  }//fin del for
}//fin de la funcion menuSecundario

int contadorDePalabras(String texto) {
  // Usar una expresión regular para encontrar palabras en el texto.
  RegExp regExp = RegExp(r'\b\w+\b');
  Iterable<Match> matches = regExp.allMatches(texto);

  // Contar las coincidencias encontradas.
  int cantidadPalabras = matches.length;

  return cantidadPalabras;
}

int contadorDePalabrasClave(String texto, String palabraClave) {
  // Convertir la palabra clave y el texto a minúsculas para hacer la búsqueda insensible a mayúsculas y minúsculas.
  palabraClave = palabraClave.toLowerCase();
  texto = texto.toLowerCase();

  // Dividir el texto en palabras y contar las que coinciden con la palabra clave.
  List<String> palabras = texto.split(RegExp(r'[^a-zA-Z0-9_]'));
  int cantidadCoincidencias = palabras.where((palabra) => palabra == palabraClave).length;

  return cantidadCoincidencias;
}

