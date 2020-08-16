import 'package:flutter/material.dart';
import 'package:flutter_agile_app/widgets/header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Scaffold build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: Text("Hello"),
    );
  }
}
