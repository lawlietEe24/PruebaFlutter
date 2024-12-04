import 'package:flutter/material.dart';

class Ejercicio01Screen extends StatefulWidget {
  @override
  _Ejercicio01ScreenState createState() => _Ejercicio01ScreenState();
}

class _Ejercicio01ScreenState extends State<Ejercicio01Screen> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  String _resultado = '';

  void calcularIMC() {
    final altura = double.tryParse(_alturaController.text);
    final peso = double.tryParse(_pesoController.text);

    if (altura == null || altura <= 0 || peso == null || peso <= 0) {
      setState(() {
        _resultado = 'Por favor, ingresa valores válidos para peso y altura.';
      });
      return;
    }

    final imc = peso / (altura * altura);
    String interpretacion;

    if (imc < 18.5) {
      interpretacion = 'Bajo peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      interpretacion = 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      interpretacion = 'Sobrepeso';
    } else {
      interpretacion = 'Obesidad';
    }

    setState(() {
      _resultado = 'Tu IMC es ${imc.toStringAsFixed(2)} ($interpretacion).';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://picsum.photos/id/237/600/800'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Calcula tu Índice de Masa Corporal (IMC)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Altura (metros)',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Peso (kilogramos)',
                      labelStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: calcularIMC,
                    child: const Text('Calcular IMC'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _resultado,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
