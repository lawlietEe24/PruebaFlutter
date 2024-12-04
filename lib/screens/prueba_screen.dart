import 'package:flutter/material.dart';
import 'ejercicio02_screen.dart';

class PruebaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo local
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/id/237/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Nombre del estudiante: Esteban David Jarrin Sanchez',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 248, 245, 245)),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Usuario de GitHub: lawlietEe45',
                  style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 232, 232)),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _showAlert(context);
                  },
                  child: const Text('Ir al Ejercicio02'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Deseas ir al Ejercicio02?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Ejercicio02Screen()),
                );
              },
              child: const Text('Sí'),
            ),
          ],
        );
      },
    );
  }
}
