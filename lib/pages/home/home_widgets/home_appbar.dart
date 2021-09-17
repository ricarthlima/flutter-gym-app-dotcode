import 'package:flutter/material.dart';

AppBar getHomeAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Color(0xff0A6D92), //0xff => #
    actions: [
      IconButton(
        icon: Icon(
          Icons.more_vert_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
