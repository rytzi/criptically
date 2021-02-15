import 'dart:ui';
import 'package:criptically/copy_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AtbashCipher extends StatefulWidget {
  @override
  _AtbashCipherState createState() => _AtbashCipherState();
}

class _AtbashCipherState extends State<AtbashCipher> with CopyFunction {
  String _result = "";
  final GlobalKey<ScaffoldState> _atbashState =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.border_color),
                hintText: 'Please input your code...',
                border: InputBorder.none,
              ),
              onChanged: (input) {
                setState(() {
                  _result = _codeAtbash(input);
                });
              },
            ),
            Text(
              _result,
              style: TextStyle(color: Colors.black),
            ),
            // FloatingActionButton(
            //   onPressed: () {
            //     setState(() {
            //       Clipboard.setData(new ClipboardData(text: _result));
            //       _atbashState.currentState.showSnackBar(SnackBar(
            //         content: new Text('Copied: $_result')));
            //     });
            //   },
            //   tooltip: 'Copy',
            //   child: Icon(Icons.content_copy),
            // ),
          ],
        ),
      ),

    );
  }

  String _codeAtbash(String input) {
    var outcome = input.runes.map((e) {
      if ("A".codeUnitAt(0) <= e && e <= "Z".codeUnitAt(0)) {
        return "Z".codeUnitAt(0) - e.toInt() + "A".codeUnitAt(0);
      } else if ("a".codeUnitAt(0) <= e && e <= "z".codeUnitAt(0)) {
        return "z".codeUnitAt(0) - e.toInt() + "a".codeUnitAt(0);
      } else {
        return e;
      }
    });

    return String.fromCharCodes(outcome);
  }

  @override
  String copy() {
    return _result;
  }


}
