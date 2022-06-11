import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class taxbenifit extends StatefulWidget {
  const taxbenifit({
    Key? key,
  }) : super(key: key);
  @override
  State<taxbenifit> createState() => _taxbenifit();
}

class _taxbenifit extends State<taxbenifit> {
  
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
          children: const <Widget>[
             Spacer(),
             Text("Plastic Bottles"),
             Spacer(),
          ],
        ),
      ),
    );
  }
}
