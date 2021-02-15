import 'package:criptically/copy_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numberpicker/numberpicker.dart';

class CaesarCipher extends StatefulWidget {
  @override
  _CaesarCipherState createState() => _CaesarCipherState();
}

class _CaesarCipherState extends State<CaesarCipher> with CopyFunction{
  final GlobalKey<ScaffoldState> _caesarState =
  new GlobalKey<ScaffoldState>();
  final List<int> _num = List<int>.generate(26, (i) => i + 1);

  NumberPicker rotNumberPicker;
  int selectedRot = 1;
  String _result = "";
//  CaesarBloc _bloc = CaesarBloc();
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    super.dispose();
//    _bloc.close();
//  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<CaesarBloc, String>(
    //   builder: (context, result) {
        return Container(
          child:
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                //TODO: FIND A WAY TO IMPLEMENT ROT SELECTION WITH LESS EFFORT NEEDED PROM USER
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 6.0, bottom: 2.0, right: 16.0),
                  child: DropdownButton(
                    dropdownColor: Color(0xFFD9D9D9),
                    isExpanded: true,
                    value: selectedRot,
                    items: _num.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text("Rot $value"),
                      );
                    }).toList(),
                    onChanged: (int value) {
                      setState(() {
                        selectedRot = value;
                      });
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.border_color),
                    hintText: 'Please input your code...',
                    border: InputBorder.none,
                  ),
                  onChanged: (input) {
                    setState(() {
                      _result = _caesarProduct(input);
                    });
                  },
                ),
                Text(
                  _result,
                  style: TextStyle(color: Colors.black),
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      Clipboard.setData(new ClipboardData(text: _result));
                      _caesarState.currentState.showSnackBar(SnackBar(
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
    //   },
    //
    // );
  }


  String _caesarProduct(String input) {
    var encoded = input.runes.map((e) {
      if ((e >= "a".codeUnits[0] && e <= "z".codeUnits[0] - selectedRot) ||
          (e >= "A".codeUnits[0] && e <= "Z".codeUnits[0] - selectedRot)) {
        return e + selectedRot;
      } else
      if ((e >= "z".codeUnits[0] - selectedRot && e <= "z".codeUnits[0]) ||
          (e >= "Z".codeUnits[0] - selectedRot && e <= "Z".codeUnits[0])) {
        return e - (26 - selectedRot);
      } else {
        return e;
      }
    });

    return String.fromCharCodes(encoded);
  }

  @override
  String copy() {
    return _result;
  }
}