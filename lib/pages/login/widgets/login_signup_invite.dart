import 'package:flutter/material.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LoginSignUpInvite extends StatefulWidget {
  @override
  _LoginSignUpInviteState createState() => _LoginSignUpInviteState();
}

class _LoginSignUpInviteState extends State<LoginSignUpInvite> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: Colors.black,
          ),
        ),
        Text(
          "Ainda não tem uma conta?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // ignore: deprecated_member_use
          child: RaisedButton(
            onPressed: () {
              showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return SignUpPage();
                },
              );
            },
            child: Text("Cadastre-se"),
            color: CustomColors().getActiveSecondaryButton(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
