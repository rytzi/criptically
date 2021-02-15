import 'package:criptically/ui/games_screen.dart';
import 'package:criptically/widgets/code_cards.dart';
import 'package:flutter/material.dart';

class WordDecoder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: screenSize.height * .40,
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(295.0),
                  bottomLeft: Radius.circular(1.0),
                )),
          ),
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
                    "Word Decoder",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //TODO: GAME > WORDS ENCODE/DECODE
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: [
                          WDCards(
                            title: 'ATBASH CIPHER',
                            tap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WordDecoder()));},
                          ),
                          WDCards(
                            title: 'CAESAR CIPHER',
                            tap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WordDecoder()));},
                          ),
                          WDCards(
                            title: 'MORSE CODE',
                            tap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WordDecoder()));},
                          ),
                          WDCards(
                            title: 'BINARY CODE',
                            tap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => WordDecoder()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
