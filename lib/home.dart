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
        leading: const Icon(Icons.snapchat),
        title: const Center(
          child: Text('SnapChat '),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Logout(context);
            },
            icon: const Icon(Icons.logout),
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
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('images/adiljaz.jpg'),
                ),
                title: const Text('adil jaz '),
                subtitle: const Text('messages 99+'),
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
            title: const Text('Lougout...!'),
            content: const Text('Are you sure..?'),
            actions: [
              TextButton(onPressed: () async {

                final _sharedpref= await SharedPreferences.getInstance();
                 await _sharedpref.clear();
                

                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (conext){
                    return const LoginScreen();
                  }), (route) => false);

              }, child: const Text('yes')),
              TextButton(onPressed: ()  {
                




                Navigator.pop(context);
              }, child: const Text('no')),
            ],
          );
        });
  }
}
