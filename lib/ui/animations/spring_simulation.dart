import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class PhysicsBallDemo extends StatefulWidget {
  const PhysicsBallDemo({super.key});

  @override
  _PhysicsBallDemoState createState() => _PhysicsBallDemoState();
}

class _PhysicsBallDemoState extends State<PhysicsBallDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;
  Alignment _ballAlignment = Alignment.center;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)
      ..addListener(() {
        setState(() {
          _ballAlignment = _animation.value;
        });
      });
  }

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _ballAlignment,
        end: Alignment.center,
      ),
    );

    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(mass: 1, stiffness: 500, damping: 10);

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          _ballAlignment += Alignment(
            details.delta.dx / (MediaQuery.of(context).size.width / 2),
            details.delta.dy / (MediaQuery.of(context).size.height / 2),
          );
        });
      },
      onPanEnd: (details) {
        _runAnimation(
            details.velocity.pixelsPerSecond, MediaQuery.of(context).size);
      },
      child: Scaffold(
        body: Center(
          child: Align(
            alignment: _ballAlignment,
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
