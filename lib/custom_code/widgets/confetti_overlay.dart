// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:confetti/confetti.dart';
import 'dart:math';

class ConfettiOverlay extends StatefulWidget {
  const ConfettiOverlay({
    Key? key,
    this.width,
    this.height,
    required this.show,
    required this.particleCount,
    required this.gravity,
  }) : super(key: key);

  final double? width;
  final double? height;
  final int particleCount;
  final double gravity;
  final bool show;

  @override
  _ConfettiOverlayState createState() => _ConfettiOverlayState();
}

Path drawStar(Size size) {
  // Method to convert degree to radians
  double degToRad(double deg) => deg * (pi / 180.0);

  const numberOfPoints = 5;
  final halfWidth = size.width / 2;
  final externalRadius = halfWidth;
  final internalRadius = halfWidth / 2.5;
  final degreesPerStep = degToRad(360 / numberOfPoints);
  final halfDegreesPerStep = degreesPerStep / 2;
  final path = Path();
  final fullAngle = degToRad(360);
  path.moveTo(size.width, halfWidth);

  for (double step = 0; step < fullAngle; step += degreesPerStep) {
    path.lineTo(halfWidth + externalRadius * cos(step),
        halfWidth + externalRadius * sin(step));
    path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
        halfWidth + internalRadius * sin(step + halfDegreesPerStep));
  }
  path.close();
  return path;
}

class _ConfettiOverlayState extends State<ConfettiOverlay> {
  late final ConfettiController _controllerCenter;
  final List<Color> defaultColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.pink,
    Colors.purple,
    Colors.orange
  ];

  @override
  Widget build(BuildContext context) {
    widget.show ? _controllerCenter.play() : _controllerCenter.stop();
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _controllerCenter,
        blastDirectionality: BlastDirectionality.explosive,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: widget.particleCount > 0 ? widget.particleCount : 30,
        gravity:
            widget.gravity > 1 || widget.gravity < 0 ? 0.5 : widget.gravity,
        shouldLoop: false,
        colors: defaultColors,
        createParticlePath: drawStar,
      ),
    );
  }

  @override
  void initState() {
    _controllerCenter =
        ConfettiController(duration: const Duration(milliseconds: 100));

    /// _controllerCenter.play();
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }
}
