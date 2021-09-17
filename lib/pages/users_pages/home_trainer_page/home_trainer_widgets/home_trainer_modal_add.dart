import 'package:flutter/material.dart';
import 'package:gym_app/shared/models/user.dart';

class HomeTrainerModalAdd extends StatefulWidget {
  final List<User>? listModels;
  final Function? fncRefresh;

  HomeTrainerModalAdd({this.listModels, this.fncRefresh});
  @override
  _HomeTrainerModalAddState createState() => _HomeTrainerModalAddState();
}

class _HomeTrainerModalAddState extends State<HomeTrainerModalAdd> {
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
                "Adicionar cliente",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Qual é o código do cliente?",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 16)),
              Text(
                "Insira o código único do atleta para adicionar ele na sua relação de alunos e poder passar os treinos.",
              ),
              Padding(padding: EdgeInsets.only(bottom: 24)),
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
    //TODO: Fazer conexão com o banco

    User hml = User(
      name: DateTime.now().toString(),
    );
    setState(() {
      widget.listModels!.add(hml);
    });

    widget.fncRefresh!();

    Navigator.pop(context);
  }
}
