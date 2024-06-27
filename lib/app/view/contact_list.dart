import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/database/sqlite/connection.dart';
import 'package:projeto_flutter/app/my_app.dart';
import 'package:sqflite/sqflite.dart';

class ContactList extends StatelessWidget {
  Future<List<Map<String, dynamic>>> _getList() async {
    Database db = await Connection.get();

    List<Map<String, dynamic>> results = await db.query('contact');
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar dados.'));
        } else if (snapshot.hasData) {
          var lista = snapshot.data as List<Map<String, dynamic>>?;
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
            body: ListView.builder(
              itemCount: lista?.length,
              itemBuilder: (context, i) {
                var contato = lista?[i];
                var avatar = CircleAvatar(
                  backgroundImage: NetworkImage(contato?['url_avatar']),
                );
                return ListTile(
                  leading: avatar,
                  title: Text(contato?['nome'].toString() ?? ''),
                  subtitle: Text(contato?['telefone'].toString() ?? ''),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: null, icon: Icon(Icons.edit)),
                        IconButton(onPressed: null, icon: Icon(Icons.delete))
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Scaffold();
        }
      },
    );
  }
}
