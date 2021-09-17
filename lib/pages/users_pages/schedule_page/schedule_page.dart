import 'package:flutter/material.dart';
import 'package:gym_app/pages/home/home_widgets/home_appbar.dart';
import 'package:gym_app/pages/users_pages/schedule_page/widgets/schedule_page_content.dart';
import 'package:gym_app/pages/users_pages/schedule_page/widgets/schedule_page_modal_add.dart';
import 'package:gym_app/shared/models/schedule_block.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SchedulePage extends StatelessWidget {
  final bool isTrainerView;
  final ScheduleBlock scheduleBlock;

  SchedulePage(this.scheduleBlock, this.isTrainerView);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getHomeAppBar("Treino de " + scheduleBlock.name!),
      floatingActionButton: (isTrainerView)
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                return await showBarModalBottomSheet(
                  context: context,
                  builder: (context) => SchedulePageModalAdd(),
                );
              })
          : null,
      body: SchedulePageContent(),
    );
  }
}
