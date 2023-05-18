import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/database/database.dart';
import 'package:to_do_list/utils/alert_dialog.dart';
import 'package:to_do_list/utils/list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();
  
  @override
  void initState(){
    super.initState();
    //if user opens the app for the first time
      if (_myBox.get('TODOLIST')== null){
        db.createInitData();
      }
      //data already exists
      else{
        db.loadData();
      }
  }

  
  final _controller = TextEditingController();

  void onChanged(int index, bool? value){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();

  }
  void createNewTask(){
      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) {
          return DialogBox(
            controller: _controller,
             onCancel: () {
              Navigator.of(context).pop();
               }, 
             onSave: () { 
                saveNewTask();
              },
          );
        },
        );

  }

  void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
       db.updateData();
  }

  void removeTask(int index){
   setState(() {
      db.todoList.removeAt(index);
   });
      db.updateData();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do App',
        textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
          size: 40,
          ),
        ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskName: db.todoList[index][0],
             isCompleted: db.todoList[index][1],
              onChanged:(value) => onChanged(index, value) ,
              deletePressed: ()
              =>
                removeTask(index)
              );
        },
        ),
    );
  }
}