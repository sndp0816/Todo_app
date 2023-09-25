// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/colors.dart';

class ToDoList extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChange;
  Function(BuildContext)? deleteFunction;

   ToDoList({
    Key? key,
    required this.taskname,
    required this.taskcompleted,
    required this.onChange,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteFunction,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(12),
        )
      ]),

        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //check box
              Checkbox(value: taskcompleted, onChanged: onChange),
              //task name
              Text(taskname,
                style: TextStyle(decoration: taskcompleted?TextDecoration.lineThrough:TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
