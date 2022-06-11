import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class display extends StatefulWidget {
  const display({
    Key? key,
  }) : super(key: key);
  @override
  State<display> createState() => _display();
}

class _display extends State<display> {
  final Stream<QuerySnapshot> data =
      FirebaseFirestore.instance.collection('recyclingdisplay').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Global Data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 250,
                child: StreamBuilder<QuerySnapshot>(
                  stream: data,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot,
                  ) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 250,
                          width: 250,
                          child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Text('Error');
                    }
                    final display = snapshot.requireData;
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: display.size,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              display.docs[index]['test'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
