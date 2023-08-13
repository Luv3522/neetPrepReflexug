// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> getOffset(
  List<dynamic> listOfNumberOfQuetions,
  int indexNumber,
) async {
  // Add your function code here!
  int offSet = 0;
  Type ty = listOfNumberOfQuetions[0].runtimeType;
  print(listOfNumberOfQuetions[0] + listOfNumberOfQuetions[1]);
  print(ty);
  dynamic sum = 0;
  for (int i = 0; i < indexNumber; i++) {
    sum = sum + listOfNumberOfQuetions[i];
  }
  offSet = sum;
  print(offSet);
  print(sum);
  return offSet;
}
