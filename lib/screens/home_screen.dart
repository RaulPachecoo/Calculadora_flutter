import 'dart:math';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String contador = '0';

  @override
  Widget build(BuildContext context) {
    const tamano30 = TextStyle(fontSize: 30, color: Colors.black);

    String borrarUltimoCaracter(String texto) {
      if (texto.isNotEmpty) {
        return texto.substring(0, texto.length - 1);
      } else {
        return texto;
      }
    }

    double evaluarExpresion(String expresion) {
      Parser p = Parser();
      ContextModel cm = ContextModel();
      double resultado = 0;

      if (expresion.startsWith('√')) {
        double numero = double.parse(expresion.substring(1));
        resultado = sqrt(numero);
      } else {
        Expression exp = p.parse(expresion);
        resultado = exp.evaluate(EvaluationType.REAL, cm);
      }

      return resultado;
    }

    void ejecutarIgual() {
      setState(() {
        try {
          double resultado = evaluarExpresion(contador);
          if (resultado % 1 == 0) {
            contador = resultado.toInt().toString();
          } else {
            contador = resultado.toString();
          }
        } catch (e) {
          contador = 'Error';
        }
      });
    }

    FloatingActionButton buildNumbersButton(String text, Function onPressed) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(text),
        onPressed: () => onPressed(),
      );
    }

    FloatingActionButton buildOperatorButton(String text, Function onPressed) {
      return FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(text),
        onPressed: () => onPressed(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(contador, style: tamano30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Expanded(
                child: buildOperatorButton('%', () {
                  if (contador != '0') {
                    contador = '$contador%';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('CE', () {
                  contador = '0';
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('C', () {
                  contador = '0';
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('⌫', () {
                  contador = borrarUltimoCaracter(contador);
                  if (contador == '') {
                    contador = '0';
                  }
                  setState(() {});
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildOperatorButton('1/x', () {
                  double valor = double.parse(contador);
                  if (valor != 0) {
                    contador = (1 / valor).toString();
                  }else{
                    contador = 'Error: no se puede dividir por cero'; 
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('x²', () {
                  contador = '$contador^2';
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('√', () {
                  if (contador == '0') {
                    contador = '√';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('÷', () {
                  contador = '$contador/';
                  setState(() {});
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildNumbersButton('7', () {
                  if (contador == '0') {
                    contador = '7';
                  } else {
                    contador = '${contador}7';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('8', () {
                  if (contador == '0') {
                    contador = '8';
                  } else {
                    contador = '${contador}8';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('9', () {
                  if (contador == '0') {
                    contador = '9';
                  } else {
                    contador = '${contador}9';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('x', () {
                  contador = '$contador*';
                  setState(() {});
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildNumbersButton('4', () {
                  if (contador == '0') {
                    contador = '4';
                  } else {
                    contador = '${contador}4';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('5', () {
                  if (contador == '0') {
                    contador = '5';
                  } else {
                    contador = '${contador}5';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('6', () {
                  if (contador == '0') {
                    contador = '6';
                  } else {
                    contador = '${contador}6';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('-', () {
                  contador = '$contador-';
                  setState(() {});
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildNumbersButton('1', () {
                  if (contador == '0') {
                    contador = '1';
                  } else {
                    contador = '${contador}1';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('2', () {
                  if (contador == '0') {
                    contador = '2';
                  } else {
                    contador = '${contador}2';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('3', () {
                  if (contador == '0') {
                    contador = '3';
                  } else {
                    contador = '${contador}3';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildOperatorButton('+', () {
                  contador = '$contador+';
                  setState(() {});
                }),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: buildNumbersButton('+/-', () {
                  if (contador != '0') {
                    if (contador.startsWith('-')) {
                      contador = contador.substring(1);
                    } else {
                      contador = '-$contador';
                    }
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('0', () {
                  if (contador == '0') {
                    contador = '0';
                  } else {
                    contador = '${contador}0';
                  }
                  setState(() {});
                }),
              ),
              Expanded(
                child: buildNumbersButton('.', () {
                  contador = '$contador.';
                  setState(() {});
                }),
              ),
              Expanded(
                child: FloatingActionButton(
                  backgroundColor: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Text('='),
                  onPressed: () {
                    ejecutarIgual();
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
