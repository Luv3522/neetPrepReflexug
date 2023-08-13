import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestCountDownTimerModel extends FlutterFlowModel {
  ///  Local state fields for this component.

  int? minutes = 0;

  int? seconds = 0;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    instantTimer2?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
