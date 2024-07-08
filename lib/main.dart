import 'package:flutter/material.dart';
import 'package:projeto_flutter/app/injection.dart';
import 'package:projeto_flutter/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  runApp(MyApp());
}
