import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gym_app/pages/sign_up/sign_up_service.dart';
import 'package:gym_app/shared/constants/custom_colors.dart';
import 'package:gym_app/shared/constants/preferences_keys.dart';
import 'package:gym_app/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 30,
      ),
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            CustomColors().getGradientMainColor(),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Cadastre-se!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value.length < 10) {
                        return "Digite um nome maior";
                      }
                      return null;
                    },
                    controller: _nameInputController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "Nome Completo",
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.length < 5) {
                        return "Esse e-mail parece curto demais";
                      } else if (!value.contains("@")) {
                        return "Esse e-mail está meio estranho, não?";
                      }
                      return null;
                    },
                    controller: _mailInputController,
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(
                        Icons.mail_outline,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 15,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value.length < 6) {
                        return "A senha deve ter pelo menos 6 caracteres";
                      }
                      return null;
                    },
                    controller: _passwordInputController,
                    obscureText: (this.showPassword == true) ? false : true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      prefixIcon: Icon(
                        Icons.vpn_key_sharp,
                      ),
                    ),
                  ),
                  (this.showPassword == false)
                      ? TextFormField(
                          validator: (value) {
                            if (value != _passwordInputController.text) {
                              return "As senhas devem ser iguais";
                            }
                            return null;
                          },
                          controller: _confirmInputController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirme a Senha",
                            prefixIcon: Icon(
                              Icons.vpn_key_sharp,
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
                        style: TextStyle(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () {
                _doSignUp();
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
    );
  }

  void _doSignUp() {
    if (_formKey.currentState.validate()) {
      SignUpService().signUp(
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      print("invalido");
    }

    // LoginModel newUser = LoginModel(
    //   name: _nameInputController.text,
    //   mail: _mailInputController.text,
    //   password: _passwordInputController.text,
    //   keepOn: true,
    // );

    // _saveUser(newUser);
  }

  // ignore: unused_element
  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
