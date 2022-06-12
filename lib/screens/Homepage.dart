import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:montyhacks2022/screens/datadispaypage.dart';
import 'package:montyhacks2022/screens/login/loginScreen.dart';
import 'package:montyhacks2022/screens/taxbenift.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Edtaxbenifts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool islogin1 = false;
  bool user = false;
  @override
  getData1() async {
    final prefs = await SharedPreferences.getInstance();
    user = prefs.getBool('deleteAll') ?? false;
    islogin1 = prefs.getBool('EKdeleteAll') ?? false;
    setState(() {});
  }

  @override
  void initState() {
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    final firestoreInstance = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.turn_left_sharp, color: Colors.white),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final user = await prefs.remove('deleteAll');

            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ),
            );
          },
        ),
        title: Text(user ? 'Welcome Back Eddie' : 'Welcome back Ekam'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 6,
              child: Image.asset(
                'lib/sourse/637484690169470000.png',
                // height: 400,
                // width: 400,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const display()),
                      );
                    },
                    child: const Text('Global Data')),
              ),
            ),
            const Spacer(flex: 2),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      if (user == false) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const taxbenifit()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Edtaxbenifit()),
                        );
                      }
                    },
                    child: const Text('Tax Benefit')),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (user == true) {
                    firestoreInstance
                        .collection("EddieShowBenifts")
                        .doc("IzyT4tkk7UYZbJqYjOrc")
                        .get()
                        .then((info) {
                      int boughtRecycled = info.data()!['bought_recycled'];
                      firestoreInstance
                          .collection("EddieShowBenifts")
                          .doc("IzyT4tkk7UYZbJqYjOrc")
                          .update({
                        "bought_recycled": boughtRecycled + 1,
                      });
                    });
                  } else {
                    firestoreInstance
                        .collection("EkamShowBenifts")
                        .doc("v5qkYm7QDtuPRv7HrzGI")
                        .get()
                        .then((info) {
                      int boughtRecycled = info.data()!['bought_recycled'];
                      firestoreInstance
                          .collection("EkamShowBenifts")
                          .doc("v5qkYm7QDtuPRv7HrzGI")
                          .update({
                        "bought_recycled": boughtRecycled + 1,
                      });
                    });
                  }
                },
                child: const Text('I Bought a Recyclable Item')),
            const Spacer(),
          ],
        ),
      ),
      //add if you want to add a floating action button
      // floatingActionButton: const FloatingActionButton(
      //   onPressed: null,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
