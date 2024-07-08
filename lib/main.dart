import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/injection.dart';
import 'package:projeto_flutter/app/my_app.dart';
import 'package:projeto_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupInjection();
  runApp(MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.collection('contact').doc().set({
    'name': 'Joaquim',
    'phone': '(11) 9 98529632',
    'email': 'joaqui@email.com',
  });

  //FirebaseFirestore.instance;
}
