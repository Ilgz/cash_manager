import 'dart:async';

import 'package:cash_manager/injection.dart';
import 'package:cash_manager/presentation/core/widgets/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  runApp(const AppWidget());
}




