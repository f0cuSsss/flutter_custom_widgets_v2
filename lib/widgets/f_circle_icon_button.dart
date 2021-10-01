// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/widgets/utils/clippers/circle_clipper.dart';

class fCircleIconButton extends StatefulWidget {
  const fCircleIconButton({
    Key? key,
    required this.icon,
    required this.onTap,
    this.size = 60,
    this.iconColor = Colors.black,
    this.fillColor = Colors.white,
    this.shadowColor = Colors.grey,
    this.elevation = 5.0,
  }) : super(key: key);

  /// Inner icon
  final IconData icon;

  /// Icon color
  final Color iconColor;

  /// Fill color of the button
  final Color fillColor;

  /// Shadow color of the button
  final Color shadowColor;

  /// Width and height of the button
  final double size;

  /// Shadow elevation of the button
  final double elevation;

  /// Click handler
  final Function() onTap;

  @override
  State<fCircleIconButton> createState() => _fCircleIconButtonState();
}

class _fCircleIconButtonState extends State<fCircleIconButton> {
  bool isButtonDown = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => setState(() => isButtonDown = true),
      onPointerUp: (event) async {
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() => isButtonDown = false);
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: widget.shadowColor,
          elevation: isButtonDown ? 0.0 : widget.elevation,
          shape: BoxShape.circle,
          child: ClipOval(
            clipper: CircleClipper(),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              color: widget.fillColor,
              width: widget.size,
              height: widget.size,
              child: FittedBox(
                child: Icon(widget.icon, color: widget.iconColor),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
