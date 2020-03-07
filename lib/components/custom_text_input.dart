import 'package:flutter/material.dart';
import 'package:terraforming_mars/theme/colors.dart';

class CustomTextInput extends StatefulWidget {
  TextEditingController textEditingController;

  CustomTextInput(this.textEditingController);

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 30,
      child: TextField(
        controller: widget.textEditingController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        autocorrect: false,
        cursorColor: AppColors.accentColor,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.accentColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 14),
          filled: true,
          fillColor: AppColors.backgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.accentColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.orangeColor, width: 2),
          ),
        ),
      ),
    );
  }
}
