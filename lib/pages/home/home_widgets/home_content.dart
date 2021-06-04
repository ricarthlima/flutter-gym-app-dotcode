import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_item.dart';
import 'package:gym_app/pages/home/home_widgets/home_list_model.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({key}) : super(key: key);

  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  List<HomeListModel> listMockedList = [
    HomeListModel(
      title: "Academia - O Club",
      assetIcon: "assets/icons/gym_icon.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            CustomColors().getGradientMainColor(),
            CustomColors().getGradientSecondaryColor(),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 50,
        horizontal: 20,
      ),
      child: ListView(
        children: [
          HomeListItem(
            homeListModel: listMockedList[0],
          )
        ],
      ),
    );
  }
}
