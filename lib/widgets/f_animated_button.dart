import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/widgets/inner_shadow.dart';

// ignore: camel_case_types
class fAnimatedButton extends StatefulWidget {
  const fAnimatedButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.width = double.infinity,
    this.height = 60.0,
    this.titleColor = Colors.white,
    this.fillColor = Colors.teal,
    this.shadowColor = Colors.black,
    this.elevation = 12.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.innerShadowColor = const Color(0x3F000000),
    this.innerOffset = const Offset(2, 2),
    this.innerBlur = 7.0,
    this.animationDuration = const Duration(seconds: 1),
  }) : super(key: key);

  /// The main title of the button
  final String title;

  /// Width of the button
  final double width;

  /// Height of the button
  final double height;

  /// Button click callback
  final Function()? onTap;

  /// Outer shadow elevation of the button
  final double elevation;

  /// Inner blur of the button
  final double innerBlur;

  /// Color of the button title
  final Color titleColor;

  /// Backround color of the button
  final Color fillColor;

  /// Outer shadow color of the button
  final Color shadowColor;

  /// Inner shadow color of the button
  final Color innerShadowColor;

  /// Border radius of the button
  final BorderRadius borderRadius;

  /// Inner offset shadow of the button
  final Offset innerOffset;

  /// Animation duration on the button pressed
  final Duration animationDuration;

  @override
  State<fAnimatedButton> createState() => _fAnimatedButtonState();
}

// ignore: camel_case_types
class _fAnimatedButtonState extends State<fAnimatedButton> {
  bool isButtonDown = false;

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (event) => setState(() => isButtonDown = false),
      onPointerDown: (event) => setState(() => isButtonDown = true),
      child: GestureDetector(
        onTap: widget.onTap,
        child: PhysicalModel(
          color: Colors.transparent,
          shadowColor: widget.shadowColor,
          elevation: isButtonDown ? 0.0 : widget.elevation,
          borderRadius: widget.borderRadius,
          child: InnerShadow(
            blur: widget.innerBlur,
            color: isButtonDown ? widget.fillColor : widget.innerShadowColor,
            offset: widget.innerOffset,
            child: AnimatedContainer(
              duration: widget.animationDuration,
              width: widget.width,
              height: widget.height,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isButtonDown
                    ? widget.fillColor.withOpacity(0.3)
                    : widget.fillColor,
                borderRadius: widget.borderRadius,
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.titleColor,
                    fontSize: isButtonDown ? 18 : 20,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
