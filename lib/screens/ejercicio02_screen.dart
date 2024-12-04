import 'package:flutter/material.dart';

class Ejercicio02Screen extends StatelessWidget {
  final TextEditingController _velocidadController = TextEditingController();

  void calcularDistancia(BuildContext context) {
    final velocidad = double.tryParse(_velocidadController.text);

    if (velocidad == null || velocidad < 0) {
      _mostrarMensaje(context, 'Por favor, ingresa una velocidad válida.');
      return;
    }

    const tiempo = 100; // Tiempo constante de 100 segundos
    final distancia = velocidad * tiempo;

    _mostrarMensaje(context, 'La distancia recorrida es ${distancia.toStringAsFixed(2)} metros.');
  }

  void _mostrarMensaje(BuildContext context, String mensaje) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado'),
          content: Text(mensaje),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio02: Movimiento Rectilíneo'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/id/237/600/800'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Calcula la distancia recorrida\n(Movimiento Rectilíneo Uniforme)',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _velocidadController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Velocidad (m/s)',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.black54,
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => calcularDistancia(context),
                  child: const Text('Calcular Distancia'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
