import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/payment/bottom_popup/bottom_popup_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool is6MonthChecked = true;

  bool is1YearChecked = false;

  String amount = '';

  String title = '';

  String fee = '';

  String cc = '216413';

  bool? isloading = true;

  bool? isOptionSel;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get course price and course offers to select from to start payment)] action in OrderPage widget.
  ApiCallResponse? courseInfo;
  // Stores action output result for [Bottom Sheet - BottomPopup] action in Container widget.
  dynamic? bottomPop;
  // Stores action output result for [Backend Call - API (Create payment for a user for a course and course offer and get checksum)] action in Container widget.
  ApiCallResponse? paymentDetails;
  // Stores action output result for [Custom Action - paytmIntegration] action in Container widget.
  String? paymentStatus;
  // Stores action output result for [Backend Call - API (Payment Success Backend Processing call to enable course)] action in Container widget.
  ApiCallResponse? paymentResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
