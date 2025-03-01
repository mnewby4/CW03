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
  List<Task> taskList= [];

   _addTask() {
    setState(() {
      taskList.add(Task(text1.text, false));
    });
    //print(taskList[taskList.length - 1].taskName);
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
            /*Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _taskName.length,
                  itemBuilder: (context, index) {
                    /*return GestureDetector(
                      onTap: () {
                        //push=adds route to stack of routes managed by navigator
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetailsPage(
                            recipeName: _taskName[index],
                          )),
                        );*/
                      },
                      child: ListTile(
                        title: Text(_taskName[index]),
                      ),
                    );
                    return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: taskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          color: Colors.amber,
                          child: Center(child: Text('Task: ${taskList[index]}')),
                        );
                      }
                    );
                  },
                ),
              ),*/
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
