import 'package:flutter/material.dart';

class peopleadd extends StatefulWidget {
  const peopleadd({
    Key? key,
  }) : super(key: key);
  @override
  State<peopleadd> createState() => _peopleadd();
}

class _peopleadd extends State<peopleadd> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Survey Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text("hsd"),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: myController,
                )),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  null;
                },
                child: const Text('Summit Survey')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
