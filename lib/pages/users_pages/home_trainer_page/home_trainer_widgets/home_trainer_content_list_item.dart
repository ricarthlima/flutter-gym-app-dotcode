import 'package:flutter/material.dart';
import 'package:gym_app/pages/users_pages/list_trains_page/list_schedule_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/models/user.dart';

class HomeTrainerListItem extends StatefulWidget {
  final User? user;
  HomeTrainerListItem(this.user);

  @override
  _HomeTrainerListItemState createState() => _HomeTrainerListItemState();
}

class _HomeTrainerListItemState extends State<HomeTrainerListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListSchedulePage(widget.user!, true)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: CustomColors().getAppBarMainColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.account_circle_sharp),
                        Padding(padding: EdgeInsets.only(left: 15)),
                        Text(
                          widget.user!.name!,
                          style: TextStyle(
                            color: CustomColors().getAppBarMainColor(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
