import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class login extends StatefulWidget {
  login({
    Key? key,
  }) : super(key: key);

  @override
  _login createState() => _login();
}

class _login extends State<login> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final myController1 = TextEditingController();

    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Auth Key:"),
        Padding(
            padding: const EdgeInsets.all(30),
            child: TextField(
              controller: myController1,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Key',
              ),
            )),
        ElevatedButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              //normal login
              if (myController1.text == '69420') {
                await prefs.setBool('deleteAll', true);

                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyApp(),
                  ),
                );
              }
              //show key wrong
              if (myController1 == '69420') {
                return;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Wrong Key"),
                  ),
                );
              }
               if (myController1.text == '42069') {
                  return;
                }
            },
            child: const Text("Submit"))
      ],
    )));
  }
}
