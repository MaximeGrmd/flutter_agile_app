import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_agile_app/widgets/header.dart';
import 'package:flutter_agile_app/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    updateUser();
    deleteUser();
    // getUserById();
    super.initState();
  }

  createUser() {
    usersRef
        .document("asdfasdf")
        .setData({"username": "Jeff", "isAdmin": false, "postsCount": 0});
  }

  updateUser() async {
    final DocumentSnapshot doc =
        await usersRef.document("LMRWmAPE6oXoUQHZM43U").get();

    if (doc.exists) {
      doc.reference
          .updateData({"username": "John", "isAdmin": false, "postsCount": 0});
    }
  }

  deleteUser() async {
    final DocumentSnapshot doc =
        await usersRef.document("YgV8rZZ7NhDhbP3aGVit").get();

    if (doc.exists) {
      doc.reference.delete();
    }
  }

  // getUserById() async {
  //   final String id = "MXu9OVGJtVpEXY2oWIX9";
  //   final DocumentSnapshot doc = await usersRef.document(id).get();
  //   print(doc.data);
  //   print(doc.documentID);
  //   print(doc.exists);
  // }

  @override
  Scaffold build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: StreamBuilder<QuerySnapshot>(
        stream: usersRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return circularProgress();
          }
          final List<Text> children = snapshot.data.documents
              .map((doc) => Text(doc['username']))
              .toList();
          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
