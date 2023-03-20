import 'package:flutter/material.dart';
import 'package:akalne/pages/initial.dart';

const APP_NAME = "Akalne";

void main() {
  runApp(MaterialApp(
    title: APP_NAME,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
    ),
    home: const InitialPage(title: APP_NAME),
  ));
}
