import 'package:flutter/material.dart';
import 'package:montyhacks2022/screens/datadispaypage.dart';
import 'package:montyhacks2022/screens/taxbenift.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const taxbenifit()),
                      );
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
