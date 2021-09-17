import 'package:flutter/material.dart';
import 'package:gym_app/shared/models/schedule_block.dart';

class ListScheduleModalAdd extends StatefulWidget {
  final List<ScheduleBlock>? listModels;
  final Function? fncRefresh;

  ListScheduleModalAdd({this.listModels, this.fncRefresh});
  @override
  _ListScheduleModalAddState createState() => _ListScheduleModalAddState();
}

class _ListScheduleModalAddState extends State<ListScheduleModalAdd> {
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
                "Criar treino",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Nome do treino",
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 16)),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Data de término",
                ),
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

    // Sch hml = User(
    //   name: DateTime.now().toString(),
    // );
    // setState(() {
    //   widget.listModels!.add(hml);
    // });

    widget.fncRefresh!();

    Navigator.pop(context);
  }
}
