import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/domain/entities/contact.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact? contact;

  ContactDetailsBack(this.context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Contact) {
      contact = args;
    } else {
      contact = null;
    }
  }

  void goToBack() {
    Navigator.of(context).pop();
  }
}
