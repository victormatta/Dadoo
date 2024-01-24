import 'package:flutter/material.dart';
import 'dart:math';

void main () {
  runApp(DadooApp());
}

class DadooApp extends StatelessWidget {
  const DadooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal.shade700,
        appBar: AppBar(
          title: Center(child: const Text('Dadoos',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          ),
          backgroundColor: Colors.teal.shade900,
        ),
        body: Dadoos(),
      ),
    );
  }
}

class Dadoos extends StatefulWidget {
  const Dadoos({super.key});

  @override
  State<Dadoos> createState() => _DadoosState();
}

class _DadoosState extends State<Dadoos> {
  int diceNumberLeft = 1;
  int diceNumberRight = 1;

 void rightDiceState() {
   setState(() {
     diceNumberRight = Random().nextInt(6) + 1;
     print('The dice number is ${diceNumberRight}');
   });
 }

 void leftDiceState() {
   setState(() {
     diceNumberLeft = Random().nextInt(6) + 1;
     print('The number on dice is ${diceNumberLeft}');
   });
 }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Left Dice',
                style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                ),
                Text('Right Dice',
                style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('The number is: ${diceNumberLeft}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text('The number is: ${diceNumberRight}',
                style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  leftDiceState();
                },
                child: Image.asset('assets/images/dado${diceNumberLeft}.png'),
              ),
            ),
            ),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  rightDiceState();
                },
                child: Image.asset('assets/images/dado${diceNumberRight}.png'),
              ),
            ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      diceNumberLeft = 1;
                      diceNumberRight = 1;
                    });
                    print('Dice has been reset.');
                  }, child:
                const Text('Reset',
                  style: TextStyle(
                      color: Colors.red,
                    fontSize: 17,
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

