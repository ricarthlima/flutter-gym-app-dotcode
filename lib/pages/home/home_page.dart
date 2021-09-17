import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';
import 'package:gym_app/pages/home/home_widgets/home_content.dart';
import 'package:gym_app/pages/home/home_widgets/home_drawer.dart';
import 'package:gym_app/pages/home/home_widgets/home_fab.dart';

import 'home_widgets/home_list_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;

  List<HomeListModel> listModels = [
    HomeListModel(
      title: "Academia - O Club",
      assetIcon: "assets/icons/gym_icon.png",
    ),
    HomeListModel(
      title: "Biometa Academia",
      assetIcon: "assets/icons/gym_icon.png",
    ),
    HomeListModel(
      title: "Academia Titanium Core",
      assetIcon: "assets/icons/gym_icon.png",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar("Minhas Academias"),
      drawer: getHomeDrawer(),
      floatingActionButton: getHomeFab(
        isAdm: true,
        context: context,
        listHomeListModel: listModels,
        fncRefresh: refreshPage,
      ),
      body: HomePageContent(
        listModels: listModels,
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
