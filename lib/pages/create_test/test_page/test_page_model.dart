import '/backend/api_requests/api_calls.dart';
import '/components/bubble_track_for_test/bubble_track_for_test_widget.dart';
import '/components/html_question/html_question_widget.dart';
import '/components/test_count_down_timer/test_count_down_timer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/create_test/confirm_pop/confirm_pop_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = false;

  int secondsPerQuestion = 0;

  int? minutes;

  int? seconds;

  int questionLoadedTime = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get completed test attempt data with test result for a test attempt)] action in TestPage widget.
  ApiCallResponse? questionsList;
  InstantTimer? instantTimer1;
  // Stores action output result for [Backend Call - API (update test attempt for a test by a user based on questions attempted and time spend etc )] action in Icon widget.
  ApiCallResponse? submitRes1;
  // Model for TestCountDownTimer component.
  late TestCountDownTimerModel testCountDownTimerModel;
  // Stores action output result for [Bottom Sheet - ConfirmPop] action in Text widget.
  bool? selRes;
  // Stores action output result for [Backend Call - API (update test attempt for a test by a user based on questions attempted and time spend etc )] action in Text widget.
  ApiCallResponse? submitRes;
  // Stores action output result for [Bottom Sheet - BubbleTrackForTest] action in Image widget.
  int? selectedPageNumber;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (update test attempt for a test by a user based on questions attempted and time spend etc )] action in Container widget.
  ApiCallResponse? updateTestAttempt;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    testCountDownTimerModel =
        createModel(context, () => TestCountDownTimerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer1?.cancel();
    testCountDownTimerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
