import 'package:animation_example/ui/animations/animated_builder.dart';
import 'package:animation_example/ui/animations/basic.dart';
import 'package:animation_example/ui/animations/hero.dart';
import 'package:animation_example/ui/animations/spring_simulation.dart';
import 'package:animation_example/ui/animations/transition.dart';
import 'package:animation_example/ui/animations/tween.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animations')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BasicAnimations())),
              child: const Text('BasicAnimations')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Transition())),
              child: const Text('Transition')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TweenAnimation())),
              child: const Text('TweenAnimation')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedBuilderDemo())),
              child: const Text('AnimatedBuilderDemo')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HeroAnimations())),
              child: const Text('HeroAnimations')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PhysicsBallDemo())),
              child: const Text('PhysicsBallDemo')),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
