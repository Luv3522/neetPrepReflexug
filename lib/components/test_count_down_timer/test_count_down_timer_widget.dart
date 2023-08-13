import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_count_down_timer_model.dart';
export 'test_count_down_timer_model.dart';

class TestCountDownTimerWidget extends StatefulWidget {
  const TestCountDownTimerWidget({
    Key? key,
    this.minutes,
    int? seconds,
  })  : this.seconds = seconds ?? 0,
        super(key: key);

  final int? minutes;
  final int seconds;

  @override
  _TestCountDownTimerWidgetState createState() =>
      _TestCountDownTimerWidgetState();
}

class _TestCountDownTimerWidgetState extends State<TestCountDownTimerWidget> {
  late TestCountDownTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestCountDownTimerModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.minutes = widget.minutes;
        _model.seconds = widget.seconds;
      });
      _model.instantTimer2 = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          if (_model.seconds == 0) {
            setState(() {
              _model.minutes = (int var1) {
                return var1 > 0 ? (var1 - 1) : 0;
              }(_model.minutes!);
              _model.seconds = (int var1) {
                return var1 > 0 ? 59 : 0;
              }(_model.minutes!);
            });
            return;
          } else {
            setState(() {
              _model.seconds = _model.seconds! + -1;
            });
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
      child: Text(
        '${(String var1) {
          return var1.padLeft(2, '0');
        }(_model.minutes!.toString())} : ${(String var1) {
          return var1.padLeft(2, '0');
        }(_model.seconds!.toString())}',
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
              fontSize: 15.0,
              fontWeight: FontWeight.normal,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
            ),
      ),
    );
  }
}
