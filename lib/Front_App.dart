import 'package:flutter/material.dart';
import 'package:flutter_application_pruebas/main.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: FirstScreen(), // Establecemos la primera pantalla
    );
  }
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: Container(
          // Aseguramos que el contenedor ocupe toda la pantalla
          width: double.infinity, // Asegura que el contenedor ocupe todo el ancho
          height: double.infinity, // Asegura que el contenedor ocupe todo el alto

          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Background.JPG'), // Imagen de fondo
              fit: BoxFit.cover, // Cubre toda el área de la pantalla
            ),
          ),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top: 20), // Espacio arriba

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),

                  child: Container(
                    height: 525,
                    width: 300,
                    color: Colors.white,

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                        '¡Hola!\n Bienvenido/a!',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                        ),

                        textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 40), 

                          Text(
                        'Calculadora\n de prestaciones\n económicas',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),

                        textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),

                          Text(
                        'Basado en la ley 462 del\n 18 de Marzo de 2025',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),

                        textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 50),

                           Text(
                        'Creado por:\n Andrea Carrera | Adriana Solanilla',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                        ),

                        textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 30),
                          
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DateForm(),
                                ),
                              );
                              },

                               child: Text('Comenzar'),
                               style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent,
                                foregroundColor: Colors.white,
                                minimumSize: Size(200, 50),
                                textStyle: TextStyle(fontSize: 20),
                                elevation: 5,
                                shadowColor: Colors.grey.withOpacity(0.8)

                               ),

                          ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}
