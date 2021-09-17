import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';
import 'package:gym_app/pages/users_pages/list_trains_page/widget/list_schedule_item.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/models/user.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'widget/list_schedule_modal_add.dart';

class ListSchedulePage extends StatelessWidget {
  final User user;
  final bool isTrainerView;

  ListSchedulePage(this.user, this.isTrainerView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar("Histórico de " + user.name!),
      floatingActionButton: (isTrainerView)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                return await showBarModalBottomSheet(
                  context: context,
                  builder: (context) => ListScheduleModalAdd(),
                );
              })
          : null,
      body: Container(
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
            itemCount: user.listSchedules!.length,
            itemBuilder: (context, index) {
              return ListScheduleItem(user.listSchedules![index]);
            }),
      ),
    );
  }
}
