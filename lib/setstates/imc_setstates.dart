import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:maximc/widget/imc_gauge.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var imc = 0.0;

  Future<void> _calcularIMC(
      {required double peso, required double altura}) async {
    setState(() {
      imc = 0;
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      imc = peso / pow(altura, 2);
    });
  }

  @override
  void dispose() {
    pesoEC.dispose();
    alturaEC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC/DEV:Maxiwel Eduardo '),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ImcGauge(imc: imc),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: pesoEC,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        symbol: '',
                        turnOffGrouping: true,
                        decimalDigits: 2,
                      ),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Peso Obrigatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Peso',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: alturaEC,
                    inputFormatters: [
                      CurrencyTextInputFormatter(
                        locale: 'pt_BR',
                        symbol: '',
                        turnOffGrouping: true,
                        decimalDigits: 2,
                      ),
                    ],
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Altura Obrigatorio';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Altura',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      var formValid =
                          _formKey.currentState?.validate() ?? false;

                      if (formValid) {
                        var formatter = NumberFormat.simpleCurrency(
                          locale: 'pt_BR',
                          decimalDigits: 2,
                        );
                        double peso = formatter.parse(pesoEC.text) as double;
                        double altura =
                            formatter.parse(alturaEC.text) as double;

                        _calcularIMC(peso: peso, altura: altura);
                      }
                    },
                    child: const Text(
                      'Calcular IMC',
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
