import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  final Widget child;
  final double movementFactor;

  const ParallaxWidget({required this.child, required this.movementFactor});

  @override
  Widget build(BuildContext context) { double? movement;
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          // Calculate movement based on scroll position
         movement = notification.scrollDelta! * movementFactor;
          return true;
        } else {
          return false;
        }
      },
      child: Stack(
        children: [
          Positioned(
            top: movement,
            child: child,
          ),
        ],
      ),
    );
  }
}