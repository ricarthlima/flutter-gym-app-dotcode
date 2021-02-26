import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/models/user_model.dart';
import 'package:gym_app/values/custom_colors.dart';
import 'package:gym_app/values/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientSecondaryColor(),
              CustomColors().getGradientMainColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
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
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                      ),
                    ),
                    TextFormField(
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
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
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                            controller: _confirmInputController,
                            obscureText: true,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "Confirme a Senha",
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
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          onChanged: (bool newValue) {
                            setState(() {
                              this.showPassword = newValue;
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _doSignUp();
                  Navigator.pop(context);
                },
                child: Text("Casdastrar"),
                color: CustomColors().getActiveSecondaryButton(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    User newUser = User(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );

    _saveUser(newUser);
  }

  void _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
