import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Image.asset(
              PAAssets.onboardingPage1Bg,
              fit: BoxFit.scaleDown,
            ),
            RichText(
              text: const TextSpan(
                style: PATextStyles.medium28,
                children: [
                  TextSpan(text: "Take a photo to "),
                  TextSpan(
                    text: "identify\n",
                    style: PATextStyles.extraBold28,
                  ),
                  TextSpan(text: "the plant"),
                ],
              ),
            ).padding(const EdgeInsetsDirectional.only(top: PADimens.px20, start: PADimens.px20, end: PADimens.px20)),
          ],
        ),
      ],
    );
  }
}
