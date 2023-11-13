import 'package:flutter/material.dart';
import 'package:freeeeee/home.dart';

import 'package:freeeeee/login.dart';
import 'package:freeeeee/main.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScren extends StatefulWidget {
  const SplashScren({super.key});

  @override
  State<SplashScren> createState() => _SplashScrenState();
}



class _SplashScrenState extends State<SplashScren> {





  @override
  void initState() {

     checkuserlogdin();
    // TODO: implement initState
    super.initState();

   

    


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset('images/snap.png',height: 200 ,),
          ),

        ],

        
      ),

      bottomSheet: Container(
        child: Padding(padding: EdgeInsets.all(16 ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(' SnapChat  ',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20 ),),
            
          ],
        ),),
      ),


      
      
     
    );
  }

  Future<void>gotoLOgin() async{

    await Future.delayed(Duration(seconds: 3));


    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

  }


Future<void> checkuserlogdin()async{

  final _sharedpref= await SharedPreferences.getInstance();
   final _login= _sharedpref.getBool(save_key_name);

   if(_login==null||_login==false){

    gotoLOgin();
   }else{

    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));

   }

  

  

  




}


 
}