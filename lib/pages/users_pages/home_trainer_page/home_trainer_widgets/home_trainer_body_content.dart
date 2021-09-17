import 'package:flutter/material.dart';
import 'package:gym_app/pages/users_pages/home_trainer_page/home_trainer_widgets/home_trainer_content_list_item.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/models/user.dart';

class HomeTrainerBodyContent extends StatefulWidget {
  final List<User>? listModels;
  HomeTrainerBodyContent({this.listModels});

  @override
  _HomeTrainerBodyContentState createState() => _HomeTrainerBodyContentState();
}

class _HomeTrainerBodyContentState extends State<HomeTrainerBodyContent> {
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
        vertical: 40,
        horizontal: 20,
      ),
      child: ListView.builder(
        itemCount: widget.listModels!.length,
        itemBuilder: (context, index) {
          return HomeTrainerListItem(widget.listModels![index]);
        },
      ),
    );
  }
}
