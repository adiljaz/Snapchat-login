import 'package:flutter/material.dart';
import 'package:freeeeee/home.dart';
import 'package:freeeeee/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernamecontroller = TextEditingController();
  final _passwordcontrroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      hintText: 'username '),
                  controller: _usernamecontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter  your username';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      hintText: 'password '),
                      obscureText: true,
                  controller: _passwordcontrroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    } else {
                      return null;
                    }
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      checklodin();
                    } else {
                      print('item not found');
                    }
                  },
                  child: Icon(Icons.login),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checklodin() async {
    final _username = _usernamecontroller.text;
    final _password = _passwordcontrroller.text;

    if (_username == 'adil' && _password == '1234') {
      final _sharedpref = await SharedPreferences.getInstance();

      _sharedpref.setBool(save_key_name, true);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("username password doesn't match "),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Color.fromARGB(255, 10, 10, 10),
        ),
      );
    }
  }
}
