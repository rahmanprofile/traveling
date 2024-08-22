import 'package:flutter/material.dart';


class SavePage extends StatefulWidget {
  const SavePage({Key? key}) : super(key: key);

  @override
  State<SavePage> createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: Center(
        child: Text('Save Page'),
      ),
    );
  }
}