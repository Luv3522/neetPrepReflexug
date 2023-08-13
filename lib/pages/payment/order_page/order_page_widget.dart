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
import 'order_page_model.dart';
export 'order_page_model.dart';

class OrderPageWidget extends StatefulWidget {
  const OrderPageWidget({Key? key}) : super(key: key);

  @override
  _OrderPageWidgetState createState() => _OrderPageWidgetState();
}

class _OrderPageWidgetState extends State<OrderPageWidget> {
  late OrderPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.courseInfo = await PaymentGroup
          .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
          .call(
        courseId: FFAppState().courseId,
      );
      await Future.delayed(const Duration(milliseconds: 200));
      if ((_model.courseInfo?.succeeded ?? true) &&
          ((PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                          .offerDiscountedFees(
                    (_model.courseInfo?.jsonBody ?? ''),
                  ) as List)
                      .map<String>((s) => s.toString())
                      .toList()
                      .first !=
                  null &&
              (PaymentGroup
                          .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                          .offerDiscountedFees(
                    (_model.courseInfo?.jsonBody ?? ''),
                  ) as List)
                      .map<String>((s) => s.toString())
                      .toList()
                      .first !=
                  '')) {
        setState(() {
          _model.amount = (PaymentGroup
                  .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                  .offerDiscountedFees(
            (_model.courseInfo?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          _model.title = (PaymentGroup
                  .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                  .offerTitles(
            (_model.courseInfo?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          _model.fee = (PaymentGroup
                  .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                  .offerFees(
            (_model.courseInfo?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()
              .first;
          _model.cc = functions
              .getIntFromBase64(getJsonField(
                (_model.courseInfo?.jsonBody ?? ''),
                r'''$.data.course.offers.edges[0].node.id''',
              ).toString().toString())
              .toString();
        });
        return;
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('Error'),
              content:
                  Text('The page couldn\'t be loaded. Please try again later.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('Ok'),
                ),
              ],
            );
          },
        );
        context.safePop();
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
      future: PaymentGroup
          .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
          .call(
        courseId: FFAppState().courseId,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse =
            snapshot.data!;
        return Title(
            title: 'OrderPage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(_model.unfocusNode),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                  automaticallyImplyLeading: false,
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Color(0xFF252525),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('PracticeChapterWisePage');
                    },
                  ),
                  title: Align(
                    alignment: AlignmentDirectional(-0.35, 0.2),
                    child: Text(
                      'Order Summary',
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineMediumFamily,
                                color: Color(0xFF1A1C1D),
                                fontSize: 18.0,
                                fontWeight: FontWeight.normal,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineMediumFamily),
                              ),
                    ),
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                body: SafeArea(
                  top: true,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: (_model.courseInfo?.succeeded ?? true) &&
                          (PaymentGroup
                                  .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                  .course(
                                (_model.courseInfo?.jsonBody ?? ''),
                              ) !=
                              null),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 20.0, 16.0, 20.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setState(() {
                                          _model.amount = PaymentGroup
                                              .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                              .defaultDiscountPrice(
                                                orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                    .jsonBody,
                                              )
                                              .toString();
                                          _model.title = PaymentGroup
                                              .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                              .defaultName(
                                                orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                    .jsonBody,
                                              )
                                              .toString();
                                          _model.fee = PaymentGroup
                                              .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                              .defaultFee(
                                                orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                    .jsonBody,
                                              )
                                              .toString();
                                          _model.cc = functions
                                              .getIntFromBase64(PaymentGroup
                                                  .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                                  .defaultDisPercent(
                                                    orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                        .jsonBody,
                                                  )
                                                  .toString())
                                              .toString();
                                          _model.isOptionSel = false;
                                        });
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 2.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 15.0,
                                                color: valueOrDefault<Color>(
                                                  !_model.isOptionSel!
                                                      ? Color(0x44E6A123)
                                                      : Color(0x33858585),
                                                  Color(0x33E6A123),
                                                ),
                                                offset: Offset(0.0, 10.0),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: valueOrDefault<Color>(
                                                !_model.isOptionSel!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 16.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    20.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                                      .jsonBody,
                                                                  r'''$.data.course.name''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Valid Till:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFFB9B9B9),
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          11.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.formatDate(
                                                                            (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                                                                    .defaultExpiryAt(
                                                                                      orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse.jsonBody,
                                                                                    )
                                                                                    .toString() ??
                                                                                functions.getDate(getCurrentTimestamp, 60)?.toString())!,
                                                                            'yMMMd'),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF858585),
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (false)
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Days:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                Color(0xFFB5B5B5),
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        '365',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: Color(0xFF858585),
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 55.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              '₹ ${(String var1) {
                                                                return var1
                                                                    .split('.')
                                                                    .first;
                                                              }(PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.defaultDiscountPrice(
                                                                    orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                                        .jsonBody,
                                                                  ).toString())}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Text(
                                                              '₹ ${(String var1) {
                                                                return var1
                                                                    .split('.')
                                                                    .first;
                                                              }(PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.defaultFee(
                                                                    orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                                        .jsonBody,
                                                                  ).toString())}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: Color(
                                                                        0xFF858585),
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '-${(String var1) {
                                                                  return var1
                                                                      .split(
                                                                          '.')
                                                                      .first;
                                                                }(PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.defaultDisPercent(
                                                                      orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                                          .jsonBody,
                                                                    ).toString())}%',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: Color(
                                                                          0xFFEF4444),
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Builder(
                                            builder: (context) {
                                              final planList = PaymentGroup
                                                      .getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
                                                      .courseOffers(
                                                        orderPageGetCoursePriceAndCourseOffersToSelectFromToStartPaymentResponse
                                                            .jsonBody,
                                                      )
                                                      ?.toList() ??
                                                  [];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: List.generate(
                                                    planList.length,
                                                    (planListIndex) {
                                                  final planListItem =
                                                      planList[planListIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                20.0,
                                                                16.0,
                                                                20.0),
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
                                                        setState(() {
                                                          _model.amount =
                                                              getJsonField(
                                                            planListItem,
                                                            r'''$.discountedFee''',
                                                          ).toString();
                                                          _model.title =
                                                              getJsonField(
                                                            planListItem,
                                                            r'''$.title''',
                                                          ).toString();
                                                          _model.fee =
                                                              getJsonField(
                                                            planListItem,
                                                            r'''$.fee''',
                                                          ).toString();
                                                          _model.cc = functions
                                                              .getIntFromBase64(
                                                                  getJsonField(
                                                                planListItem,
                                                                r'''$.id''',
                                                              ).toString())
                                                              .toString();
                                                          _model.isOptionSel =
                                                              true;
                                                        });
                                                      },
                                                      child: Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius:
                                                                    15.0,
                                                                color:
                                                                    valueOrDefault<
                                                                        Color>(
                                                                  !_model.isOptionSel!
                                                                      ? Color(
                                                                          0x44E6A123)
                                                                      : Color(
                                                                          0x33858585),
                                                                  Color(
                                                                      0x33858585),
                                                                ),
                                                                offset: Offset(
                                                                    0.0, 10.0),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                            border: Border.all(
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                _model.isOptionSel!
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                getJsonField(
                                                                                  planListItem,
                                                                                  r'''$.title''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Valid Till:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: Color(0xFFB9B9B9),
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 11.0, 0.0),
                                                                                      child: Text(
                                                                                        functions.formatDate(
                                                                                            (getJsonField(
                                                                                                  planListItem,
                                                                                                  r'''$.expiryAt''',
                                                                                                ).toString() ??
                                                                                                functions
                                                                                                    .getDate(
                                                                                                        getCurrentTimestamp,
                                                                                                        valueOrDefault<int>(
                                                                                                          getJsonField(
                                                                                                            planListItem,
                                                                                                            r'''$.durationInDays''',
                                                                                                          ),
                                                                                                          30,
                                                                                                        ))
                                                                                                    ?.toString())!,
                                                                                            'yMMMd'),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: Color(0xFF858585),
                                                                                              fontSize: 12.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if (false)
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Days:',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: Color(0xFFB5B5B5),
                                                                                            fontSize: 12.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        '365',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: Color(0xFF858585),
                                                                                              fontSize: 12.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            55.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              '₹ ${(String var1) {
                                                                                return var1.split('.').first;
                                                                              }(getJsonField(
                                                                                planListItem,
                                                                                r'''$.discountedFee''',
                                                                              ).toString())}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 16.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '₹ ${(String var1) {
                                                                                return var1.split('.').first;
                                                                              }(getJsonField(
                                                                                planListItem,
                                                                                r'''$.fee''',
                                                                              ).toString())}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: Color(0xFF858585),
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                    decoration: TextDecoration.lineThrough,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                '-${(String var1) {
                                                                                  return var1.split('.').first;
                                                                                }(getJsonField(
                                                                                  planListItem,
                                                                                  r'''$.discountPercentage''',
                                                                                ).toString())}%',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: Color(0xFFEF4444),
                                                                                      fontSize: 12.0,
                                                                                      fontWeight: FontWeight.normal,
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
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 24.0, 16.0, 24.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 155.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              border: Border.all(
                                                color: Color(0xFFE9E9E9),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 20.0, 16.0, 20.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Price',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF858585),
                                                                fontSize: 12.0,
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
                                                          '₹${(String var1, String var2) {
                                                            return var1.isEmpty
                                                                ? var2
                                                                : var1;
                                                          }(_model.fee, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerFees(
                                                                (_model.courseInfo
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List).map<String>((s) => s.toString()).toList().first)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF252525),
                                                                fontSize: 16.0,
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
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 7.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Discount',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF858585),
                                                                fontSize: 12.0,
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
                                                          '₹${((String var1, String var2) {
                                                                return var1
                                                                        .isEmpty
                                                                    ? double
                                                                        .parse(
                                                                            var2)
                                                                    : double
                                                                        .parse(
                                                                            var1);
                                                              }(_model.fee, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerFees(
                                                                    (_model.courseInfo
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList().first) - double.parse((String var1, String var2) {
                                                                return var1
                                                                        .isEmpty
                                                                    ? var2
                                                                    : var1;
                                                              }(_model.amount, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerdispercent(
                                                                    (_model.courseInfo
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList().first.toString()))).toString()}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFFEF4444),
                                                                fontSize: 14.0,
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
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: Color(0xFFE9E9E9),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 7.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Total Payment',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: Color(
                                                                    0xFF0F172A),
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                        Text(
                                                          '₹ ${(String var1, String var2) {
                                                            return var1.isEmpty
                                                                ? var2
                                                                : var1;
                                                          }(_model.amount, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerDiscountedFees(
                                                                (_model.courseInfo
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List).map<String>((s) => s.toString()).toList().first)}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 24.0, 16.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => FocusScope
                                                              .of(context)
                                                          .requestFocus(_model
                                                              .unfocusNode),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            BottomPopupWidget(
                                                          discount:
                                                              '₹${(String var1, String var2) {
                                                            return var1.isEmpty
                                                                ? var2
                                                                : var1;
                                                          }(_model.amount, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerdispercent(
                                                                    (_model.courseInfo
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList().first.toString())}',
                                                          mrp: '₹ ${(String var1, String var2) {
                                                            return var1.isEmpty
                                                                ? var2
                                                                : var1;
                                                          }(_model.fee, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerFees(
                                                                (_model.courseInfo
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ) as List).map<String>((s) => s.toString()).toList().first)}',
                                                          currPrice:
                                                              '₹ ${(String var1, String var2) {
                                                            return var1.isEmpty
                                                                ? var2
                                                                : var1;
                                                          }(_model.amount, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerDiscountedFees(
                                                                    (_model.courseInfo
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) as List).map<String>((s) => s.toString()).toList().first)}',
                                                          phoneNum: FFAppState()
                                                              .phoneNum,
                                                          name:
                                                              currentUserDisplayName,
                                                          email:
                                                              currentUserEmail,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => setState(() =>
                                                    _model.bottomPop = value));

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  border: Border.all(
                                                    color: Color(0xFFE9E9E9),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Personal Details',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        '${getJsonField(
                                                              _model.bottomPop,
                                                              r'''$.name''',
                                                            ) != null ? getJsonField(
                                                            _model.bottomPop,
                                                            r'''$.name''',
                                                          ).toString() : currentUserDisplayName} . ${currentUserEmail}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFF858585),
                                                                  fontSize:
                                                                      12.0,
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
                                                        '${getJsonField(
                                                              _model.bottomPop,
                                                              r'''$.phone''',
                                                            ) != null ? getJsonField(
                                                            _model.bottomPop,
                                                            r'''$.phone''',
                                                          ).toString() : 'Click to add number'}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: Color(
                                                                      0xFF858585),
                                                                  fontSize:
                                                                      12.0,
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
                          Container(
                            width: double.infinity,
                            height: 72.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 12.0, 16.0, 12.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  var _shouldSetState = false;
                                  if (getJsonField(
                                        _model.bottomPop,
                                        r'''$.phone''',
                                      ) !=
                                      null) {
                                    setState(() {});
                                    _model.paymentDetails = await PaymentGroup
                                        .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                        .call(
                                      txnAmount: functions
                                          .getIntegerAmount(_model.amount),
                                      email: currentUserEmail,
                                      mobile: getJsonField(
                                        _model.bottomPop,
                                        r'''$.phone''',
                                      ).toString(),
                                      authToken: FFAppState().subjectToken,
                                      userid: FFAppState().userIdInt,
                                      course:
                                          FFAppState().courseIdInt.toString(),
                                      courseOfferId: _model.cc,
                                    );
                                    _shouldSetState = true;
                                    await actions.getJson(
                                      (_model.paymentDetails?.jsonBody ?? ''),
                                    );
                                    _model.paymentStatus =
                                        await actions.paytmIntegration(
                                      getJsonField(
                                        (_model.paymentDetails?.jsonBody ?? ''),
                                        r'''$.order_id''',
                                      ).toString(),
                                      getJsonField(
                                        (_model.paymentDetails?.jsonBody ?? ''),
                                        r'''$.amount''',
                                      ).toString(),
                                      getJsonField(
                                        (_model.paymentDetails?.jsonBody ?? ''),
                                        r'''$.txnToken''',
                                      ).toString(),
                                      PaymentGroup
                                          .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                          .paymentId(
                                        (_model.paymentDetails?.jsonBody ?? ''),
                                      ),
                                      PaymentGroup
                                          .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                          .mid(
                                            (_model.paymentDetails?.jsonBody ??
                                                ''),
                                          )
                                          .toString(),
                                      PaymentGroup
                                          .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                          .callbackUrl(
                                            (_model.paymentDetails?.jsonBody ??
                                                ''),
                                          )
                                          .toString(),
                                    );
                                    _shouldSetState = true;
                                    _model.paymentResponse = await PaymentGroup
                                        .paymentSuccessBackendProcessingCallToEnableCourseCall
                                        .call(
                                      orderId: PaymentGroup
                                          .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                          .orderId(
                                            (_model.paymentDetails?.jsonBody ??
                                                ''),
                                          )
                                          .toString(),
                                      paymentId: PaymentGroup
                                          .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                          .paymentId(
                                        (_model.paymentDetails?.jsonBody ?? ''),
                                      ),
                                    );
                                    _shouldSetState = true;
                                    setState(() {});
                                    if (PaymentGroup
                                            .paymentSuccessBackendProcessingCallToEnableCourseCall
                                            .paymentResponseStatus(
                                              (_model.paymentResponse
                                                      ?.jsonBody ??
                                                  ''),
                                            )
                                            .toString() ==
                                        'TXN_FAILURE') {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return AlertDialog(
                                            title: Text('Retry Payment'),
                                            content: Text(
                                                'Your payment was not completed. Please try again later. If your payment is deducted, your course access will be setup in a few minutes. Please close the app and check later. Please reach out to us if you are facing any issues.'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          );
                                        },
                                      );

                                      context.pushNamed(
                                        'PostTransaction',
                                        queryParameters: {
                                          'success': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                          'id': serializeParam(
                                            PaymentGroup
                                                .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                .orderId(
                                                  (_model.paymentDetails
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString(),
                                            ParamType.String,
                                          ),
                                          'amount': serializeParam(
                                            PaymentGroup
                                                .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                .amount(
                                                  (_model.paymentDetails
                                                          ?.jsonBody ??
                                                      ''),
                                                )
                                                .toString(),
                                            ParamType.String,
                                          ),
                                        }.withoutNulls,
                                      );

                                      if (_shouldSetState) setState(() {});
                                      return;
                                    } else {
                                      if (PaymentGroup
                                              .paymentSuccessBackendProcessingCallToEnableCourseCall
                                              .paymentResponseStatus(
                                                (_model.paymentResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              )
                                              .toString() ==
                                          'TXN_SUCCESS') {
                                        FFAppState().clearUserInfoQueryCacheKey(
                                            FFAppState().userIdInt.toString());

                                        context.pushNamed(
                                          'PostTransaction',
                                          queryParameters: {
                                            'success': serializeParam(
                                              true,
                                              ParamType.bool,
                                            ),
                                            'id': serializeParam(
                                              PaymentGroup
                                                  .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                  .orderId(
                                                    (_model.paymentDetails
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              ParamType.String,
                                            ),
                                            'amount': serializeParam(
                                              PaymentGroup
                                                  .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                  .amount(
                                                    (_model.paymentDetails
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        context
                                            .goNamed('PracticeChapterWisePage');

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Please wait'),
                                              content: Text(
                                                  'Your payment is yet to be confirmed. If your money is deducted, please wait for a few minutes for getting course access. Please close the app and check later. Please reach out to us if you are facing any issues.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            );
                                          },
                                        );

                                        context.pushNamed(
                                          'PostTransaction',
                                          queryParameters: {
                                            'success': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                            'id': serializeParam(
                                              PaymentGroup
                                                  .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                  .orderId(
                                                    (_model.paymentDetails
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              ParamType.String,
                                            ),
                                            'amount': serializeParam(
                                              PaymentGroup
                                                  .createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
                                                  .amount(
                                                    (_model.paymentDetails
                                                            ?.jsonBody ??
                                                        ''),
                                                  )
                                                  .toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }
                                    }
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Mobile Number'),
                                          content: Text(
                                              'Please enter the mobile number'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) setState(() {});
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 2.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 15.0,
                                          color: Color(0x04060F0D),
                                          offset: Offset(0.0, 10.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Pay ${(String var1, String var2) {
                                            return var1.isEmpty ? var2 : var1;
                                          }(_model.amount, (PaymentGroup.getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall.offerDiscountedFees(
                                                (_model.courseInfo?.jsonBody ??
                                                    ''),
                                              ) as List).map<String>((s) => s.toString()).toList().first)}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color: Colors.white,
                                                fontSize: 16.0,
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
