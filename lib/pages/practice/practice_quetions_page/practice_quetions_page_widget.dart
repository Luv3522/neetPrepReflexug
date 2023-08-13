import '/backend/api_requests/api_calls.dart';
import '/components/bubble_questions/bubble_questions_widget.dart';
import '/components/custom_html_view/custom_html_view_widget.dart';
import '/components/html_question/html_question_widget.dart';
import '/components/report_aproblem/report_aproblem_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_quetions_page_model.dart';
export 'practice_quetions_page_model.dart';

class PracticeQuetionsPageWidget extends StatefulWidget {
  const PracticeQuetionsPageWidget({
    Key? key,
    String? testId,
    int? offset,
    int? numberOfQuestions,
  })  : this.testId = testId ?? 'dfgdfg',
        this.offset = offset ?? 0,
        this.numberOfQuestions = numberOfQuestions ?? 0,
        super(key: key);

  final String testId;
  final int offset;
  final int numberOfQuestions;

  @override
  _PracticeQuetionsPageWidgetState createState() =>
      _PracticeQuetionsPageWidgetState();
}

class _PracticeQuetionsPageWidgetState
    extends State<PracticeQuetionsPageWidget> {
  late PracticeQuetionsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeQuetionsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userAccessJson = await SignupGroup
          .loggedInUserInformationAndCourseAccessCheckingApiCall
          .call(
        authToken: FFAppState().subjectToken,
        courseIdInt: FFAppState().courseIdInt,
        altCourseIds: FFAppState().courseIdInts,
      );
      if (SignupGroup.loggedInUserInformationAndCourseAccessCheckingApiCall
              .courses(
                (_model.userAccessJson?.jsonBody ?? ''),
              )
              .length >
          0) {
        setState(() {
          _model.isLoading = true;
        });
        _model.statusList = await PracticeGroup
            .getStatusOfAllPracticeQuestionsForATestForAGivenUserCall
            .call(
          testIdInt: functions.getIntFromBase64(widget.testId),
          authToken: FFAppState().subjectToken,
        );
        _model.newStatusList = await actions.chkJson(
          PracticeGroup.getStatusOfAllPracticeQuestionsForATestForAGivenUserCall
              .allQuestions(
                (_model.statusList?.jsonBody ?? ''),
              )!
              .toList(),
        );
        setState(() {
          FFAppState().allQuestionsStatus =
              _model.newStatusList!.toList().cast<dynamic>();
        });
        setState(() {
          _model.isLoading = false;
        });
        return;
      } else {
        context.goNamed(
          'PracticeTestPage',
          queryParameters: {
            'testId': serializeParam(
              widget.testId,
              ParamType.String,
            ),
          }.withoutNulls,
        );

        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: SignupGroup.loggedInUserInformationAndCourseAccessCheckingApiCall
          .call(
        authToken: FFAppState().subjectToken,
        courseIdInt: FFAppState().courseIdInt,
        altCourseIds: FFAppState().courseIdInts,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final practiceQuetionsPageLoggedInUserInformationAndCourseAccessCheckingApiResponse =
            snapshot.data!;
        return Title(
            title: 'PracticeQuetionsPage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    title: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'PracticeTestPage',
                                queryParameters: {
                                  'testId': serializeParam(
                                    widget.testId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 29.0,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFAppState()
                                  .topicNameForEachPage
                                  .maybeHandleOverflow(
                                    maxChars: 25,
                                    replacement: '…',
                                  ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineMediumFamily,
                                    color: Colors.black,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .headlineMediumFamily),
                                  ),
                            ),
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              barrierColor: Color(0x00000000),
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      child: BubbleQuestionsWidget(
                                        testId: widget.testId,
                                        numberOfQuestions:
                                            widget.numberOfQuestions,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => setState(
                                () => _model.selectedPageNumber = value));

                            await _model.pageViewController?.animateToPage(
                              _model.selectedPageNumber!,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );

                            setState(() {});
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/category.png',
                              width: 25.0,
                              height: 25.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [],
                    centerTitle: false,
                    elevation: 2.0,
                  ),
                  body: SafeArea(
                    top: true,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (!_model.isLoading)
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                          ),
                                          child: Builder(
                                            builder: (context) {
                                              final quetionList = functions
                                                      .testQueTempList(widget
                                                          .numberOfQuestions)
                                                      ?.toList() ??
                                                  [];
                                              return Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: PageView.builder(
                                                  controller: _model
                                                          .pageViewController ??=
                                                      PageController(
                                                          initialPage: min(
                                                              valueOrDefault<
                                                                  int>(
                                                                widget.offset,
                                                                0,
                                                              ),
                                                              quetionList
                                                                      .length -
                                                                  1)),
                                                  onPageChanged: (_) async {
                                                    setState(() {
                                                      _model.showConfetti =
                                                          false;
                                                      _model.confettiParticleCount =
                                                          random_data
                                                              .randomInteger(
                                                                  20, 40);
                                                      _model.confettiGravity =
                                                          random_data
                                                              .randomDouble(
                                                                  0.75, 0.95);
                                                      _model.showExplanation =
                                                          true;
                                                    });
                                                  },
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemCount: quetionList.length,
                                                  itemBuilder: (context,
                                                      quetionListIndex) {
                                                    final quetionListItem =
                                                        quetionList[
                                                            quetionListIndex];
                                                    return Container(
                                                      width: double.infinity,
                                                      height: double.infinity,
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        77.0),
                                                            child: FutureBuilder<
                                                                ApiCallResponse>(
                                                              future: FFAppState()
                                                                  .testQuestionsCache(
                                                                uniqueQueryKey:
                                                                    '${widget.testId}${functions.getOffsetInt(quetionListIndex).toString()}10${'${DateTime.now().day}-${DateTime.now().month}'}',
                                                                overrideCache:
                                                                    FFAppState()
                                                                            .userIdInt ==
                                                                        null,
                                                                requestFn: () =>
                                                                    PracticeGroup
                                                                        .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
                                                                        .call(
                                                                  testId: widget
                                                                      .testId,
                                                                  offset: functions
                                                                      .getOffsetInt(
                                                                          quetionListIndex),
                                                                  first: 10,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        valueColor:
                                                                            AlwaysStoppedAnimation<Color>(
                                                                          FlutterFlowTheme.of(context)
                                                                              .primary,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                final columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse =
                                                                    snapshot
                                                                        .data!;
                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.95,
                                                                      height:
                                                                          42.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                Text(
                                                                                  (quetionListIndex + 1).toString(),
                                                                                  textAlign: TextAlign.center,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                2.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          minWidth:
                                                                              double.infinity,
                                                                          minHeight:
                                                                              double.infinity,
                                                                          maxWidth:
                                                                              double.infinity,
                                                                          maxHeight:
                                                                              double.infinity,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Colors.white,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 26.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFE5E5E5),
                                                                                          ),
                                                                                          child: Visibility(
                                                                                            visible: false,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testIsNcert(
                                                                                                  columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                )[functions.getOffsetListQueIndex(quetionListIndex)])
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                                                                                                        child: Text(
                                                                                                          'NCERT',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: Colors.white,
                                                                                                                fontSize: 12.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                if ((getJsonField(
                                                                                                          columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                          r'''$.data.test.questions.edges[:].node.questionDetails.edges[:].node.exam''',
                                                                                                        ) !=
                                                                                                        null) &&
                                                                                                    ((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.questionExams(
                                                                                                              columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                            ) as List)
                                                                                                                .map<String>((s) => s.toString())
                                                                                                                .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                            null &&
                                                                                                        (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.questionExams(
                                                                                                              columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                            ) as List)
                                                                                                                .map<String>((s) => s.toString())
                                                                                                                .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                            '') &&
                                                                                                    (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testExamYear(
                                                                                                          columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                        )[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                        null))
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 1.5, 4.0),
                                                                                                            child: Text(
                                                                                                              (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.questionExams(
                                                                                                                columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                              ) as List)
                                                                                                                  .map<String>((s) => s.toString())
                                                                                                                  .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: Colors.white,
                                                                                                                    fontSize: 12.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 12.0, 4.0),
                                                                                                            child: Text(
                                                                                                              (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testExamYear(
                                                                                                                columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                              ) as List)
                                                                                                                  .map<String>((s) => s.toString())
                                                                                                                  .toList()[functions.getOffsetListQueIndex(quetionListIndex)]
                                                                                                                  .toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: Colors.white,
                                                                                                                    fontSize: 12.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: Color(0xFFF0F1F3),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Visibility(
                                                                                                visible: getJsonField(
                                                                                                      FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                      r'''$.bookmarkQuestion''',
                                                                                                    ) !=
                                                                                                    null,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      setState(() {
                                                                                                        FFAppState().allQuestionsStatus = functions.getupdatedBookmarkRemove(FFAppState().allQuestionsStatus.toList(), FFAppState().bookMarkEmptyJson, quetionListIndex).toList().cast<dynamic>();
                                                                                                      });
                                                                                                      _model.apiResultdn0 = await PracticeGroup.createOrDeleteBookmarkForAPracticeQuestionByAUserCall.call(
                                                                                                        questionId: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionIdArr(
                                                                                                          columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                        ) as List)
                                                                                                            .map<String>((s) => s.toString())
                                                                                                            .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                        userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                                                        authToken: FFAppState().subjectToken,
                                                                                                      );

                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.bookmark_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                border: Border.all(
                                                                                                  color: Color(0xFFF0F1F3),
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Visibility(
                                                                                                visible: getJsonField(
                                                                                                      FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                      r'''$.bookmarkQuestion''',
                                                                                                    ) ==
                                                                                                    null,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      setState(() {
                                                                                                        FFAppState().allQuestionsStatus = functions.getupdatedBookmark(FFAppState().allQuestionsStatus.toList(), FFAppState().bookMarkEmptyJson, quetionListIndex).toList().cast<dynamic>();
                                                                                                      });
                                                                                                      _model.apiResultdn1 = await PracticeGroup.createOrDeleteBookmarkForAPracticeQuestionByAUserCall.call(
                                                                                                        questionId: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionIdArr(
                                                                                                          columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                        ) as List)
                                                                                                            .map<String>((s) => s.toString())
                                                                                                            .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                        userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                                                        authToken: FFAppState().subjectToken,
                                                                                                      );

                                                                                                      setState(() {});
                                                                                                    },
                                                                                                    child: Icon(
                                                                                                      Icons.bookmark_border,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFFF0F1F3),
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                barrierColor: Color(0x00000000),
                                                                                                enableDrag: false,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return GestureDetector(
                                                                                                    onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
                                                                                                    child: Padding(
                                                                                                      padding: MediaQuery.viewInsetsOf(context),
                                                                                                      child: Container(
                                                                                                        height: MediaQuery.sizeOf(context).height * 1.0,
                                                                                                        child: ReportAproblemWidget(
                                                                                                          testId: widget.testId,
                                                                                                          questionId: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionIdArr(
                                                                                                            columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                          ) as List)
                                                                                                              .map<String>((s) => s.toString())
                                                                                                              .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.more_vert,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              HtmlQuestionWidget(
                                                                                key: Key('Key92a_${quetionListIndex}_of_${quetionList.length}'),
                                                                                questionHtmlStr: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlQuestionsArr(
                                                                                  columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                ) as List)
                                                                                    .map<String>((s) => s.toString())
                                                                                    .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 24.0, 11.0, 0.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final queNumbers = FFAppState().questionNumbers.toList();
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: List.generate(queNumbers.length, (queNumbersIndex) {
                                                                                        final queNumbersItem = queNumbers[queNumbersIndex];
                                                                                        return Expanded(
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                var _shouldSetState = false;
                                                                                                if (getJsonField(
                                                                                                      FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                      r'''$.userAnswer''',
                                                                                                    ) ==
                                                                                                    null) {
                                                                                                  setState(() {
                                                                                                    FFAppState().allQuestionsStatus = functions.getUpdatedQuestionsStatusList(FFAppState().allQuestionsStatus.toList(), quetionListIndex, queNumbersIndex).toList().cast<dynamic>();
                                                                                                  });
                                                                                                  setState(() {
                                                                                                    _model.showConfetti = (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectOptionIndices(
                                                                                                              columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                            ) as List)
                                                                                                                .map<String>((s) => s.toString())
                                                                                                                .toList()[functions.getOffsetListQueIndex(quetionListIndex)]
                                                                                                                .toString() ==
                                                                                                            queNumbersIndex.toString() &&
                                                                                                        (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectOptionIndices(
                                                                                                              columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                            ) as List)
                                                                                                                .map<String>((s) => s.toString())
                                                                                                                .toList()[functions.getOffsetListQueIndex(quetionListIndex)]
                                                                                                                .toString() !=
                                                                                                            null &&
                                                                                                        queNumbersIndex.toString() != null;
                                                                                                  });
                                                                                                  _model.apiResultixv = await PracticeGroup.createAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall.call(
                                                                                                    questionId: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionIdArr(
                                                                                                      columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                    ) as List)
                                                                                                        .map<String>((s) => s.toString())
                                                                                                        .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                    userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                                                    userAnswer: queNumbersIndex,
                                                                                                    authToken: FFAppState().subjectToken,
                                                                                                  );
                                                                                                  _shouldSetState = true;
                                                                                                  _model.instantTimer = InstantTimer.periodic(
                                                                                                    duration: Duration(milliseconds: 1000),
                                                                                                    callback: (timer) async {
                                                                                                      _model.showConfetti = false;
                                                                                                      _model.instantTimer?.cancel();
                                                                                                      return;
                                                                                                    },
                                                                                                    startImmediately: false,
                                                                                                  );
                                                                                                } else {
                                                                                                  if (_shouldSetState) setState(() {});
                                                                                                  return;
                                                                                                }

                                                                                                if (_shouldSetState) setState(() {});
                                                                                              },
                                                                                              child: Material(
                                                                                                color: Colors.transparent,
                                                                                                elevation: 0.0,
                                                                                                shape: RoundedRectangleBorder(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                child: Container(
                                                                                                  height: 50.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Color(0xFFF5F5F5),
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 15.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(0.0, 10.0),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                    border: Border.all(
                                                                                                      color: valueOrDefault<Color>(
                                                                                                        getJsonField(
                                                                                                                  FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                                  r'''$.userAnswer''',
                                                                                                                ) !=
                                                                                                                null
                                                                                                            ? ((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectOptionIndices(
                                                                                                                      columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                                    ) as List)
                                                                                                                        .map<String>((s) => s.toString())
                                                                                                                        .toList()[functions.getOffsetListQueIndex(quetionListIndex)]
                                                                                                                        .toString() ==
                                                                                                                    queNumbersIndex.toString()
                                                                                                                ? Color(0xFF5EB85E)
                                                                                                                : ((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectOptionIndices(
                                                                                                                              columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                                            )[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                                            queNumbersIndex) &&
                                                                                                                        (getJsonField(
                                                                                                                              FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                                              r'''$.userAnswer.userAnswer''',
                                                                                                                            ) !=
                                                                                                                            queNumbersIndex)
                                                                                                                    ? Color(0xFF5E5E5E)
                                                                                                                    : (getJsonField(
                                                                                                                              FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                                              r'''$.userAnswer.userAnswer''',
                                                                                                                            ) ==
                                                                                                                            queNumbersIndex
                                                                                                                        ? Color(0xFFFF2424)
                                                                                                                        : Color(0xFF5EB85E))))
                                                                                                            : FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        FlutterFlowTheme.of(context).lineColor,
                                                                                                      ),
                                                                                                      width: 2.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        queNumbersItem.toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                      if ((getJsonField(
                                                                                                                FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                                                r'''$.userAnswer''',
                                                                                                              ) !=
                                                                                                              null) &&
                                                                                                          ((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectPercentages(
                                                                                                                    columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                                  ) as List)
                                                                                                                      .map<String>((s) => s.toString())
                                                                                                                      .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                                  null &&
                                                                                                              (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestionCorrectPercentages(
                                                                                                                    columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                                  ) as List)
                                                                                                                      .map<String>((s) => s.toString())
                                                                                                                      .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                                                  '') &&
                                                                                                          (getJsonField(
                                                                                                                practiceQuetionsPageLoggedInUserInformationAndCourseAccessCheckingApiResponse.jsonBody,
                                                                                                                r'''$.data.me.userCourses.edges''',
                                                                                                              ) !=
                                                                                                              null))
                                                                                                        Text(
                                                                                                          '${functions.getOptionCorrectPercentage(PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testQuestions(
                                                                                                                columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                              )[functions.getOffsetListQueIndex(quetionListIndex)], queNumbersIndex)}',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: Color(0xFFB9B9B9),
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              if ((getJsonField(
                                                                                        FFAppState().allQuestionsStatus[quetionListIndex],
                                                                                        r'''$.userAnswer''',
                                                                                      ) !=
                                                                                      null) &&
                                                                                  (((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlExplanationsArr(
                                                                                                columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                              null &&
                                                                                          (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlExplanationsArr(
                                                                                                columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                              ) as List)
                                                                                                  .map<String>((s) => s.toString())
                                                                                                  .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                              '') &&
                                                                                      ((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlExplanationsArr(
                                                                                            columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                          ) as List)
                                                                                              .map<String>((s) => s.toString())
                                                                                              .toList()[functions.getOffsetListQueIndex(quetionListIndex)] !=
                                                                                          'null')))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: double.infinity,
                                                                                    decoration: BoxDecoration(
                                                                                      color: Colors.white,
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              if (false)
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                  child: InkWell(
                                                                                                    splashColor: Colors.transparent,
                                                                                                    focusColor: Colors.transparent,
                                                                                                    hoverColor: Colors.transparent,
                                                                                                    highlightColor: Colors.transparent,
                                                                                                    onTap: () async {
                                                                                                      setState(() {
                                                                                                        _model.showMeNcert = !_model.showMeNcert!;
                                                                                                      });
                                                                                                    },
                                                                                                    child: Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                        border: Border.all(
                                                                                                          color: Color(0xFF252525),
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                        child: Text(
                                                                                                          'Show Me in NCERT',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                fontSize: 12.0,
                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  setState(() {
                                                                                                    _model.showExplanation = !_model.showExplanation;
                                                                                                  });
                                                                                                },
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                    border: Border.all(
                                                                                                      color: Color(0xFF252525),
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                    child: Text(
                                                                                                      _model.showExplanation ? 'Show Explanation' : 'Hide Explanation',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            fontSize: 12.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (!_model.showExplanation)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                                                                                            child: SingleChildScrollView(
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if ((String var1) {
                                                                                                    return !RegExp(r'<(audio|iframe|table)\b[^>]*>').hasMatch(var1) && !RegExp(r'(<math.*>.*</math>|math-tex)').hasMatch(var1);
                                                                                                  }((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlFullExplanationsArr(
                                                                                                    columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                  ) as List)
                                                                                                      .map<String>((s) => s.toString())
                                                                                                      .toList()[functions.getOffsetListQueIndex(quetionListIndex)]))
                                                                                                    wrapWithModel(
                                                                                                      model: _model.customHtmlViewModels.getModel(
                                                                                                        'QuestionListId:${getJsonField(
                                                                                                          quetionListItem,
                                                                                                          r'''$.id''',
                                                                                                        ).toString()}',
                                                                                                        quetionListIndex,
                                                                                                      ),
                                                                                                      updateCallback: () => setState(() {}),
                                                                                                      child: CustomHtmlViewWidget(
                                                                                                        key: Key(
                                                                                                          'Keyb4a_${'QuestionListId:${getJsonField(
                                                                                                            quetionListItem,
                                                                                                            r'''$.id''',
                                                                                                          ).toString()}'}',
                                                                                                        ),
                                                                                                        questionStr: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlExplanationsArr(
                                                                                                          columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                        ) as List)
                                                                                                            .map<String>((s) => s.toString())
                                                                                                            .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                      ),
                                                                                                    ),
                                                                                                  if ((String var1) {
                                                                                                    return RegExp(r'<(audio|iframe|table)\b[^>]*>').hasMatch(var1) || RegExp(r'(<math.*>.*</math>|math-tex)').hasMatch(var1);
                                                                                                  }((PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlFullExplanationsArr(
                                                                                                    columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                  ) as List)
                                                                                                      .map<String>((s) => s.toString())
                                                                                                      .toList()[functions.getOffsetListQueIndex(quetionListIndex)]))
                                                                                                    custom_widgets.CustomWebView(
                                                                                                      width: MediaQuery.sizeOf(context).width * 0.9,
                                                                                                      height: 250.0,
                                                                                                      src: (PracticeGroup.getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall.testHtmlFullExplanationsArr(
                                                                                                        columnGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse.jsonBody,
                                                                                                      ) as List)
                                                                                                          .map<String>((s) => s.toString())
                                                                                                          .toList()[functions.getOffsetListQueIndex(quetionListIndex)],
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          if (false)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 1.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            60.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            120.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_back_ios,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent1,
                                                                          size:
                                                                              60.0,
                                                                        ),
                                                                        showLoadingIndicator:
                                                                            true,
                                                                        onPressed: quetionListIndex ==
                                                                                0
                                                                            ? null
                                                                            : () async {
                                                                                await _model.pageViewController?.previousPage(
                                                                                  duration: Duration(milliseconds: 300),
                                                                                  curve: Curves.ease,
                                                                                );
                                                                              },
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          20.0,
                                                                          10.0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            60.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            120.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).primaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .arrow_forward_ios,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              60.0,
                                                                        ),
                                                                        showLoadingIndicator:
                                                                            true,
                                                                        onPressed: quetionListIndex ==
                                                                                (widget.numberOfQuestions - 1)
                                                                            ? null
                                                                            : () async {
                                                                                await _model.pageViewController?.animateToPage(
                                                                                  quetionListIndex,
                                                                                  duration: Duration(milliseconds: 500),
                                                                                  curve: Curves.ease,
                                                                                );
                                                                              },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 1.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 80.0,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await _model
                                                                            .pageViewController
                                                                            ?.previousPage(
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (quetionListIndex ==
                                                                              0)
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/arrow-square-left.png',
                                                                                width: 44.0,
                                                                                height: 44.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (quetionListIndex !=
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/left-filled.png',
                                                                                  width: 42.0,
                                                                                  height: 42.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await _model
                                                                            .pageViewController
                                                                            ?.nextPage(
                                                                          duration:
                                                                              Duration(milliseconds: 300),
                                                                          curve:
                                                                              Curves.ease,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (quetionListIndex ==
                                                                              (widget.numberOfQuestions - 1))
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/arrow-square-right.png',
                                                                                width: 44.0,
                                                                                height: 44.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          if (quetionListIndex !=
                                                                              (widget.numberOfQuestions - 1))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: Image.asset(
                                                                                  'assets/images/right-filled.png',
                                                                                  width: 42.0,
                                                                                  height: 42.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (_model.isLoading)
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 200.0,
                                  child: custom_widgets.CustomLoader(
                                    width: double.infinity,
                                    height: 200.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        if (_model.showConfetti)
                          Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: custom_widgets.ConfettiOverlay(
                              width: double.infinity,
                              height: double.infinity,
                              show: _model.showConfetti,
                              particleCount: _model.confettiParticleCount,
                              gravity: _model.confettiGravity,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
