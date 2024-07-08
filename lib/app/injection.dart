import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projeto_flutter/app/database/firestore/contact_dao_firestone.dart';
import 'package:projeto_flutter/app/domain/interfaces/contact_dao.dart';
import 'package:projeto_flutter/app/domain/services/contact_service.dart';
import 'package:projeto_flutter/firebase_options.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getIt.registerSingleton<ContactDAO>(ContactDAOFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}
