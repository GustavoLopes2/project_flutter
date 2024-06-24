import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/my_app.dart';

class ContactList extends StatelessWidget {
  final lista = [
    {
      'nome': 'Pietro',
      'telefone': '(11) 9 9874-5656',
      'avatar':
          'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_1280.png'
    },
    {
      'nome': 'Maite',
      'telefone': '(11) 9 9214-8578',
      'avatar':
          'https://cdn.pixabay.com/photo/2021/11/12/03/04/woman-6787784_1280.png'
    },
    {
      'nome': 'Hortencia',
      'telefone': '(11) 9 9421-3356',
      'avatar':
          'https://cdn.pixabay.com/photo/2017/01/31/13/46/girl-2024190_1280.png'
    },
  ];

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
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, i) {
          dynamic contato = lista[i];
          var avatar = CircleAvatar(
            backgroundImage: NetworkImage(contato['avatar']),
          );
          return ListTile(
            leading: avatar,
            title: Text(contato['nome'].toString()),
            subtitle: Text(contato['telefone'].toString()),
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
  }
}
