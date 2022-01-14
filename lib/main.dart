import 'package:flutter/material.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  List Tasks = [];
  String inputext = ' ';
  var fieldtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('TASK'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40.0,
                decoration: BoxDecoration(
                    color: Colors.brown.shade800,
                    borderRadius: BorderRadiusDirectional.circular(30.0)),
                child: Center(
                    child: Text('${Tasks.length}',
                        style: TextStyle(fontSize: 18.0))),
              ),
            )
          ],
          backgroundColor: Colors.brown,
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.brown.shade100,
              child: TextFormField(
                controller: fieldtext,
                onChanged: (text) {
                  inputext = text;
                },
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter a task',
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
                maxLines: 6,
                style: TextStyle(color: Colors.brown, fontSize: 23.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (inputext != "") {
                          Tasks.insert(0, inputext);
                          inputext = "";
                          fieldtext.clear();
                        }
                      });
                    },
                    child: Text(
                      'Add',
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade800),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: Tasks.map((task) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.brown.shade100,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    ' ${Tasks.indexOf((task)) + 1}',
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                child: Text('${task}',
                                    style: TextStyle(fontSize: 20.0)),
                                alignment: Alignment.center,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      Tasks.remove(task);
                                    });
                                  },
                                  icon: Icon(Icons.delete_forever, size: 30.0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
