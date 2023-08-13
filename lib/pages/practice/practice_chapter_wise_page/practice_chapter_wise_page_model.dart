import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/need_help_pop_up/need_help_pop_up_widget.dart';
import '/components/select_book/select_book_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PracticeChapterWisePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Logged in user information and course access checking api )] action in PracticeChapterWisePage widget.
  ApiCallResponse? memberShip;
  // Stores action output result for [Bottom Sheet - selectBook] action in Row widget.
  int? selectedCourseIndex;
  // Stores action output result for [Backend Call - API (Get Courses for switching)] action in Row widget.
  ApiCallResponse? selectCourses;
  // Stores action output result for [Custom Action - getTabs] action in Container widget.
  List<int>? numTabs;
  // Model for navBar component.
  late NavBarModel navBarModel;

  /// Query cache managers for this widget.

  final _chapterQuestionSetsQueryManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> chapterQuestionSetsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _chapterQuestionSetsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearChapterQuestionSetsQueryCache() =>
      _chapterQuestionSetsQueryManager.clear();
  void clearChapterQuestionSetsQueryCacheKey(String? uniqueKey) =>
      _chapterQuestionSetsQueryManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarModel.dispose();

    /// Dispose query cache managers for this widget.

    clearChapterQuestionSetsQueryCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
