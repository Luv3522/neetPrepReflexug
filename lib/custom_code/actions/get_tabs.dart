// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<int>> getTabs(int numberOfQuetions) async {
  // Add your function code here!
  List<int> tabs = [];
  print(numberOfQuetions);
  int num = 1;
  for (int i = 0; i < numberOfQuetions; i++) {
    tabs.add(num++);
  }
  print(tabs);
  return tabs;
}
