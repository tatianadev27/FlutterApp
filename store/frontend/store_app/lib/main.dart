import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async' as async;
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  Map data;
  List usersData;
  getUsers() async {
    http.Response response = await http.get('http://10.0.2.2:4000/api/users');
    data = json.decode(response.body);
    setState(() {
      usersData = data['users'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("User list"),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "$index",
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
                CircleAvatar(
                    backgroundImage: NetworkImage(usersData[index]['avatar'])
                    ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("${usersData[index]['firstname']} ${usersData[index]['lastname']}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  )),
                
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}
