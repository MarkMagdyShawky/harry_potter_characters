import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'core/utils/app_injector.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}
