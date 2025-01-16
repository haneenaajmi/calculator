import 'package:calculator_app/utils/color_constants/color_constants.dart';
import 'package:calculator_app/utils/text_constants/text_constants.dart';
import 'package:flutter/material.dart';

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
  Widget calButtons(
      String btnText, Color txtColor, double btnWidth, Color btncolour) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      width: btnWidth,
      decoration: BoxDecoration(
          color: btncolour,
          borderRadius: BorderRadius.circular(
            50,
          )),
      child: Text(btnText, style: TextConstant.btntxt),
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
            color: ColorConstant.textcolor,
            child: Text(
              "0",
              style: TextStyle(
                color: ColorConstant.appbarColor,
                fontSize: 38,
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
            color: ColorConstant.textcolor,
            child: Text(
              "0",
              style: TextStyle(
                color: ColorConstant.appbarColor,
                fontSize: 60,
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
                    calButtons('<-', Colors.white, 80, Colors.grey[700]!),
                    calButtons('%', Colors.white, 80, Colors.grey[700]!),
                    calButtons('/', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('7', Colors.white, 80, Colors.grey[700]!),
                    calButtons('8', Colors.white, 80, Colors.grey[700]!),
                    calButtons('9', Colors.white, 80, Colors.grey[700]!),
                    calButtons('*', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('4', Colors.white, 80, Colors.grey[700]!),
                    calButtons('5', Colors.white, 80, Colors.grey[700]!),
                    calButtons('6', Colors.white, 80, Colors.grey[700]!),
                    calButtons('-', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('1', Colors.white, 80, Colors.grey[700]!),
                    calButtons('2', Colors.white, 80, Colors.grey[700]!),
                    calButtons('3', Colors.white, 80, Colors.grey[700]!),
                    calButtons('+', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    calButtons('0', Colors.white, 210, Colors.grey[700]!),
                    calButtons('.', Colors.white, 80, Colors.grey[700]!),
                    calButtons('=', Colors.white, 80, Colors.grey[700]!),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
