import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';

class PAScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool enableDeviceBack;
  final bool useSafeArea;
  final Widget? bottomNavigationBar;

  const PAScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.enableDeviceBack = true,
    this.useSafeArea = true,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    Widget scaffoldBody = useSafeArea
        ? SafeArea(
            child: body,
          )
        : body;

    if (!enableDeviceBack) {
      scaffoldBody = PopScope(
        canPop: false,
        child: scaffoldBody,
      );
    }

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? PAColors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: scaffoldBody,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
