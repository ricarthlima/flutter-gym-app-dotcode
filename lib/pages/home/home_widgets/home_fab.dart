import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_modal_add.dart';
import 'package:gym_app/pages/users_pages/home_trainer_page/home_trainer_widgets/home_trainer_modal_add.dart';
import 'package:gym_app/shared/models/user.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_list_model.dart';

FloatingActionButton getHomeFab(
    {bool? isAdm,
    BuildContext? context,
    List<HomeListModel>? listHomeListModel,
    List<User>? listUsers,
    Function? fncRefresh}) {
  return FloatingActionButton(
    child: Text(
      "+",
      style: TextStyle(fontSize: 24),
    ),
    onPressed: () async {
      return await showBarModalBottomSheet(
        context: context!,
        builder: (context) {
          if (isAdm!) {
            return HomeModalAdd(
              listModels: listHomeListModel,
              fncRefresh: fncRefresh,
            );
          }

          return HomeTrainerModalAdd(
            listModels: listUsers,
            fncRefresh: fncRefresh,
          );
        },
      );
    },
  );
}
