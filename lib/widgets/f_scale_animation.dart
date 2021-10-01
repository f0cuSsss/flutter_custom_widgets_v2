// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class fScaleAnimated extends StatefulWidget {
  const fScaleAnimated({
    Key? key,
    required this.child,
    this.isRepeat = false,
    this.curve = Curves.easeIn,
    this.duration = const Duration(seconds: 12),
  }) : super(key: key);

  /// Repeat animation
  final bool isRepeat;

  /// Animation curve
  final Curve curve;

  /// Animation duration
  final Duration duration;

  /// Child widget for animation
  final Widget child;

  @override
  State<fScaleAnimated> createState() => _fScaleAnimatedState();
}

class _fScaleAnimatedState extends State<fScaleAnimated>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: widget.duration,
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: widget.curve,
  );

  @override
  void initState() {
    super.initState();
    if (widget.isRepeat) _controller.repeat(reverse: false);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
