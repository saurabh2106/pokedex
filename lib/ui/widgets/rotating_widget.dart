import 'package:flutter/material.dart';

class RotatingWidget extends StatefulWidget {
  const RotatingWidget({super.key});

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: controller.value * 2 * 3.14,
          child: Image.asset(
            'images/image4.png',
            width: 250,
            height: 250,
          ),
        );
      },
    );
  }
}
