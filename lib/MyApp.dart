import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'app/Translations.dart';

class MainApp extends StatefulWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  static SpecificLocalizationDelegate localizationDelegate;
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
