import 'package:flutter/material.dart';
import 'package:sneakbid/app/app.dart';
import 'package:sneakbid/app/di/di.dart';
import 'package:sneakbid/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();

  // await HiveService().clearStudentBox();

  await initDependencies();

  runApp(
    App(),
  );
}
