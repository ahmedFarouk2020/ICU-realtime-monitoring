import 'package:flutter/material.dart';
import 'Room_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 200),
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
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (nameController.text == "jimmy" &&
                        passwordController.text == "1234") {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Room_page()),
                      );
                      print(nameController.text);
                      print(passwordController.text);
                      message = "";
                      setState(() {});
                    } else {
                      message = "the user name or password is not correct";
                      setState(() {});
                    }
                  },
                )),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text('$message', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
