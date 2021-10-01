import 'package:flutter/material.dart';
import 'package:flutter_custom_widgets/widgets/f_circle_icon_button.dart';
import 'package:flutter_custom_widgets/widgets/f_scale_animation.dart';
import 'package:flutter_custom_widgets/widgets/f_animated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              fAnimatedButton(
                title: 'PUSH IT',
                animationDuration: const Duration(seconds: 0),
                onTap: () {
                  print('Button clicked');
                },
              ),
              const SizedBox(height: 20.0),
              fAnimatedButton(
                title: 'PUSH IT',
                animationDuration: const Duration(seconds: 1),
                onTap: () {
                  print('Button clicked');
                },
              ),
              const SizedBox(height: 20.0),
              fAnimatedButton(
                title: 'PUSH IT',
                animationDuration: const Duration(seconds: 5),
                onTap: () {
                  print('Button clicked');
                },
              ),
              const SizedBox(height: 20.0),
              const fScaleAnimated(child: FlutterLogo(size: 150.0)),
              const SizedBox(height: 20.0),
              const fScaleAnimated(
                child: Text('Animated text', style: TextStyle(fontSize: 24)),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  fCircleIconButton(
                    icon: Icons.close,
                    iconColor: Colors.red,
                    onTap: () {
                      print('Close clicked');
                    },
                  ),
                  fCircleIconButton(
                    icon: Icons.done,
                    iconColor: Colors.green,
                    onTap: () {
                      print('Done clicked');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
