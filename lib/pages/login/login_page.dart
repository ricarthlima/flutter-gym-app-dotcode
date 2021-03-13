import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/sign_up/sign_up_page.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/constants/preferences_keys.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  bool continueConnected = false;

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 7,
                ),
                child: Image.asset(
                  "assets/dumbbell.png",
                  height: 125,
                ),
              ),
              Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                children: [
                  Checkbox(
                    value: this.continueConnected,
                    onChanged: (bool newValue) {
                      setState(() {
                        this.continueConnected = newValue;
                      });
                    },
                    activeColor: Colors.blue,
                  ),
                  Text(
                    "Continuar contectado?",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    CustomColors().getActivePrimaryButtonColor(),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
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
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = this._mailInputController.text;
    String passForm = this._passwordInputController.text;

    LoginModel savedUser = await _getSavedUser();

    if (mailForm == savedUser.mail && passForm == savedUser.password) {
      print("LOGIN EFETUADO COM SUCESSO.");
    } else {
      print("FALHA NO LOGIN");
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = prefs.getString(PreferencesKeys.activeUser);
    print(jsonUser);

    Map<String, dynamic> mapUser = json.decode(jsonUser);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }
}

// WIDGETS
// BoxDecoration
// LinearGradient
// MediaQuery.of(context).size.width
// SingleChildScrollView
// Column
// Form
// TextFormField
// InputDecoration
// GestureDectector
