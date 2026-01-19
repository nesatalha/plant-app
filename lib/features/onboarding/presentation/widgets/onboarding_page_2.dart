import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                child: Image.asset(
                  PAAssets.onboardingPage2Bg,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: RichText(
                  text: const TextSpan(
                    style: PATextStyles.medium28,
                    children: [
                      TextSpan(text: "Get plant "),
                      TextSpan(
                        text: "care guides",
                        style: PATextStyles.extraBold28,
                      ),
                    ],
                  ),
                ).padding(
                    const EdgeInsetsDirectional.only(top: PADimens.px20, start: PADimens.px20, end: PADimens.px20)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
