import 'package:flutter/material.dart';
import 'package:montyhacks2022/screens/datadispaypage.dart';
import 'package:montyhacks2022/screens/login/loginScreen.dart';
import 'package:montyhacks2022/screens/taxbenift.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Edtaxbenifts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String user = "";
  @override
  getData1() async {
    final prefs = await SharedPreferences.getInstance();
    user = prefs.getString('deleteAll') ?? "";
    setState(() {});
  }

  @override
  void initState() {
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.turn_left_sharp, color: Colors.white),
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final key1 = await prefs.remove('deleteAll');
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => login(),
              ),
            );
          },
        ),
        title: Text("Welcome $user!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
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
                    child: const Text('Number of Recycled vs not')),
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      if (user == "Ekam") {
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
