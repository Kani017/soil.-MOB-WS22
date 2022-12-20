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
        backgroundColor: Color(0xFF1F312B),
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
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE7E4DC),
        ),
        child: StreamBuilder(
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
      ),
    );
  }
  Widget buildUser(User user) => ListTile(
    leading: CircleAvatar(
      backgroundColor: Color(0xFFAFCEBF),
      radius: 20.0,
      child: Icon(Icons.local_florist), ),
    title: Text(user.name),
    subtitle: Text('is thirsty!'),
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


