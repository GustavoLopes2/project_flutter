import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_flutter/app/domain/entities/contact.dart';
import 'package:projeto_flutter/app/my_app.dart';
import 'package:projeto_flutter/app/view/contact_list_back.dart';

class ContactList extends StatelessWidget {
  final _back = ContactListBack();

  CircleAvatar circleAvatar(String url) {
    Uri? uri = Uri.tryParse(url);
    return (uri != null && uri.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : CircleAvatar(child: Icon(Icons.person));
  }

  Widget iconEditButton(void Function()? onPressed) {
    return IconButton(
        icon: Icon(Icons.edit), color: Colors.orange, onPressed: onPressed);
  }

  Widget iconRemoveButton(BuildContext context, void Function()? remove) {
    return IconButton(
        icon: Icon(Icons.delete),
        color: Colors.red,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Excluir'),
                    content: Text('Confirma a exclusão?'),
                    actions: [
                      TextButton(
                          child: Text('Não'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      TextButton(child: Text('Sim'), onPressed: remove),
                    ],
                  ));
        });
  }

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
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  List<Contact> lista =
                      (snapshot.data! as List).cast<Contact>();
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      return ListTile(
                        leading: circleAvatar(contato.urlAvatar ?? ''),
                        title: Text(contato.nome.toString()),
                        subtitle: Text(contato.telefone.toString()),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(() {
                                _back.goToForm(context, contato);
                              }),
                              iconRemoveButton(context, () {
                                _back.remove(contato.id!);
                                Navigator.of(context).pop();
                              })
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
        }));
  }
}
