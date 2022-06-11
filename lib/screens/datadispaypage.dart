import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class display extends StatefulWidget {
  const display({
    Key? key,
  }) : super(key: key);
  @override
  State<display> createState() => _display();
}

class _display extends State<display> {
  var totalRecycledCount;
  var yourRecycledCount;
  var yourRecyclabledBoughtCount;
  bool loading = true;
  bool user = false;
  var name;

  @override
  getData1() async {
    final firestoreInstance = FirebaseFirestore.instance;

    firestoreInstance
        .collection("EddieShowBenifts")
        .doc("IzyT4tkk7UYZbJqYjOrc")
        .get()
        .then((eddieData) {
      firestoreInstance
          .collection("EkamShowBenifts")
          .doc("v5qkYm7QDtuPRv7HrzGI")
          .get()
          .then((ekamData) {
        setState(() async {
          totalRecycledCount =
              eddieData['num_recycled'] + ekamData['num_recycled'];

          loading = false;
          //get user data
          final prefs = await SharedPreferences.getInstance();
          user = prefs.getBool('deleteAll') ?? false;
          setState(() {
            if (user) {
              yourRecycledCount = eddieData['num_recycled'];
              yourRecyclabledBoughtCount = eddieData['bought_recycled'];
              name = "Eddie's";
            } else {
              yourRecycledCount = ekamData['num_recycled'];
              yourRecyclabledBoughtCount = ekamData['bought_recycled'];
              name = "Ekam's";
            }
          });
        });
      });
    });
  }

  @override
  void initState() {
    getData1();
  }

  // final Stream<QuerySnapshot> data =
  //     FirebaseFirestore.instance.collection('recyclingdisplay').snapshots();

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
                child: loading
                    ? const CircularProgressIndicator()
                    : Center(
                        child: Column(
                          children: [
                            const Spacer(),
                            const Text("Total Recycled Items",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(totalRecycledCount.toString()),
                            const Spacer(
                              flex: 5,
                            ),
                            Text("$name Recyclable Bought Items",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(yourRecyclabledBoughtCount.toString()),
                            const Spacer(
                              flex: 5,
                            ),
                            Text("$name Recycled Items",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text(yourRecycledCount.toString()),
                            const Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
