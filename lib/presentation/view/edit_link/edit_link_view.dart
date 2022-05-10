import 'package:flutter/material.dart';

class EditLinkView extends StatelessWidget {
  final int id;

  const EditLinkView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('EditLinkView for id: $id'),
      ),
    );
  }
}
