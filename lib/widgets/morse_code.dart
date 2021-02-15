import 'package:criptically/copy_function.dart';
import 'package:criptically/util/morse_map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MorseCode extends StatefulWidget {


  @override
  _MorseCodeState createState() => _MorseCodeState();
}

class _MorseCodeState extends State<MorseCode> with CopyFunction {
  final GlobalKey<ScaffoldState> _morseState =
  new GlobalKey<ScaffoldState>();
  String _result = "";
  bool _isEncoding = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              title: Text(_switchTitle()),
              value: _isEncoding,
              onChanged: (value) {
                setState(() {
                  _isEncoding = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.border_color),
                hintText: 'Please input your code...',
                border: InputBorder.none,
              ),
              //TODO: let users decide whether what characters to use as dots and dashes
              onChanged: (input) {
                _finalResult(input);
              },
            ),
            SizedBox(height: 8),
            Text(
              _result,
              style: TextStyle(color: Colors.black),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  Clipboard.setData(new ClipboardData(text: _result));
                  _morseState.currentState.showSnackBar(SnackBar(
                    content: Text('Copied: $_result'),
                  ));
                });
              },
              tooltip: 'Copy',
              child: Icon(Icons.content_copy),
            ),
          ],
        ),
      ),
    );
  }

  String _switchTitle() {
    if (_isEncoding) {
      return "Encode";
    } else {
      return "Decode";
    }
  }

  void _finalResult(String input) {
    if (_isEncoding) {
      String encoded = _encodeMorse(input.toLowerCase());
      _setResult(encoded);
    } else {
      String encoded = _decodeMorse(input);
      _setResult(encoded);
    }
  }

  void _setResult(String encoded) {
    setState(() {
      _result = encoded;
    });
  }

  String _decodeMorse(String input) {
      Iterable<String> wordsRaw =
              input.split("/").where((String element) => element.isNotEmpty);

      String decodedMorse = wordsRaw.map((String words) {
            Iterable<String> eachLetter =
                words.split(" ").where((String element) => element.isNotEmpty);

            return eachLetter.map((String letter) {
              return MorseMap.decodeMorseMap[letter] ?? letter;
            }).join("");
          }).join(" ");

    return decodedMorse;
  }

  String _encodeMorse(String input) {
    Iterable<String> eachLetter =  input.split("").where((String element) => element.isNotEmpty);
    return eachLetter.map((String letter) {
      return MorseMap.encodeMorseMap[letter] ?? letter;
    }).join(" ");
  }

  @override
  String copy() {
    return _result;
  }
}

