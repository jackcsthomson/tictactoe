import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<String>> _gameBoard = [
    ['O', 'X', 'X'],
    ['O', 'O', 'X'],
    ['X', 'O', 'X']
  ];

  String messageText = 'Click to make your move.';

  void _updateBoard(String s) {
    setState(() {});
  }

  Widget buttonBuilder(
      String title, Color buttonColor, Color textColor, double h, double w) {
    return Container(
      height: h,
      width: w,
      color: buttonColor,
      child: Center(
        child: TextButton(
          onPressed: () {
            _updateBoard(title);
          },
          child: SizedBox(
            height: h,
            width: w,
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: textColor, fontSize: 42),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double space = 5.0;
    double buttonW = (width - space * 2) / 3;
    double buttonH = height * ((5 / 6) / 3);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonBuilder(_gameBoard[0][0], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[0][1], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[0][2], Colors.black, Colors.white,
                        buttonH, buttonW),
                  ],
                ),
                SizedBox(height: space),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonBuilder(_gameBoard[1][0], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[1][1], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[1][2], Colors.black, Colors.white,
                        buttonH, buttonW),
                  ],
                ),
                SizedBox(height: space),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonBuilder(_gameBoard[2][0], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[2][1], Colors.black, Colors.white,
                        buttonH, buttonW),
                    SizedBox(width: space),
                    buttonBuilder(_gameBoard[2][2], Colors.black, Colors.white,
                        buttonH, buttonW),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              messageText,
              style: const TextStyle(color: Colors.white, fontSize: 42),
            ),
          ),
        ],
      ),
    );
  }
}
