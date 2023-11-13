import 'package:flutter/material.dart';
import 'package:freeeeee/login.dart';
import 'package:freeeeee/person.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.snapchat),
        title: Center(
          child: Text('SnapChat '),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Logout(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
                onTap: (){
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Person(name: 'adil')));
                },

              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('images/adiljaz.jpg'),
                ),
                title: Text('adil jaz '),
                subtitle: Text('messages 99+'),
                trailing: Text("11:$index"),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: 50),
    );
  }

  void Logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Lougout...!'),
            content: Text('Are you sure..?'),
            actions: [
              TextButton(onPressed: () async {

                final _sharedpref= await SharedPreferences.getInstance();
                 await _sharedpref.clear();
                

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (conext){
                    return LoginScreen();
                  }), (route) => false);

              }, child: Text('yes')),
              TextButton(onPressed: ()  {
                




                Navigator.pop(context);
              }, child: Text('no')),
            ],
          );
        });
  }
}
