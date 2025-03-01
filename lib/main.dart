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
  List<Task> _taskList= [];

   _addTask() {
    setState(() {
      _taskList.add(Task(text1.text, false));
    });
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 10),
            //Row( children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _taskList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _taskList[index].markComplete,
                            onChanged: (bool? value) {
                              setState(() {
                                _markComplete(index);
                              });
                            },
                          ),
                            Text(
                              _taskList[index].taskName,
                              style: TextStyle(
                                color: _taskList[index].markComplete ? Colors.grey : Colors.black,
                              ),
                            ),
                          SizedBox(width: 30.0),
                          SizedBox(
                            child: ElevatedButton(
                              onPressed: () { _deleteTask(index); },
                              child: Text('X'),
                            ),
                          ), 
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
