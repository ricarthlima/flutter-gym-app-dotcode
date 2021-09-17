import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';
import 'package:gym_app/pages/home/home_widgets/home_drawer.dart';
import 'package:gym_app/pages/home/home_widgets/home_fab.dart';
import 'package:gym_app/pages/users_pages/home_trainer_page/home_trainer_widgets/home_trainer_body.dart';
import 'package:gym_app/shared/models/schedule_block.dart';
import 'package:gym_app/shared/models/user.dart';

class HomeTrainerPage extends StatefulWidget {
  @override
  _HomeTrainerPageState createState() => _HomeTrainerPageState();
}

class _HomeTrainerPageState extends State<HomeTrainerPage> {
  User loggedUser = User(
    isTrainer: true,
    publicCode: "A34C@77S10WS11",
    isWithGym: true,
  );

  List<User> listModels = [
    User(
        name: "Ricarth Lima",
        publicCode: "001",
        isTrainer: false,
        isWithGym: true,
        listSchedules: [
          ScheduleBlock(
            name: "Treino de Janeiro",
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            isFinished: true,
          ),
          ScheduleBlock(
            name: "Treino de Janeiro",
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            isFinished: false,
          ),
        ]),
    User(
        name: "Warley Souza",
        publicCode: "002",
        isTrainer: false,
        isWithGym: true),
    User(
        name: "Monalisa Sousa",
        publicCode: "003",
        isTrainer: false,
        isWithGym: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar("Meus clientes"),
      drawer: getHomeDrawer(),
      floatingActionButton: (loggedUser.isWithGym!)
          ? getHomeFab(
              isAdm: false,
              context: context,
              listUsers: listModels,
              fncRefresh: refreshPage,
            )
          : null,
      body: HomeTrainerBodyWidget(
        loggedUser,
        listStudents: listModels,
      ),
    );
  }

  refreshPage() {
    setState(() {});
  }
}

// LISTA DE WIDGET APRENDIDOS
// Container
// Text
// Scaffold
// AppBar
// Icon
// FloatingActionButton
// Center
