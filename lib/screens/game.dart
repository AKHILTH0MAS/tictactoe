import 'package:flutter/material.dart';

import '../colors.dart';

List<String> displayXO = ['', '', '', '', '', '', '', '', ''];

int filledBoxes = 0;

class Game extends StatefulWidget {
  const Game({super.key});
  static String routeName = '/game';

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  List<String> selectedindex = [];
  bool oTurn = true;
  bool xWinner = false;
  bool oWinner = false;
  bool draw = false;
  bool gesture = true;
  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      xWinner = false;
      oWinner = false;
      draw = false;
      gesture = true;
      selectedindex = [];
    });
    filledBoxes = 0;
    oTurn = true;
  }

  void _showWinDialog(String winner) {
    setState(() {
      winner == 'X' ? xWinner = true : oWinner = true;
      gesture = false;
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

  _changeColorGrid(int a, int b, int c) {
    setState(() {
      selectedindex.add(a.toString());
      selectedindex.add(b.toString());
      selectedindex.add(c.toString());
    });
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
      _changeColorGrid(0, 1, 2);
    } else if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog(displayXO[3]);
      _changeColorGrid(3, 4, 5);
    } else if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
      _changeColorGrid(6, 7, 8);
    } else if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
      _changeColorGrid(0, 3, 6);
    } else if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog(displayXO[1]);
      _changeColorGrid(1, 4, 7);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
      _changeColorGrid(2, 5, 8);
    } else if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
      _changeColorGrid(0, 4, 8);
    } else if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
      _changeColorGrid(2, 4, 6);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
          Expanded(
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
                    gesture ? _tapped(index) : null;
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: (selectedindex.contains(index.toString()))
                          ? Colors.grey
                          : Colors.white,
                      border: Border.all(
                        color: primaryColor,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: TextStyle(
                          color: (displayXO[index] == 'X') ? xColor : oColor,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  _clearBoard();
                },
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "New",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _clearBoard();
                },
                style: TextButton.styleFrom(
                  foregroundColor: primaryColor,
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
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          if (xWinner) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "X Wins!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
          if (oWinner) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "O Wins!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
          if (filledBoxes == 9 && oWinner == false && xWinner == false) ...[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "Draw!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
            ),
          ],
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
        ],
      ),
    );
  }
}
