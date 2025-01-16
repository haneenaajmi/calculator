import 'package:calculator_app/utils/color_constants/color_constants.dart';
import 'package:calculator_app/utils/text_constants/text_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorAppHome(),
    );
  }
}

class CalculatorAppHome extends StatefulWidget {
  const CalculatorAppHome({super.key});

  @override
  State<CalculatorAppHome> createState() => _CalculatorAppHomeState();
}

class _CalculatorAppHomeState extends State<CalculatorAppHome> {
  String equation = "0";
  String result = "0";
  String expression = " ";

  buttonPressed(btnText) {
    setState(() {
      if (btnText == 'AC') {
        equation = '0';
        result = '0';
      } else if (btnText == '<') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = '0';
        }
      } else if (btnText == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');
        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          'error';
        }
      } else {
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  Widget calButtons(
      String btnText, Color txtColor, double btnWidth, Color btncolour) {
    return InkWell(
      onTap: () {
        buttonPressed(btnText);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80,
        width: btnWidth,
        decoration: BoxDecoration(
            color: btncolour, borderRadius: BorderRadius.circular(50)),
        child: Text(btnText, style: TextConstant.btntxt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 100),
          ),
        ),
        centerTitle: true,
        backgroundColor: ColorConstant.appbarColor,
        title: Text("Calculator", style: TextConstant.mainHeading),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // expressions
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 60,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                equation,
                style: TextStyle(
                  color: ColorConstant.appbarColor,
                  fontSize: 38,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // result
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            height: 70,
            width: double.infinity,
            color: Colors.black,
            child: SingleChildScrollView(
              child: Text(
                result,
                style: TextStyle(
                  color: ColorConstant.textcolor,
                  fontSize: 60,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('AC', Colors.white, 80, Colors.grey[700]!),
                    calButtons('<', Colors.white, 80, Colors.grey[700]!),
                    calButtons('%', Colors.white, 80, Colors.grey[700]!),
                    calButtons('/', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('7', Colors.white, 80, Colors.grey[700]!),
                    calButtons('8', Colors.white, 80, Colors.grey[700]!),
                    calButtons('9', Colors.white, 80, Colors.grey[700]!),
                    calButtons('x', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('4', Colors.white, 80, Colors.grey[700]!),
                    calButtons('5', Colors.white, 80, Colors.grey[700]!),
                    calButtons('6', Colors.white, 80, Colors.grey[700]!),
                    calButtons('-', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('1', Colors.white, 80, Colors.grey[700]!),
                    calButtons('2', Colors.white, 80, Colors.grey[700]!),
                    calButtons('3', Colors.white, 80, Colors.grey[700]!),
                    calButtons('+', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('0', Colors.white, 210, Colors.grey[700]!),
                    calButtons('.', Colors.white, 80, Colors.grey[700]!),
                    calButtons('=', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
