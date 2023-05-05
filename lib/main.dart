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
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  List _textColList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  int turn = 1;
  String messageText = 'Click to make your move.';
  var winCol = Colors.yellow[200];
  var loseCol = Colors.red[400];

  bool fullBoard(List<List<String>> board) {
    for (List<String> L in board) {
      for (String s in L) {
        if (s == '') {
          return false;
        }
      }
    }
    return true;
  }

  void _updateBoard(int l, int s) {
    setState(() {
      if ((_gameBoard[l][s] == '') ||
          (messageText.contains('win')) ||
          (messageText.contains('Cat'))) {
        if ((messageText.contains('win')) || (messageText.contains('Cat'))) {
          _gameBoard = [
            ['', '', ''],
            ['', '', ''],
            ['', '', '']
          ];

          _textColList = [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ];
        }
        String piece = 'X';
        if (turn == 0) {
          piece = 'O';
        }
        _gameBoard[l][s] = piece;

        if ((_gameBoard[0][0] != '') &&
            ((_gameBoard[0][0] == _gameBoard[0][1]) &&
                (_gameBoard[0][1] == _gameBoard[0][2]))) {
          _textColList[0] = winCol;
          _textColList[1] = winCol;
          _textColList[2] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[1][0] != '') &&
            ((_gameBoard[1][0] == _gameBoard[1][1]) &&
                (_gameBoard[1][1] == _gameBoard[1][2]))) {
          _textColList[3] = winCol;
          _textColList[4] = winCol;
          _textColList[5] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[2][0] != '') &&
            ((_gameBoard[2][0] == _gameBoard[2][1]) &&
                (_gameBoard[2][1] == _gameBoard[2][2]))) {
          _textColList[6] = winCol;
          _textColList[7] = winCol;
          _textColList[8] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[0][0] != '') &&
            ((_gameBoard[0][0] == _gameBoard[1][0]) &&
                (_gameBoard[1][0] == _gameBoard[2][0]))) {
          _textColList[0] = winCol;
          _textColList[3] = winCol;
          _textColList[6] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[0][1] != '') &&
            ((_gameBoard[0][1] == _gameBoard[1][1]) &&
                (_gameBoard[1][1] == _gameBoard[2][1]))) {
          _textColList[1] = winCol;
          _textColList[4] = winCol;
          _textColList[7] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[0][2] != '') &&
            ((_gameBoard[0][2] == _gameBoard[1][2]) &&
                (_gameBoard[1][2] == _gameBoard[2][2]))) {
          _textColList[2] = winCol;
          _textColList[5] = winCol;
          _textColList[8] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[1][1] != '') &&
            (_gameBoard[0][0] == _gameBoard[1][1]) &&
            (_gameBoard[1][1] == _gameBoard[2][2])) {
          _textColList[0] = winCol;
          _textColList[4] = winCol;
          _textColList[8] = winCol;
          messageText = "$piece win's!";
        } else if ((_gameBoard[1][1] != '') &&
            ((_gameBoard[2][0] == _gameBoard[1][1]) &&
                (_gameBoard[1][1] == _gameBoard[0][2]))) {
          _textColList[2] = winCol;
          _textColList[4] = winCol;
          _textColList[6] = winCol;
          messageText = "$piece win's!";
        } else if (fullBoard(_gameBoard)) {
          _textColList[0] = loseCol;
          _textColList[1] = loseCol;
          _textColList[2] = loseCol;
          _textColList[3] = loseCol;
          _textColList[4] = loseCol;
          _textColList[5] = loseCol;
          _textColList[6] = loseCol;
          _textColList[7] = loseCol;
          _textColList[8] = loseCol;
          messageText = "Cat's Game";
        } else {
          messageText = '';
        }

        if (turn == 1) {
          turn = 0;
        } else {
          turn = 1;
        }

        if (messageText == '') {
          String temp = 'X';
          if (piece == 'X') {
            temp = 'O';
          }
          messageText = "It's $temp's turn.";
        }
      }
    });
  }

  Widget buttonBuilder(
      int l, int s, Color buttonColor, Color textColor, double h, double w) {
    return Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        color: buttonColor,
        border: Border.all(width: 0),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            _updateBoard(l, s);
          },
          child: SizedBox(
            height: h,
            width: w,
            child: Center(
              child: Text(
                _gameBoard[l][s],
                style: TextStyle(color: textColor, fontSize: 72),
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
    double buttonW = ((width - space * 2) - 60) / 3;
    double buttonH = height * ((3 / 4) / 3);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonBuilder(0, 0, Colors.black, _textColList[0],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(0, 1, Colors.black, _textColList[1],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(0, 2, Colors.black, _textColList[2],
                          buttonH, buttonW),
                    ],
                  ),
                  SizedBox(height: space),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonBuilder(1, 0, Colors.black, _textColList[3],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(1, 1, Colors.black, _textColList[4],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(1, 2, Colors.black, _textColList[5],
                          buttonH, buttonW),
                    ],
                  ),
                  SizedBox(height: space),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonBuilder(2, 0, Colors.black, _textColList[6],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(2, 1, Colors.black, _textColList[7],
                          buttonH, buttonW),
                      SizedBox(width: space),
                      buttonBuilder(2, 2, Colors.black, _textColList[8],
                          buttonH, buttonW),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: (messageText.contains('Click')) ? 0.0 : 30.0),
            child: Center(
              child: Text(
                messageText,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 42),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
