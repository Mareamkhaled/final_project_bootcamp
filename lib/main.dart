import 'package:final_project_bootcamp/core/Routing/routing.dart';
import 'package:final_project_bootcamp/core/cache/cache_helper.dart';
import 'package:final_project_bootcamp/my_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    MyApp(routing: Routing()),
  );
}
