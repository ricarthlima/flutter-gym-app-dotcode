import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButton = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryButton = Color.fromARGB(255, 230, 230, 255);
  Color _gradientMainColor = Color.fromARGB(255, 0, 75, 200);
  Color _gradientSecColor = Color.fromARGB(255, 75, 175, 255);
  Color _appBarMainColor = Color(0xff0A6D92);

  Color getActivePrimaryButtonColor() {
    return _activePrimaryButton;
  }

  Color getActiveSecondaryButton() {
    return _activeSecondaryButton;
  }

  Color getGradientMainColor() {
    return _gradientMainColor;
  }

  Color getGradientSecondaryColor() {
    return _gradientSecColor;
  }

  Color getAppBarMainColor() {
    return _appBarMainColor;
  }
}
