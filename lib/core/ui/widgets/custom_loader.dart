import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double size;

  const CustomLoader({super.key, this.color, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingGrid(color: color ?? Colors.white, size: size),
    );
  }
}
