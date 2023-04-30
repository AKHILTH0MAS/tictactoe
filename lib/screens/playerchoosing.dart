import 'package:flutter/material.dart';

class PlayerChoosing extends StatelessWidget {
  const PlayerChoosing({super.key});
  static const String routeName = '/playerChoosing';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 61, 7),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Tic Tac Toe",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Offline multiplayer :)",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  "Decide your sides :)",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 150,
                      width: 130,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Align(
                        child: Text(
                          "X",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 100,
                            color: Color.fromARGB(255, 239, 61, 7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 150,
                      width: 130,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Align(
                        child: Text(
                          "O",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 100,
                            color: Color.fromARGB(255, 239, 61, 7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 239, 61, 7),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
