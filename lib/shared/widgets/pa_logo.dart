import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';

class PaLogo extends StatelessWidget {
  final double? height;

  const PaLogo({this.height, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      PAAssets.paLogo,
      height: height,
    );
  }
}
