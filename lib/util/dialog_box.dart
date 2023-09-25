// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo/colors.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;
  DialogBox({
    Key? key,
    required this.controller,
    required this.OnSave,
    required this.OnCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: bgcolor,
      content: Container(
        height: 120,
        child: Column(
          //get user input
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task",
                  fillColor: white,
                  filled: true),
            ),

            //save and cancel Button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save Button
                MyButton(
                  text: "Save",
                  onPressed: OnSave,
                ),
                const SizedBox(
                  width: 60,
                ),

                //cancel Butoon
                MyButton(
                  text: "Cancel",
                  onPressed: OnCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
