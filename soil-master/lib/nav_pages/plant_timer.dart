import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mainprojectapp_ntt/services/notification_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Plant extends StatelessWidget {
  var controller = TextEditingController();

  Stream<List<User>> readUsers() => FirebaseFirestore.instance
      .collection('notes')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());


  Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('notes').doc();

    final user = User(
      id: docUser.id,
      name: name,
    );
    final json = user.toJson();

    await docUser.set(json);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: TextField( controller: controller,),
        actions: [
          IconButton(
              onPressed: (){
                final name = controller.text;

                createUser(name: name);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError){
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData){
              final users = snapshot.data!;
              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
  Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(child: Text('P'),),
    title: Text(user.name),
    subtitle: Text('soil plants'),
  );
}


class User {
  String id;
  final String name;

  User({
    this.id = '',
    required this.name,
  });

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
  );
}
/* class UserTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Center(
      child: ElevatedButton(
       onPressed: () {
         flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
             AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
         showNotification();
       }, child: const Text('Show Notification'),
      ),
    );
  }
 }
 */

