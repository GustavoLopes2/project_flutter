import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/my_app.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.CONTACT_FORM);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView(),
    );
  }
}
