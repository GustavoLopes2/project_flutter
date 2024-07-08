import 'package:get_it/get_it.dart';
import 'package:projeto_flutter/app/domain/entities/contact.dart';
import 'package:projeto_flutter/app/domain/exception/domain_layer_execption.dart';
import 'package:projeto_flutter/app/domain/interfaces/contact_dao.dart';

class ContactService {
  final _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validateName(contact.nome);
    validateEmail(contact.email);
    validatePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validateName(String? name) {
    var min = 3;
    var max = 50;

    if (name == null) {
      throw new DomainLayerExecption('O nome é obrigatório.');
    } else if (name.length < min) {
      throw new DomainLayerExecption(
          'O nome deve possuir pelo menos $min caracteres.');
    } else if (name.length > max) {
      throw new DomainLayerExecption(
          'O nome deve possuir no máximo $max caracteres.');
    }
  }

  validateEmail(String? email) {
    if (email == null) {
      throw new DomainLayerExecption('O email é obrigatório.');
    } else if (!email.contains('@')) {
      throw new DomainLayerExecption('O email deve conter o @');
    }
  }

  validatePhone(String? phone) {
    var format = RegExp(r'^\([1-9]{2}\) [9] [6-9]{1}[0-9]{3}\-[0-9]{4}$');
    if (phone == null) {
      throw new DomainLayerExecption('O telefone é obrigatório.');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerExecption('Formato inválido.');
    }
  }
}
