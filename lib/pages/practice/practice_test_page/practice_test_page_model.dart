import '/backend/api_requests/api_calls.dart';
import '/components/reset_pop_up/reset_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PracticeTestPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getOffset] action in Container widget.
  int? offSetN;
  // Stores action output result for [Custom Action - getOffset] action in Container widget.
  int? offSetN1Copy;
  // Stores action output result for [Custom Action - getOffset] action in Container widget.
  int? offSetNCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
