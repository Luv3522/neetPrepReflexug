import '/components/custom_html_view/custom_html_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HtmlQuestionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Model for CustomHtmlView component.
  late CustomHtmlViewModel customHtmlViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customHtmlViewModel = createModel(context, () => CustomHtmlViewModel());
  }

  void dispose() {
    customHtmlViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
