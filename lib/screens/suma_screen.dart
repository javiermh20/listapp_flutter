import 'package:flutter/material.dart';

class Suma extends StatefulWidget {
  const Suma({super.key});

  @override
  State<Suma> createState() => _SumaState();
}

class _SumaState extends State<Suma> {
  TextEditingController _numero1Controller = TextEditingController();
  TextEditingController _numero2Controller = TextEditingController();

  void _mostrarResultado(BuildContext context) {
    int numero = int.tryParse(_numero1Controller.text) ?? 0;
    int numero2 = int.tryParse(_numero2Controller.text) ?? 0;

    int suma = numero + numero2;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado'),
          content: Text('La suma es: $suma'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suma de numeros'),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _numero1Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Numero 1',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: _numero2Controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Numero 2',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              _mostrarResultado(context);
            },
            child: Text('Sumar'),
          )
        ],
      )),
    );
  }
}
