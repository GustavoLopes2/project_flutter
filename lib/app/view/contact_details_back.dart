import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/domain/entities/contact.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchApp(
      String url, Function(BuildContext) showModalError) async {
    try {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        showModalError(context);
      }
    } catch (e) {
      showModalError(context);
    }
  }

  void launchPhone(Function(BuildContext) showModalError) {
    _launchApp('tel:${contact?.telefone}', showModalError);
  }

  void launchSms(Function(BuildContext) showModalError) {
    _launchApp('sms:${contact?.telefone}', showModalError);
  }

  void launchEmail(Function(BuildContext) showModalError) {
    _launchApp('mailto:${contact?.email}', showModalError);
  }
}
