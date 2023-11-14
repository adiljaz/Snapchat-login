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

      bottomSheet: const Padding(padding: EdgeInsets.all(16 ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(' SnapChat  ',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 20 ),),
          
        ],
      ),),


      
      
     
    );
  }

  Future<void>gotoLOgin() async{

    await Future.delayed(const Duration(seconds: 3));


    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const LoginScreen()));

  }


Future<void> checkuserlogdin()async{

  final sharedpref= await SharedPreferences.getInstance();
   final login= sharedpref.getBool(save_key_name);

   if(login==null||login==false){

    gotoLOgin();
   }else{

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomeScreen()));

   }

  

  

  




}


 
}