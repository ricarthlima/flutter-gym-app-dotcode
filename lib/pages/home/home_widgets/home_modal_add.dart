import 'package:flutter/material.dart';

import 'home_list_model.dart';

class HomeModalAdd extends StatefulWidget {
  final List<HomeListModel> listModels;
  final Function fncRefresh;

  HomeModalAdd({this.listModels, this.fncRefresh});
  @override
  _HomeModalAddState createState() => _HomeModalAddState();
}

class _HomeModalAddState extends State<HomeModalAdd> {
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Criar Academia",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Qual é o nome da academia?",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 25)),
              ElevatedButton(
                onPressed: () {
                  addInList();
                },
                child: Text("Criar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  addInList() {
    HomeListModel hml = HomeListModel(
      title: _nameController.text,
      assetIcon: "assets/icons/gym_icon.png",
    );
    setState(() {
      widget.listModels.add(hml);
    });

    widget.fncRefresh();

    Navigator.pop(context);
  }
}
