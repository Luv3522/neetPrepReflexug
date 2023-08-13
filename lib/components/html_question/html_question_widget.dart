import '/components/custom_html_view/custom_html_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'html_question_model.dart';
export 'html_question_model.dart';

class HtmlQuestionWidget extends StatefulWidget {
  const HtmlQuestionWidget({
    Key? key,
    required this.questionHtmlStr,
  }) : super(key: key);

  final String? questionHtmlStr;

  @override
  _HtmlQuestionWidgetState createState() => _HtmlQuestionWidgetState();
}

class _HtmlQuestionWidgetState extends State<HtmlQuestionWidget> {
  late HtmlQuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HtmlQuestionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ((String var1) {
                  return !RegExp(r'<img.*?src=".*?svg" [^>]*?>')
                          .hasMatch(var1) &&
                      !RegExp(r'<(audio|iframe|table)\b[^>]*>')
                          .hasMatch(var1) &&
                      !RegExp(r'(<math.*>.*</math>|math-tex)').hasMatch(var1);
                }(widget.questionHtmlStr!))
                  wrapWithModel(
                    model: _model.customHtmlViewModel,
                    updateCallback: () => setState(() {}),
                    child: CustomHtmlViewWidget(
                      questionStr: widget.questionHtmlStr,
                    ),
                  ),
                if ((String var1) {
                  return RegExp(r'<img.*?src=".*?svg" [^>]*?>')
                          .hasMatch(var1) ||
                      RegExp(r'<(audio|iframe|table)\b[^>]*>').hasMatch(var1) ||
                      RegExp(r'(<math.*>.*</math>|math-tex)').hasMatch(var1);
                }(widget.questionHtmlStr!))
                  custom_widgets.CustomWebView(
                    width: double.infinity,
                    height: 250.0,
                    src: widget.questionHtmlStr!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
