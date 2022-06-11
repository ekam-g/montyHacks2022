import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class peopleadd extends StatefulWidget {
  const peopleadd({
    Key? key,
  }) : super(key: key);
  @override
  State<peopleadd> createState() => _peopleadd();
}

class _peopleadd extends State<peopleadd> {
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  final myController4 = TextEditingController();
  final myController5 = TextEditingController();
  final myController6 = TextEditingController();
  final myController7 = TextEditingController();
  final myController8 = TextEditingController();

  final firestoreInstance = FirebaseFirestore.instance;

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
            const Text("Plastic Bottles"),
            Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: myController1,
                )),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  firestoreInstance.collection("Survey").add({
                    "Plastic_Bottles": myController1.text,
                    "Glass": myController2.text,
                    "Carboard ": myController3.text,
                    "Plastic_Bottles": myController4.text,
                    "Plastic_Bottles": myController5.text,

                  });
                },
                child: const Text('Summit Survey')),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
