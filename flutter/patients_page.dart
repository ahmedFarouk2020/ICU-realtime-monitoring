import 'package:flutter/material.dart';
import 'Home_page.dart';

class Patients_page extends StatefulWidget {
  const Patients_page({Key? key}) : super(key: key);

  @override
  State<Patients_page> createState() => _Patients_pageState();
}

class _Patients_pageState extends State<Patients_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: ListView(
          children: <Widget>[
            Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: const Text('Patient 1',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    );
                  },
                )),
            Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Patient 2',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyHomePage()),
                    );
                  },
                )),
            Container(
                height: 200,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Patient 3',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new MyHomePage()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
