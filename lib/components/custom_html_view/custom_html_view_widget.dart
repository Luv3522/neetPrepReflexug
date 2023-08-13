import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_html_view_model.dart';
export 'custom_html_view_model.dart';

class CustomHtmlViewWidget extends StatefulWidget {
  const CustomHtmlViewWidget({
    Key? key,
    this.questionStr,
  }) : super(key: key);

  final String? questionStr;

  @override
  _CustomHtmlViewWidgetState createState() => _CustomHtmlViewWidgetState();
}

class _CustomHtmlViewWidgetState extends State<CustomHtmlViewWidget> {
  late CustomHtmlViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomHtmlViewModel());

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

    return Html(
      data: widget.questionStr!,
    );
  }
}
