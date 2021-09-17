import 'package:flutter/material.dart';
import 'package:gym_app/pages/users_pages/home_trainer_page/home_trainer_widgets/home_trainer_body_content.dart';
import 'package:gym_app/shared/models/user.dart';

class HomeTrainerBodyWidget extends StatelessWidget {
  final User model;
  final List<User>? listStudents;

  HomeTrainerBodyWidget(this.model, {this.listStudents});

  @override
  Widget build(BuildContext context) {
    return (!model.isWithGym!)
        ? Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/key.png"),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                  model.publicCode!,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                  (model.isTrainer!)
                      ? "Passe esse código para o gestor,  para que você consiga entrar na academia, e ter acesso às funcionalidades."
                      : "Passe esse código para o seu treinador,  para que você consiga entrar na academia, e ter acesso aos treinos passados por ele.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : Container(
            child: HomeTrainerBodyContent(
              listModels: listStudents,
            ),
          );
  }
}
