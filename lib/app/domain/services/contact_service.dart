import 'package:get_it/get_it.dart';
import 'package:projeto_flutter/app/domain/interfaces/contact_dao.dart';

class ContactService {
  var dao = GetIt.I.get<ContactDAO>();
}
