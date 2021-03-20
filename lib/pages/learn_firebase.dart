import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LearnFirebase extends StatefulWidget {
  @override
  _LearnFirebaseState createState() => _LearnFirebaseState();
}

class _LearnFirebaseState extends State<LearnFirebase> {
  List<String> listStrings = <String>["Nenhum registro carregado."];
  Uri url =
      Uri.https("gym-app-2da6c-default-rtdb.firebaseio.com", "/words.json");
  TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: (_isLoading)
              ? CircularProgressIndicator()
              : RefreshIndicator(
                  onRefresh: () => _getInformationFromBack(),
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                            labelText: "Insira uma palavra aqui:"),
                        textAlign: TextAlign.center,
                      ),
                      ElevatedButton(
                        onPressed: () => _addStringToBack(),
                        child: Text("Gravar no Firebase"),
                      ),
                      for (String s in listStrings)
                        Text(
                          s,
                          textAlign: TextAlign.center,
                        )
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Future<void> _getInformationFromBack() {
    return http.get(url).then((response) {
      Map<String, dynamic> map = json.decode(response.body);
      listStrings = [];
      map.forEach((key, value) {
        setState(() {
          listStrings.add(map[key]["word"]);
        });
      });
    });
  }

  void _addStringToBack() {
    setState(() {
      this._isLoading = true;
    });

    http
        .post(
      url,
      body: json.encode(
        {"word": _controller.text},
      ),
    )
        .then((value) {
      _getInformationFromBack().then((value) {
        setState(() {
          this._isLoading = false;
        });
        _controller.text = "";
        final snackBar = SnackBar(
          content: Text('A palavra foi gravada com sucesso!'),
          action: SnackBarAction(
            label: "Dispensar",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    });
  }
}
