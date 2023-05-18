import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];
  final _myBox = Hive.box('mybox');

  void createInitData(){
    todoList = [
      ['Create New Task', false],
    ]; 
  }
  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }
  void updateData(){
    _myBox.put("TODOLIST", todoList);
  }
}