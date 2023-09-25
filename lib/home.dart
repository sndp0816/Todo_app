import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/colors.dart';
import 'package:todo/data/database.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _sndpbox = Hive.box('sndpbox');
  ToDoDatabase db = ToDoDatabase();

  //init state
  @override
  void initState() {
    //if the user is opening the app first time then
    if (_sndpbox.get("todolist") == null) {
      db.initializeddata();
    } else {
      //alredy exist data
      db.loadData();
    }

    super.initState();
  }

//text controller
  final _contorller = TextEditingController();

  //list of todo task
  //here is the dummy data
  // List toDoList = [
  //   ["sndp", false],
  //   ["yoga", true],
  //   ['homework', false]
  // ];

  //checkbox change or check box tapped
  void checkBoxChaneg(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //save new tasks
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_contorller.text, false]);
      Navigator.of(context).pop();
      _contorller.clear();
    });
    db.updateDatabase();
  }

  //create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _contorller,
          OnSave: saveNewTask,
          OnCancel: () => Navigator.of(context).pop(),
        );
      },
    );
    
  }

  //deleting the task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgcolor,
        appBar: AppBar(
          title: const Center(child: Text("TO DO")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskname: db.toDoList[index][0],
              taskcompleted: db.toDoList[index][1],
              onChange: (value) => checkBoxChaneg(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
