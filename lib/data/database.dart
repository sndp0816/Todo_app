import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //referance of our box

  final _sndpbox = Hive.box("sndpbox");

//this is the code run on first time app is installed
  void initializeddata() {
    toDoList = [
      ["sndp", false],
      ["yoga", true],
      ['homework', false]
    ];
  }

  //Load the data form the database
  void loadData() {
    toDoList = _sndpbox.get("todolist");
  }

  void updateDatabase() {
    _sndpbox.put('todolist', toDoList);
  }
}
