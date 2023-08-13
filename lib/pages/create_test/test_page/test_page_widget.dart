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
import 'test_page_model.dart';
export 'test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({
    Key? key,
    String? testId,
    this.testAttemptId,
  })  : this.testId = testId ?? 'dfgdfg',
        super(key: key);

  final String testId;
  final String? testAttemptId;

  @override
  _TestPageWidgetState createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isLoading = true;
      });
      _model.questionsList = await TestGroup
          .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
          .call(
        testAttemptId: widget.testAttemptId,
        authToken: FFAppState().subjectToken,
      );
      setState(() {
        FFAppState().questionList = TestGroup
            .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
            .questionsList(
              (_model.questionsList?.jsonBody ?? ''),
            )!
            .toList()
            .cast<dynamic>();
        FFAppState().testQueAnsList = functions
            .getTestQuestionsAnswerList(
                TestGroup
                    .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                    .numQuestions(
                  (_model.questionsList?.jsonBody ?? ''),
                ),
                TestGroup
                    .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                    .userAnswers(
                  (_model.questionsList?.jsonBody ?? ''),
                ),
                (TestGroup
                        .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                        .questionIdsList(
                  (_model.questionsList?.jsonBody ?? ''),
                ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList())
            .toList()
            .cast<int>();
        FFAppState().secondsList = functions
            .getSecondsInEachPage(
                TestGroup
                    .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                    .numQuestions(
                  (_model.questionsList?.jsonBody ?? ''),
                ),
                TestGroup
                    .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                    .userQuestionWiseDurationInSec(
                  (_model.questionsList?.jsonBody ?? ''),
                ),
                (TestGroup
                        .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                        .questionIdsList(
                  (_model.questionsList?.jsonBody ?? ''),
                ) as List)
                    .map<String>((s) => s.toString())
                    .toList()!
                    .toList())
            .toList()
            .cast<int>();
      });
      setState(() {
        _model.isLoading = false;
        _model.minutes = valueOrDefault<int>(
              TestGroup
                  .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                  .durationInMin(
                (_model.questionsList?.jsonBody ?? ''),
              ),
              180,
            ) -
            1;
        _model.seconds = 59;
      });
      _model.instantTimer1 = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.secondsPerQuestion = (int var1, int var2) {
            return var1 >= var2 ? (var1 - var2) : 0;
          }(_model.instantTimer1.tick, _model.questionLoadedTime);
          if (_model.seconds == 0) {
            _model.minutes = _model.minutes! + -1;
            _model.seconds = 59;
            return;
          } else {
            _model.seconds = _model.seconds! + -1;
            return;
          }
        },
        startImmediately: true,
      );
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

    return Title(
        title: 'TestPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: Color(0xFFEDEDED),
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
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
                              var _shouldSetState = false;
                              var confirmDialogResponse =
                                  await showDialog<bool>(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                                'Are you submiting the test ?'),
                                            content: Text(
                                                'do you want to submit the test ?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Confirm'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                setState(() {
                                  FFAppState().questionsListInInt = functions
                                      .getQuestionIdListInInteger(
                                          FFAppState().questionList.toList(),
                                          FFAppState().testQueAnsList.toList())
                                      .toList()
                                      .cast<int>();
                                  FFAppState().answerListInInt = functions
                                      .getAnswerListInInteger(
                                          FFAppState().testQueAnsList.toList())
                                      .toList()
                                      .cast<int>();
                                  FFAppState().secondsListInInt = functions
                                      .getSecondsListInInt(
                                          FFAppState().secondsList.toList())
                                      .toList()
                                      .cast<int>();
                                });
                                _model.submitRes1 = await TestGroup
                                    .updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall
                                    .call(
                                  testId: widget.testId,
                                  userId: functions.getBase64OfUserId(
                                      FFAppState().userIdInt),
                                  authToken: FFAppState().subjectToken,
                                  testAttemptId: widget.testAttemptId,
                                  userAnswersJsonStr: functions
                                      .convertQuestionAndAnsIntoMapJson(
                                          FFAppState()
                                              .questionsListInInt
                                              .toList(),
                                          FFAppState()
                                              .answerListInInt
                                              .toList()),
                                  userQuestionWiseDurationInSecJsonStr:
                                      functions
                                          .convertQuestionAndAnsIntoMapJson(
                                              FFAppState()
                                                  .questionsListInInt
                                                  .toList(),
                                              FFAppState()
                                                  .secondsListInInt
                                                  .toList()),
                                  visitedQuestionsJsonStr: '{}',
                                  markedQuestionsJsonStr: '{}',
                                  elapsedDurationInSec: 200,
                                  currentQuestionOffset: 0,
                                  completed: true,
                                );
                                _shouldSetState = true;
                                setState(() {
                                  FFAppState().testAttemptId =
                                      widget.testAttemptId!;
                                });

                                context.pushNamed(
                                  'CreateTestResultPage',
                                  queryParameters: {
                                    'testAttemptId': serializeParam(
                                      getJsonField(
                                        (_model.questionsList?.jsonBody ?? ''),
                                        r'''$.data.testAttempt.id''',
                                      ).toString(),
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );

                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                context.pop();
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 29.0,
                            ),
                          ),
                        ),
                        Text(
                          'Test',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if ((_model.minutes != null) &&
                            (_model.seconds != null))
                          wrapWithModel(
                            model: _model.testCountDownTimerModel,
                            updateCallback: () => setState(() {}),
                            child: TestCountDownTimerWidget(
                              minutes: _model.minutes != null
                                  ? _model.minutes
                                  : valueOrDefault<int>(
                                      TestGroup
                                          .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                          .durationInMin(
                                        (_model.questionsList?.jsonBody ?? ''),
                                      ),
                                      180,
                                    ),
                              seconds:
                                  _model.seconds != null ? _model.seconds : (0),
                            ),
                          ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () => FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: ConfirmPopWidget(
                                      response: false,
                                    ),
                                  ),
                                );
                              },
                            ).then((value) =>
                                setState(() => _model.selRes = value));

                            _shouldSetState = true;
                            if (_model.selRes == true) {
                              setState(() {
                                FFAppState().questionsListInInt = functions
                                    .getQuestionIdListInInteger(
                                        FFAppState().questionList.toList(),
                                        FFAppState().testQueAnsList.toList())
                                    .toList()
                                    .cast<int>();
                                FFAppState().answerListInInt = functions
                                    .getAnswerListInInteger(
                                        FFAppState().testQueAnsList.toList())
                                    .toList()
                                    .cast<int>();
                                FFAppState().secondsListInInt = functions
                                    .getSecondsListInInt(
                                        FFAppState().secondsList.toList())
                                    .toList()
                                    .cast<int>();
                              });
                              setState(() {
                                _model.isLoading = true;
                              });
                              _model.submitRes = await TestGroup
                                  .updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall
                                  .call(
                                testId: widget.testId,
                                userId: functions
                                    .getBase64OfUserId(FFAppState().userIdInt),
                                authToken: FFAppState().subjectToken,
                                testAttemptId: widget.testAttemptId,
                                userAnswersJsonStr:
                                    functions.convertQuestionAndAnsIntoMapJson(
                                        FFAppState()
                                            .questionsListInInt
                                            .toList(),
                                        FFAppState().answerListInInt.toList()),
                                userQuestionWiseDurationInSecJsonStr:
                                    functions.convertQuestionAndAnsIntoMapJson(
                                        FFAppState()
                                            .questionsListInInt
                                            .toList(),
                                        FFAppState().secondsListInInt.toList()),
                                visitedQuestionsJsonStr: '{}',
                                markedQuestionsJsonStr: '{}',
                                elapsedDurationInSec: 200,
                                currentQuestionOffset: 0,
                                completed: true,
                              );
                              _shouldSetState = true;
                              setState(() {
                                _model.isLoading = false;
                              });

                              context.goNamed(
                                'CreateTestResultPage',
                                queryParameters: {
                                  'testAttemptId': serializeParam(
                                    widget.testAttemptId,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );

                              if (_shouldSetState) setState(() {});
                              return;
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          child: Text(
                            'Submit',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
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
                                        child: BubbleTrackForTestWidget(
                                          testId: widget.testId,
                                          numberOfQuestions: TestGroup
                                              .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                              .numQuestions(
                                            (_model.questionsList?.jsonBody ??
                                                ''),
                                          ),
                                          testAttemptId: widget.testAttemptId,
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
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
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
                                      final quetionList =
                                          FFAppState().questionList.toList();
                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: PageView.builder(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: min(
                                                      valueOrDefault<int>(
                                                        FFAppState().pageNumber,
                                                        0,
                                                      ),
                                                      quetionList.length - 1)),
                                          onPageChanged: (_) async {
                                            _model.questionLoadedTime =
                                                _model.instantTimer1.tick;
                                          },
                                          scrollDirection: Axis.horizontal,
                                          itemCount: quetionList.length,
                                          itemBuilder:
                                              (context, quetionListIndex) {
                                            final quetionListItem =
                                                quetionList[quetionListIndex];
                                            return Stack(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                        ),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            54.0,
                                                                        height:
                                                                            53.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          (quetionListIndex + 1)
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            2.0,
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              54.0,
                                                                          height:
                                                                              2.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            33.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        HtmlQuestionWidget(
                                                                      key: Key(
                                                                          'Keyba6_${quetionListIndex}_of_${quetionList.length}'),
                                                                      questionHtmlStr:
                                                                          getJsonField(
                                                                        quetionListItem,
                                                                        r'''$.question''',
                                                                      ).toString(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        24.0,
                                                                        10.0,
                                                                        100.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final queNumbers =
                                                                        FFAppState()
                                                                            .questionNumbers
                                                                            .toList();
                                                                    return Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                      children: List.generate(
                                                                          queNumbers
                                                                              .length,
                                                                          (queNumbersIndex) {
                                                                        final queNumbersItem =
                                                                            queNumbers[queNumbersIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              5.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              setState(() {
                                                                                FFAppState().testQueAnsList = functions.insertValueInListInSpecificPosition(FFAppState().testQueAnsList.toList(), quetionListIndex, queNumbersIndex).toList().cast<int>();
                                                                                FFAppState().secondsList = functions.insertSeconsInList(FFAppState().secondsList.toList(), quetionListIndex, _model.secondsPerQuestion).toList().cast<int>();
                                                                              });
                                                                              setState(() {
                                                                                _model.secondsPerQuestion = 0;
                                                                              });
                                                                              setState(() {
                                                                                FFAppState().questionsListInInt = functions.getQuestionIdListInInteger(FFAppState().questionList.toList(), FFAppState().testQueAnsList.toList()).toList().cast<int>();
                                                                                FFAppState().answerListInInt = functions.getAnswerListInInteger(FFAppState().testQueAnsList.toList()).toList().cast<int>();
                                                                                FFAppState().secondsListInInt = functions.getSecondsListInInt(FFAppState().secondsList.toList()).toList().cast<int>();
                                                                              });
                                                                              _model.updateTestAttempt = await TestGroup.updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall.call(
                                                                                testId: widget.testId,
                                                                                userId: functions.getBase64OfUserId(FFAppState().userIdInt),
                                                                                authToken: FFAppState().subjectToken,
                                                                                testAttemptId: widget.testAttemptId,
                                                                                userAnswersJsonStr: functions.convertQuestionAndAnsIntoMapJson(FFAppState().questionsListInInt.toList(), FFAppState().answerListInInt.toList()),
                                                                                userQuestionWiseDurationInSecJsonStr: functions.convertQuestionAndAnsIntoMapJson(FFAppState().questionsListInInt.toList(), FFAppState().secondsListInInt.toList()),
                                                                                visitedQuestionsJsonStr: '{}',
                                                                                markedQuestionsJsonStr: '{}',
                                                                                elapsedDurationInSec: 200,
                                                                                currentQuestionOffset: 0,
                                                                              );

                                                                              setState(() {});
                                                                            },
                                                                            child:
                                                                                Material(
                                                                              color: Colors.transparent,
                                                                              elevation: 4.0,
                                                                              shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Container(
                                                                                width: 74.0,
                                                                                height: 52.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).titleBackground,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 15.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(0.0, 10.0),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: FFAppState().testQueAnsList[quetionListIndex] < 4 ? (FFAppState().testQueAnsList[quetionListIndex] == queNumbersIndex ? FlutterFlowTheme.of(context).primary : Colors.white) : Colors.white,
                                                                                  ),
                                                                                ),
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      queNumbersItem.toString(),
                                                                                      textAlign: TextAlign.center,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: Color(0xFF252525),
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ],
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .pageViewController
                                                                  ?.previousPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (quetionListIndex ==
                                                                    0)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/arrow-square-left.png',
                                                                      width:
                                                                          44.0,
                                                                      height:
                                                                          44.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                if (quetionListIndex !=
                                                                    0)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/left-filled.png',
                                                                        width:
                                                                            42.0,
                                                                        height:
                                                                            42.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await _model
                                                                  .pageViewController
                                                                  ?.nextPage(
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        300),
                                                                curve:
                                                                    Curves.ease,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (quetionListIndex ==
                                                                    (TestGroup
                                                                            .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                                                            .numQuestions(
                                                                          (_model.questionsList?.jsonBody ??
                                                                              ''),
                                                                        ) -
                                                                        1))
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/arrow-square-right.png',
                                                                      width:
                                                                          44.0,
                                                                      height:
                                                                          44.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                if (quetionListIndex !=
                                                                    (TestGroup
                                                                            .getCompletedTestAttemptDataWithTestResultForATestAttemptCall
                                                                            .numQuestions(
                                                                          (_model.questionsList?.jsonBody ??
                                                                              ''),
                                                                        ) -
                                                                        1))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/right-filled.png',
                                                                        width:
                                                                            42.0,
                                                                        height:
                                                                            42.0,
                                                                        fit: BoxFit
                                                                            .cover,
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
              ),
            ),
          ),
        ));
  }
}
