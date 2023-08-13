import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'testing_new_model.dart';
export 'testing_new_model.dart';

class TestingNewWidget extends StatefulWidget {
  const TestingNewWidget({Key? key}) : super(key: key);

  @override
  _TestingNewWidgetState createState() => _TestingNewWidgetState();
}

class _TestingNewWidgetState extends State<TestingNewWidget> {
  late TestingNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestingNewModel());

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
        title: 'testingNew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: FutureBuilder<ApiCallResponse>(
                      future: PracticeGroup
                          .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
                          .call(
                        offset: FFAppState().pageNumber,
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
                        final pageViewGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse =
                            snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final queList = PracticeGroup
                                    .getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
                                    .testQuestions(
                                      pageViewGetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsResponse
                                          .jsonBody,
                                    )
                                    ?.toList() ??
                                [];
                            return Container(
                              width: double.infinity,
                              height: 500.0,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: PageView.builder(
                                  controller: _model.pageViewController ??=
                                      PageController(
                                          initialPage: min(
                                              valueOrDefault<int>(
                                                FFAppState().pageNumber,
                                                0,
                                              ),
                                              queList.length - 1)),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: queList.length,
                                  itemBuilder: (context, queListIndex) {
                                    final queListItem = queList[queListIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '${queListIndex.toString()} - ${getJsonField(
                                            queListItem,
                                            r'''$.question''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        Expanded(
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: custom_widgets.CustomWebView(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              src: '<h1>hello</h1>',
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          final numList = FFAppState().numberOfTabs.toList();
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children:
                                  List.generate(numList.length, (numListIndex) {
                                final numListItem = numList[numListIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().pageNumber = numListItem;
                                        FFAppState().pageNumber = numListItem;
                                      });
                                      _model.instantTimer =
                                          InstantTimer.periodic(
                                        duration: Duration(milliseconds: 100),
                                        callback: (timer) async {
                                          if (FFAppState().pageNumber >
                                              _model.pageViewCurrentIndex) {
                                            if (FFAppState().pageNumber ==
                                                _model.pageViewCurrentIndex) {
                                              _model.instantTimer?.cancel();
                                            } else {
                                              await _model.pageViewController
                                                  ?.nextPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            }
                                          } else {
                                            if (FFAppState().pageNumber ==
                                                _model.pageViewCurrentIndex) {
                                              _model.instantTimer?.cancel();
                                            } else {
                                              await _model.pageViewController
                                                  ?.previousPage(
                                                duration:
                                                    Duration(milliseconds: 300),
                                                curve: Curves.ease,
                                              );
                                            }
                                          }
                                        },
                                        startImmediately: true,
                                      );
                                    },
                                    child: Container(
                                      width: 180.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF296F01),
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        numListItem.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Colors.white,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Button',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleSmallFamily),
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
