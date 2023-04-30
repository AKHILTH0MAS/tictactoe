import 'package:flutter/material.dart';

List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

int filledBoxes = 0;

class Game extends StatelessWidget {
  const Game({super.key});
  static const String routeName = '/game';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 61, 7),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const Text(
            "Tic Tac Toe",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text(
            "Game starts with O",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          const GridOfGame(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 239, 61, 7),
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Exit",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      ),
    );
  }
}

class GridOfGame extends StatefulWidget {
  const GridOfGame({super.key});

  @override
  State<GridOfGame> createState() => _GridOfGameState();
}

class _GridOfGameState extends State<GridOfGame> {
  bool oTurn = true;

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledBoxes = 0;
    oTurn = true;
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 239, 61, 7),
          title: const Text(
            "Draw!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Play Again",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 239, 61, 7),
            title: Text(
              "Winner is $winner",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Play Again",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          );
        });
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes += 1;
        const Text('O');
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';

        filledBoxes += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog(displayXO[3]);
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog(displayXO[1]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: const EdgeInsets.all(20),
        itemCount: 9,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 239, 61, 7),
                ),
              ),
              child: Center(
                child: Text(
                  displayXO[index],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 239, 61, 7),
                    fontSize: 50,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
