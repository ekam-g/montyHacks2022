import 'package:flutter/material.dart';

class display extends StatefulWidget {
  const display({
    Key? key,
  }) : super(key: key);
  @override
  State<display> createState() => _display();
}

class _display extends State<display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Display Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  null;
                },
                child: const Text('Number of Recycled vs not')),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
