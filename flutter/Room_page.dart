import 'package:flutter/material.dart';
import 'package:task3/patients_page.dart';

class Room_page extends StatefulWidget {
  const Room_page({Key? key}) : super(key: key);

  @override
  State<Room_page> createState() => _Room_pageState();
}

class _Room_pageState extends State<Room_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: const Text(
                  'ICU Rooms',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 35),
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: const Text('Room 1',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: Colors.white,
                      )),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Patients_page()),
                    );
                  },
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Room 2',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Patients_page()),
                    );
                  },
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Room 3',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Patients_page()),
                    );
                  },
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Room 4',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Patients_page()),
                    );
                  },
                )),
            Container(
                height: 100,
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: ElevatedButton(
                  child: Text('Room 5',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 30,
                          color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Patients_page()),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
