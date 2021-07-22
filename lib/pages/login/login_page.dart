import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login_service.dart';
import 'package:gym_app/pages/login/widgets/login_form.dart';
import 'package:gym_app/pages/login/widgets/login_signup_invite.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool animLogo = false;
  bool animForm = false;

  @override
  void initState() {
    super.initState();
    activateAnimLogo();
  }

  activateAnimLogo() async {
    await Future.delayed(Duration(milliseconds: 150));
    animLogo = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      animForm = !animForm;
                    });
                  },
                  child: AnimatedContainer(
                    height: (!animLogo) ? 0 : 150,
                    duration: Duration(milliseconds: 800),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 7,
                      ),
                      child: Image.asset(
                        "assets/gymapp-logo02.png",
                        height: 125,
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: !animForm,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 800),
                  opacity: (!animLogo) ? 0 : 1,
                  child: Container(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Clique para começar",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                margin: const EdgeInsets.only(top: 32.0),
                duration: Duration(milliseconds: 800),
                height: (!animForm) ? 0 : 400,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Entrar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LoginForm(),
                      LoginSignUpInvite(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
