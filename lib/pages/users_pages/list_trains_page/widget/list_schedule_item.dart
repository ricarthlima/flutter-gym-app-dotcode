import 'package:flutter/material.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/models/schedule_block.dart';

class ListScheduleItem extends StatelessWidget {
  final ScheduleBlock scheduleBlock;
  ListScheduleItem(this.scheduleBlock);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      scheduleBlock.name!,
                      style: TextStyle(
                        color: CustomColors().getAppBarMainColor(),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: CustomColors().getAppBarMainColor(),
                      size: 18,
                    ),
                    Padding(padding: EdgeInsets.only(left: 8)),
                    Text(
                      scheduleBlock.startDate.toString() +
                          " - " +
                          scheduleBlock.endDate.toString(),
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              alignment: Alignment.bottomRight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                width: 128,
                decoration: BoxDecoration(
                    color: CustomColors().getAppBarMainColor(),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Text(
                  (scheduleBlock.isFinished!) ? "Concluído" : "Em andamento",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }
}
