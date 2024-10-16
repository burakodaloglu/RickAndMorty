import 'package:flutter/material.dart';

class DecoratedBackground extends StatelessWidget {
  final Widget topChild;
  final Widget child;
  const DecoratedBackground(
      {super.key, required this.topChild, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-image.jpg'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          topChild,
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(50),
                ),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}