import '/components/locked_content/locked_content_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'lock_page_model.dart';
export 'lock_page_model.dart';

class LockPageWidget extends StatefulWidget {
  const LockPageWidget({Key? key}) : super(key: key);

  @override
  _LockPageWidgetState createState() => _LockPageWidgetState();
}

class _LockPageWidgetState extends State<LockPageWidget> {
  late LockPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LockPageModel());

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
        title: 'LockPage',
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
                  Expanded(
                    child: wrapWithModel(
                      model: _model.lockedContentModel,
                      updateCallback: () => setState(() {}),
                      child: LockedContentWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
