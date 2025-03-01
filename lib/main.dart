import 'package:flutter/material.dart';

TextEditingController text1 = TextEditingController();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key, required this.title});

  final String title;

  @override
  State<TaskPage> createState() => _TaskListPage();
}

class Task {
  String taskName;
  bool markComplete;

  Task(this.taskName, this.markComplete);
}

//Main screen of our app
class _TaskListPage extends State<TaskPage> {
  //define list of tasks [obj w name + complete status] as an instance variable
  List<Task> _taskList= [];

   _addTask() {
    setState(() {
      _taskList.add(Task(text1.text, false));
    });
    //print(taskList[taskList.length - 1].taskName);
  }

  _markComplete(int index) {
    setState(() {
      _taskList[index].markComplete = _taskList[index].markComplete ? false : true;
    });
  }

  _deleteTask(int index) {
    setState(() {
      _taskList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task Name',
              ),
              controller: text1,
            ),
            ElevatedButton(
              onPressed: _addTask,
              child: Text('Add Task'),
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: _taskList.length,
                  itemBuilder: (context, index) {
                    return
                      Column( 
                        children: [
                          Checkbox(
                            value: _taskList[index].markComplete, 
                            onChanged: (bool? value) {
                              setState(() {
                                _markComplete(index);
                              });
                            } 
                          ),//checkbox
                          ListTile(
                            title: Text('Task: ' + _taskList[index].taskName + 
                                          ' - Completion: ${_taskList[index].markComplete}',
                                        style: _taskList[index].markComplete ? 
                                          TextStyle(color: Colors.grey) : 
                                          TextStyle(color: Colors.black)
                                    ),
                          ),//listtile
                          ElevatedButton(
                            onPressed: () { _deleteTask(index); },
                            child: const Text('Delete task')),
                        ],//children/widget
                      );//column
                  },
                ),
              ),
          ],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/ 
    );
  }
}
