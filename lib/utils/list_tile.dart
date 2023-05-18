import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function (bool?)? onChanged;
  final VoidCallback deletePressed;
   const TaskTile({super.key,
  required this.taskName,
  required this.isCompleted,
  required this.onChanged,
  required this.deletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(15),
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: isCompleted,
             onChanged: onChanged,
             activeColor: Colors.black,
             ),
             Padding(
               padding: const EdgeInsets.all(25.0),
               child: Text(taskName,
                style: TextStyle(
                  fontSize: 20,
                   fontWeight: FontWeight.bold,
                   decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                   ),
                   
                   ),
             ),
             IconButton(
            onPressed: (){
              return deletePressed();
            },
               icon: const Icon(Icons.delete))
        ],
    
      ),
      ),
    );
  }
}