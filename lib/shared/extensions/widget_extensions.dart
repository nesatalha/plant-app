import 'package:flutter/material.dart';

extension WidgetExtensions on Widget {
  Widget padding(EdgeInsetsDirectional padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }
}

