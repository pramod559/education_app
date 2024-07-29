import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  GradientBackground({
    super.key,
    required this.child,
    required this.image,
  });

  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
