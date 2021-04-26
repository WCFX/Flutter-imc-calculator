import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var maskFormatter =
      new MaskTextInputFormatter(mask: '#.##', filter: {"#": RegExp(r'[0-9]')});

  String _infoText = 'Informe os seus dados';

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      _infoText = 'Informe seu dados';
    });
  }

  void _calculate() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * 2);

    setState(() {
      if (imc < 18.5) {
        _infoText = 'Abaixo do Peso. (${imc.toStringAsPrecision(4)})';
      }
      if (imc > 18.6 && imc < 24.5) {
        _infoText = 'Peso normal. (${imc.toStringAsPrecision(4)})';
      }
      if (imc > 25 && imc < 30) {
        _infoText = 'Sobrepeso. (${imc.toStringAsPrecision(4)})';
      }
      if (imc > 30) {
        _infoText = 'Ta gordo, vai treinar. (${imc.toStringAsPrecision(4)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Calculadora de IMC'),
            centerTitle: true,
            backgroundColor: Colors.greenAccent,
            actions: [
              IconButton(
                onPressed: () {
                  _resetFields();
                },
                icon: Icon(Icons.refresh_outlined),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 80,
                    color: Colors.greenAccent[700],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira Seu Peso';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Peso (kg)",
                          labelStyle: TextStyle(
                            color: Colors.cyan[300],
                          )),
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      controller: weightController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira Sua Altura';
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Altura (cm)",
                          labelStyle: TextStyle(
                            color: Colors.cyan[300],
                          )),
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.number,
                      maxLength: 4,
                      controller: heightController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _calculate();
                          }
                        },
                        child: Text(
                          'Calcular',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan[300],
                        )),
                  ),
                  Center(
                      child: Text(
                    _infoText,
                    style: TextStyle(
                      color: Colors.greenAccent[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ))
                ],
              ),
            ),
          )),
    );
  }
}
