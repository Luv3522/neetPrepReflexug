import '/backend/api_requests/api_calls.dart';
import '/components/reset_pop_up/reset_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'practice_test_page_model.dart';
export 'practice_test_page_model.dart';

class PracticeTestPageWidget extends StatefulWidget {
  const PracticeTestPageWidget({
    Key? key,
    this.testId,
  }) : super(key: key);

  final String? testId;

  @override
  _PracticeTestPageWidgetState createState() => _PracticeTestPageWidgetState();
}

class _PracticeTestPageWidgetState extends State<PracticeTestPageWidget> {
  late PracticeTestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PracticeTestPageModel());

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
      future: PracticeGroup.getPracticeTestDetailsForAnExampleSubjectAnatomyCall
          .call(
        testId: widget.testId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        final practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse =
            snapshot.data!;
        return Title(
            title: 'PracticeTestPage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().pageNumber = 0;
                                });

                                context.pushNamed('PracticeChapterWisePage');
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 29.0,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                getJsonField(
                                  practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                      .jsonBody,
                                  r'''$.data.test.name''',
                                ).toString().maybeHandleOverflow(
                                      maxChars: 25,
                                      replacement: '…',
                                    ),
                                textAlign: TextAlign.center,
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
                            ),
                          ],
                        ),
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
                            barrierColor: Color(0x00FFFFFF),
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode),
                                child: Padding(
                                  padding: MediaQuery.viewInsetsOf(context),
                                  child: Container(
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    child: ResetPopUpWidget(
                                      testId: widget.testId,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                          size: 29.0,
                        ),
                      ),
                    ],
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: FutureBuilder<ApiCallResponse>(
                    future: SignupGroup
                        .loggedInUserInformationAndCourseAccessCheckingApiCall
                        .call(
                      authToken: FFAppState().subjectToken,
                      courseIdInt: FFAppState().courseIdInt,
                      altCourseIds: FFAppState().courseIdInts,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      final containerLoggedInUserInformationAndCourseAccessCheckingApiResponse =
                          snapshot.data!;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 9.0, 0.0),
                                    child: Container(
                                      height: 36.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 6.0, 14.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Questions: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              '${getJsonField(
                                                practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                    .jsonBody,
                                                r'''$.data.test.numQuestions''',
                                              ).toString()}',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color: Colors.black,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    getJsonField(
                                          practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                              .jsonBody,
                                          r'''$.data.test.sections''',
                                        ) !=
                                        null,
                                    false,
                                  ))
                                    Container(
                                      height: 36.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF5F5F5),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            14.0, 6.0, 14.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Topics: ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                            ),
                                            Text(
                                              ((List<String>? var1) {
                                                return var1 == null
                                                    ? 1
                                                    : var1.length;
                                              }((getJsonField(
                                                practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                    .jsonBody,
                                                r'''$.data.test.sections''',
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()))
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 12.0, 16.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    var _shouldSetState = false;
                                    if ((getJsonField(
                                              containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                  .jsonBody,
                                              r'''$.data.me.userCourses.edges''',
                                            ) !=
                                            null) &&
                                        (SignupGroup
                                                .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                .courses(
                                                  containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                      .jsonBody,
                                                )
                                                .length !=
                                            0)) {
                                      context.pushNamed(
                                        'PracticeQuetionsPage',
                                        queryParameters: {
                                          'testId': serializeParam(
                                            widget.testId,
                                            ParamType.String,
                                          ),
                                          'offset': serializeParam(
                                            0,
                                            ParamType.int,
                                          ),
                                          'numberOfQuestions': serializeParam(
                                            getJsonField(
                                              practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                  .jsonBody,
                                              r'''$.data.test.numQuestions''',
                                            ),
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (true) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text('Buy Course'),
                                                      content: Text(
                                                          'To access this section you need to buy the course.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Cancel'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'Buy Course'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          context.pushNamed('OrderPage');

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        _model.offSetN =
                                            await actions.getOffset(
                                          getJsonField(
                                            practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                .jsonBody,
                                            r'''$.data.test.sectionNumQues''',
                                          )!,
                                          0,
                                        );
                                        _shouldSetState = true;

                                        context.pushNamed(
                                          'PracticeQuetionsPage',
                                          queryParameters: {
                                            'testId': serializeParam(
                                              widget.testId,
                                              ParamType.String,
                                            ),
                                            'offset': serializeParam(
                                              0,
                                              ParamType.int,
                                            ),
                                            'numberOfQuestions': serializeParam(
                                              getJsonField(
                                                practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                    .jsonBody,
                                                r'''$.data.test.numQuestions''',
                                              ),
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .rightToLeft,
                                            ),
                                          },
                                        );

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }

                                    if (_shouldSetState) setState(() {});
                                  },
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 2.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 60.0,
                                            color: Color(0x04060F0D),
                                            offset: Offset(0.0, 4.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 20.0, 15.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(
                                                      practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                          .jsonBody,
                                                      r'''$.data.test.name''',
                                                    )
                                                        .toString()
                                                        .maybeHandleOverflow(
                                                          maxChars: 27,
                                                          replacement: '…',
                                                        ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          fontSize: 16.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  Text(
                                                    '${'${getJsonField(
                                                      practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                          .jsonBody,
                                                      r'''$.data.test.numQuestions''',
                                                    ).toString()}'} questions',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFF858585),
                                                          fontSize: 14.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (SignupGroup
                                                  .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                  .courses(
                                                    containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                        .jsonBody,
                                                  )
                                                  .length >
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 20.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/arrow-right.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          if (SignupGroup
                                                  .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                  .courses(
                                                    containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                        .jsonBody,
                                                  )
                                                  .length ==
                                              0)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 20.0, 0.0),
                                              child: Image.asset(
                                                'assets/images/lock.png',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Visibility(
                                      visible: valueOrDefault<bool>(
                                        getJsonField(
                                              practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                  .jsonBody,
                                              r'''$.data.test.sections''',
                                            ) !=
                                            null,
                                        false,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 8.0, 16.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final practiceTestSections =
                                                PracticeGroup
                                                        .getPracticeTestDetailsForAnExampleSubjectAnatomyCall
                                                        .sections(
                                                          practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  practiceTestSections.length,
                                              itemBuilder: (context,
                                                  practiceTestSectionsIndex) {
                                                final practiceTestSectionsItem =
                                                    practiceTestSections[
                                                        practiceTestSectionsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      var _shouldSetState =
                                                          false;
                                                      if ((getJsonField(
                                                                containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                                    .jsonBody,
                                                                r'''$.data.me.userCourses.edges''',
                                                              ) !=
                                                              null) &&
                                                          (SignupGroup
                                                                  .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                                  .courses(
                                                                    containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                                        .jsonBody,
                                                                  )
                                                                  .length !=
                                                              0)) {
                                                        _model.offSetN1Copy =
                                                            await actions
                                                                .getOffset(
                                                          getJsonField(
                                                            practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                                .jsonBody,
                                                            r'''$.data.test.sectionNumQues''',
                                                          )!,
                                                          0,
                                                        );
                                                        _shouldSetState = true;

                                                        context.pushNamed(
                                                          'PracticeQuetionsPage',
                                                          queryParameters: {
                                                            'testId':
                                                                serializeParam(
                                                              widget.testId,
                                                              ParamType.String,
                                                            ),
                                                            'offset':
                                                                serializeParam(
                                                              _model
                                                                  .offSetN1Copy,
                                                              ParamType.int,
                                                            ),
                                                            'numberOfQuestions':
                                                                serializeParam(
                                                              getJsonField(
                                                                practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                                    .jsonBody,
                                                                r'''$.data.test.numQuestions''',
                                                              ),
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .rightToLeft,
                                                            ),
                                                          },
                                                        );

                                                        if (_shouldSetState)
                                                          setState(() {});
                                                        return;
                                                      } else {
                                                        if (true) {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Buy Course'),
                                                                        content:
                                                                            Text('To access this section you need to buy the course.'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Cancel'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Buy Course'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (confirmDialogResponse) {
                                                            context.pushNamed(
                                                                'OrderPage');

                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          } else {
                                                            if (_shouldSetState)
                                                              setState(() {});
                                                            return;
                                                          }
                                                        } else {
                                                          _model.offSetNCopy =
                                                              await actions
                                                                  .getOffset(
                                                            getJsonField(
                                                              practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                                  .jsonBody,
                                                              r'''$.data.test.sectionNumQues''',
                                                            )!,
                                                            0,
                                                          );
                                                          _shouldSetState =
                                                              true;

                                                          context.pushNamed(
                                                            'PracticeQuetionsPage',
                                                            queryParameters: {
                                                              'testId':
                                                                  serializeParam(
                                                                widget.testId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                              'offset':
                                                                  serializeParam(
                                                                _model
                                                                    .offSetNCopy,
                                                                ParamType.int,
                                                              ),
                                                              'numberOfQuestions':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse
                                                                      .jsonBody,
                                                                  r'''$.data.test.numQuestions''',
                                                                ),
                                                                ParamType.int,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              kTransitionInfoKey:
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .rightToLeft,
                                                              ),
                                                            },
                                                          );

                                                          if (_shouldSetState)
                                                            setState(() {});
                                                          return;
                                                        }
                                                      }

                                                      if (_shouldSetState)
                                                        setState(() {});
                                                    },
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      elevation: 2.0,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                      child: Container(
                                                        width: 100.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 60.0,
                                                              color: Color(
                                                                  0x04060F0D),
                                                              offset: Offset(
                                                                  0.0, 4.0),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        20.0,
                                                                        15.0,
                                                                        20.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      getJsonField(
                                                                        practiceTestSectionsItem,
                                                                        r'''$[0]''',
                                                                      )
                                                                          .toString()
                                                                          .maybeHandleOverflow(
                                                                            maxChars:
                                                                                27,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                16.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Text(
                                                                      '${functions.numberOfQuestins(getJsonField(
                                                                            practiceTestPageGetPracticeTestDetailsForAnExampleSubjectAnatomyResponse.jsonBody,
                                                                            r'''$.data.test.sectionNumQues''',
                                                                          )!, practiceTestSectionsIndex).toString()} questions',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFF858585),
                                                                            fontSize:
                                                                                14.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            if (SignupGroup
                                                                    .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                                    .courses(
                                                                      containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                                          .jsonBody,
                                                                    )
                                                                    .length >
                                                                0)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/arrow-right.png',
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            if (SignupGroup
                                                                    .loggedInUserInformationAndCourseAccessCheckingApiCall
                                                                    .courses(
                                                                      containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                                                          .jsonBody,
                                                                    )
                                                                    .length ==
                                                                0)
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                                child:
                                                                    Image.asset(
                                                                  'assets/images/lock.png',
                                                                  width: 24.0,
                                                                  height: 24.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Visibility(
                                  visible: getJsonField(
                                        containerLoggedInUserInformationAndCourseAccessCheckingApiResponse
                                            .jsonBody,
                                        r'''$.data.me.userCourses.edges''',
                                      ) ==
                                      null,
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: PaymentGroup
                                        .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                        .call(
                                      courseId: FFAppState().courseId,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: LinearProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        );
                                      }
                                      final containerGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse =
                                          snapshot.data!;
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFB27A14),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: Image.asset(
                                              'assets/images/Header-Curves.png',
                                            ).image,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 23.0, 16.0, 25.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 10.0, 0.0),
                                                  child: Wrap(
                                                    spacing: 0.0,
                                                    runSpacing: 0.0,
                                                    alignment:
                                                        WrapAlignment.start,
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .start,
                                                    direction: Axis.horizontal,
                                                    runAlignment:
                                                        WrapAlignment.start,
                                                    verticalDirection:
                                                        VerticalDirection.down,
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      Text(
                                                        'Pay only ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        '₹ ${(String var1) {
                                                          return var1
                                                              .split('.')
                                                              .first;
                                                        }((PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerDiscountedFees(
                                                          containerGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                              .jsonBody,
                                                        ) as List).map<String>((s) => s.toString()).toList().first)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        ' & ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'get ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'access ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'to ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'the ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'chapters.',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context
                                                      .pushNamed('OrderPage');
                                                },
                                                child: Material(
                                                  color: Colors.transparent,
                                                  elevation: 2.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  29.0,
                                                                  13.0,
                                                                  29.0,
                                                                  13.0),
                                                      child: Text(
                                                        'Buy Now',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFFB27A14),
                                                                  fontSize:
                                                                      16.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
