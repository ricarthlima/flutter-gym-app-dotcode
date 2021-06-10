import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_modal_add.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_list_model.dart';

FloatingActionButton getHomeFab(
  BuildContext context,
  List<HomeListModel> listModels,
  Function fncRefresh,
) {
  return FloatingActionButton(
    child: Text(
      "+",
      style: TextStyle(fontSize: 24),
    ),
    onPressed: () {
      return showBarModalBottomSheet(
        context: context,
        builder: (context) => HomeModalAdd(
          listModels: listModels,
          fncRefresh: fncRefresh,
        ),
      );
    },
  );
}
