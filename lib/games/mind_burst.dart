import 'package:criptically/ui/games_screen.dart';
import 'package:flutter/material.dart';

class MindBurst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GamesScreen()),
                          );
                        },
                        fillColor: Colors.black,
                        child: Icon(
                          Icons.arrow_back,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      )),
                  Text(
                    "Mind Burst",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //TODO: GAME > FACTS ABOUT ANY CIPHER/CODE
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
