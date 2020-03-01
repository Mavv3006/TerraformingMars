import 'package:flutter/material.dart';
import 'package:terraforming_mars/components/customIcons.dart';
import 'package:terraforming_mars/theme/colors.dart';

class AddButton extends IconButton {
  AddButton({
    Key key,
    @required VoidCallback onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          icon: CustomIcons.plus,
        );
}

class SubButton extends IconButton {
  SubButton({
    Key key,
    @required VoidCallback onPressed,
  }) : super(
          key: key,
          onPressed: onPressed,
          icon: CustomIcons.minus,
        );
}

class IconButton extends RaisedButton {
  IconButton({
    Key key,
    @required VoidCallback onPressed,
    @required IconData icon,
  }) : super(
          splashColor: AppColors.accentColor,
          key: key,
          onPressed: onPressed,
          child: Icon(
            icon,
            size: 13,
          ),
        );
}

class TextButton extends RaisedButton {
  TextButton({
    Key key,
    @required VoidCallback onPressed,
    @required String text,
  }) : super(
          splashColor: AppColors.accentColor,
          key: key,
          onPressed: onPressed,
          child: Text(
            text,
          ),
          padding: EdgeInsets.all(8),
        );
}

class ActionButton extends RaisedButton {
  ActionButton({
    Key key,
    @required String text,
    @required VoidCallback onPressed,
    double buttonWidth,
  }) : super(
          splashColor: AppColors.accentColor,
          key: key,
          onPressed: onPressed,
          child: SizedBox(
            width: buttonWidth,
            child: Center(
              child: Text(text),
            ),
          ),
          padding: EdgeInsets.all(8),
        );
}
