import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_test_details/bubble_track_for_test_details_widget.dart';
import '/components/custom_html_view/custom_html_view_widget.dart';
import '/components/html_question/html_question_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewAnswerPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  int chkAnswer = 0;

  List<int> questionsStatus = [];
  void addToQuestionsStatus(int item) => questionsStatus.add(item);
  void removeFromQuestionsStatus(int item) => questionsStatus.remove(item);
  void removeAtIndexFromQuestionsStatus(int index) =>
      questionsStatus.removeAt(index);
  void updateQuestionsStatusAtIndex(int index, Function(int) updateFn) =>
      questionsStatus[index] = updateFn(questionsStatus[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Bottom Sheet - BubbleTrackForTestDetails] action in Image widget.
  int? selectedPageNumberCopy;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for CustomHtmlView dynamic component.
  late FlutterFlowDynamicModels<CustomHtmlViewModel> customHtmlViewModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    customHtmlViewModels =
        FlutterFlowDynamicModels(() => CustomHtmlViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    customHtmlViewModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
