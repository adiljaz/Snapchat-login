import 'package:flutter/material.dart';
import 'package:freeeeee/splash.dart';

final save_key_name='user logidin';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:'snapcht',
      theme: ThemeData(primarySwatch: Colors.amber),
      home:SplashScren() ,
      
    );
  }



}