import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Person extends StatefulWidget {
   Person({super.key,required this.name}); 

  String name='adil';

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('adil jaz'),),
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('images/adiljaz.jpg'),

          )
        ],
      )
    );
  }
}