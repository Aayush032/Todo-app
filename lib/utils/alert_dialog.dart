import 'package:flutter/material.dart';
import 'package:to_do_list/utils/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             TextField(
            controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a task',
                border: OutlineInputBorder(),
                
              ),
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save Button
                MyButton(
                  buttonName: 'Save',
                   isPressed: (){
                    return onSave();

                   },),
                const SizedBox(width: 10,),
                //Cancel Button
                MyButton(
                  buttonName: 'Cancel',
                   isPressed: (){
                    return onCancel();

                   })
              ],

            )
          ],
        ),
      ),
    );
  }
}