import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/domain/entities/contact.dart';
import 'package:projeto_flutter/app/view/contact_details_back.dart';

class ContactDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta!'),
      content: Text('Não foi possível encontrar um APP compatível'),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact? contact = _back.contact;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var width = constraints.biggest.width;

      return Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do Contato'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            if (contact != null &&
                contact.urlAvatar != null &&
                Uri.tryParse(contact.urlAvatar!)?.isAbsolute == true)
              CircleAvatar(
                backgroundImage: NetworkImage(contact.urlAvatar!),
                radius: 50,
              )
            else
              CircleAvatar(
                child: Icon(Icons.person, size: 50),
                radius: 50,
              ),
            SizedBox(height: 16),
            Center(
              child: Text(
                contact?.nome ?? 'Nome desconhecido',
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                title: Text('Telefone:'),
                subtitle: Text(contact?.telefone ?? 'Telefone não disponível'),
                trailing: Container(
                  width: width / 4,
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.message),
                        onPressed: () {
                          _back.launchSms(showModalError);
                        },
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.phone),
                        onPressed: () {
                          _back.launchPhone(showModalError);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Card(
              child: ListTile(
                title: Text('Email:'),
                onTap: () {
                  _back.launchEmail(showModalError);
                },
                subtitle: Text(contact?.email ?? 'Email não disponível'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back),
          onPressed: _back.goToBack,
        ),
      );
    });
  }
}
