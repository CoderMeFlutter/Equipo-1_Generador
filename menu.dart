//importamos las librerias necesarias
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
    print('____________________________________________________________');
    print('|                                                          |');
    print('|                   Analizador de texto.                   |');
    print('|                                                          |');
    print('|__________________________________________________________|');
    print('|                     MENU PRINCIPAL.                      |');
    print('|                                                          |');
    print('| Selecciona una opcion:                                   |');
    print('|__________________________________________________________|');
    print('|                                                          |');
    print('| 1. Analizar Texto en la terminal.                        |');
    print('|                                                          |');
    print('| 2. Analizar Texto en Documento ".txt".                   |');
    print('|                                                          |');
    print('| 0. Salir.                                                |');
    print('|                                                          |');
    print('|__________________________________________________________|');
    print('\n');

    //Pedimos la opcion al usuario
    print('___________');
    stdout.write("Opcion:  ");
    int opcMenuPrincipal = int.parse(stdin.readLineSync()!);

    //Switch para el menu principal
    switch(opcMenuPrincipal) {

        case 1://Analizar texto en la terminal
          clearScreen();
          print("Limitado hasta 254 caracteres aproximadamente para evitar errores.");  
          print('\n\n Ingresa el texto a analizar:\n');
          String texto = stdin.readLineSync()!;
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          clearScreen();
          menuSecundario(opcMenuPrincipal, texto);
          break;

        case 2://Analizar texto en documento .txt
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
              print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
              stdin.readLineSync()!;
              menuSecundario(opcMenuPrincipal, texto);
            } else {
              print('El archivo no existe en la ruta proporcionada.');
            }
          } catch (e) {
            print('Ocurrió un error al leer el archivo: $e');
          }
          break;

        case 0://salir
        clearScreen();
        print('Seguro que deseas salir ?');
        stdout.write("\n\n S o N_: ");
        String respuesta = stdin.readLineSync()!;
        //condicion para salir del programa
        if(respuesta == 'S' || respuesta == 's'){
          valor = true;
          clearScreen();
          exit(0);
        }
        else{
            clearScreen();
            print("Opcion no valida");
            print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
            stdin.readLineSync()!;
          }
        clearScreen();
          break;

        default://opcion no valida en el menu principal
          clearScreen();
          print('Opcion no valida');
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          clearScreen();
          break;

    }//fin del switch
  }//fin del for
}//fin de la funcion menu

void menuSecundario(int opcMenuPrincipal, String texto){
    //creamos una variable para el ciclo for
    bool valor = false;

    //ciclo for para el menu, que se detendra al retornar el valor como 'true'
    //For Menu secundario
    for( ; valor == false; ) {
    //impresion de nuestro menu
    print('____________________________________________________________');
    print('|                     MENU "secundario".                   |');
    print('|                                                          |');
    print('| Selecciona una opcion:                                   |');
    print('|__________________________________________________________|');
    print('|                                                          |');
    print('| 1. Contar la cantidad de palabras.                       |');
    print('|                                                          |');
    print('| 2. Contar la frecuencia de una palabra clave.            |');
    print('|                                                          |');
    print('| 3. Contar la cantidad de caracteres.                     |');
    print('|                                                          |');
    print('| 4. Imprimir contenido.                                   |');
    print('|                                                          |');
    print('| 5. Regresar al menu anterior.                            |');
    print('|                                                          |');
    print('| 0. Salir.                                                |');
    print('|                                                          |');
    print('|__________________________________________________________|');
    print('\n');
    //Pedimos la opcion al usuario
    print('___________');
    stdout.write("Opcion:  ");
    int opcMenuSecundario = int.parse(stdin.readLineSync()!);

    //Condicion para que el menu secundario se adapte segun la respuesta del menu principal
    if(opcMenuPrincipal == 2 && opcMenuSecundario == 1){
        opcMenuSecundario = 11;
      }
      else if(opcMenuPrincipal == 2 && opcMenuSecundario == 2){
        opcMenuSecundario = 12;
    }

    switch(opcMenuSecundario){
        
        case 1://Contador de palabras
          clearScreen();
          print('__________');
          print('|Opcion 1|');
          print('|________|\n\n');
          print("La cantidad de palabras es: ${contadorDePalabras(texto)}");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;
  
        case 2://Buscador de palabras clave
          clearScreen();
          print('__________');
          print('|Opcion 2|');
          print('|________|\n\n');
          stdout.write("Ingrese la palabra clave a buscar: ");
          String palabraClave = stdin.readLineSync()!;
          print("\n\n La frecuencia de la palabra es: ${contadorDePalabrasClave(texto, palabraClave)}");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;
        
        case 3://Contador de caracteres
          clearScreen();
          print('__________');
          print('|Opcion 3|');
          print('|________|\n\n');
          print("La cantidad de caracteres es: ${contadorDeCaracteres(texto)}");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 4://Imprimir contenido
          clearScreen();
          print('__________');
          print('|Opcion 4|');
          print('|________|\n\n');
          print("El texto ingresado es:\n\n $texto\n");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 11://Contador de palabras 2
          clearScreen();
          print('__________');
          print('|Opcion 1|');
          print('|________|\n\n');
          print("La cantidad de palabras es: ${contadorDePalabras(texto)}");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;

        case 12://Buscador de palabras clave 2
          clearScreen();
          print('__________');
          print('|Opcion 2|');
          print('|________|\n\n');
          print("Ingrese la palabra clave a buscar: ");
          String palabraClave = stdin.readLineSync()!;
          print("La frecuencia de la palabra es: ${contadorDePalabrasClave(texto, palabraClave)}");
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          break;
  
        case 5://regresar al menu anterior
          clearScreen();
          print('\n\n Presiona enter para regresar al menu anterior...');
          stdin.readLineSync()!;
          Menu();
          break;
  
        case 0://salir
          clearScreen();
          print('Seguro que deseas salir ?');
          stdout.write("\n\n S o N_: ");
          String respuesta = stdin.readLineSync()!;

          //condicion para salir del programa
          if(respuesta == 'S' || respuesta == 's'){
            valor = true;
            clearScreen();
            exit(0);
          }
          else{
              clearScreen();
              print("Opcion no valida");
              print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
              stdin.readLineSync()!;
            }
          clearScreen();
          break;
  
        default://opcion no valida en el menu secundario
          clearScreen();
          print('Opcion no valida');
          print('\n\n\n\n\n\n\n\n Presiona enter para continuar...');
          stdin.readLineSync()!;
          clearScreen();
          break;
    }//fin del switch
  }//fin del for
}//fin de la funcion menuSecundario