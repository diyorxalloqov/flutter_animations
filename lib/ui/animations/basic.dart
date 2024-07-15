
import 'package:flutter/material.dart';

class BasicAnimations extends StatefulWidget {
  const BasicAnimations({super.key});

  @override
  _BasicAnimationsState createState() => _BasicAnimationsState();
}

class _BasicAnimationsState extends State<BasicAnimations> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: AnimatedContainer(
          width: _selected ? 200.0 : 100.0,
          height: _selected ? 100.0 : 200.0,
          color: _selected ? Colors.blue : Colors.red,
          alignment:
          _selected ? Alignment.center : AlignmentDirectional.topCenter,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: FlutterLogo(size: 75),
        ),
      ),
    );
  }
}