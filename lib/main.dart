import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Center(
              child: SizedBox(
                  width: 44,
                  child: Text('Dice')),
            ),
            backgroundColor: Colors.redAccent,
          ), // AppBar
          body: const DicePage(),

        ),
      ),
      debugShowCheckedModeBanner: false,// Scaffold
    ),
    // MaterialApp
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1; // Initialize to a default value
  int rightDiceNumber = 3;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // Generates a random number between 0 and 5, so add 1 to make it between 1 and 6
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onTap: (){rollDice();}, // Call the function when tapped
              child: Image.asset('assets/Dice/dice$leftDiceNumber.jpg'),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: rollDice, // Call the function when tapped
              child: Image.asset('assets/Dice/dice$rightDiceNumber.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
