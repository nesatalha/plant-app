import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_feature_card.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';

class OnboardingFeaturesSlider extends StatelessWidget {
  const OnboardingFeaturesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const OnboardingFeatureCard(
            title: "Unlimited",
            description: "Plant Identify",
            icon: PAAssets.scanner,
          ).padding(const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px4).copyWith(start: PADimens.px20)),
          const OnboardingFeatureCard(
            title: "Faster",
            description: "Process",
            icon: PAAssets.scanner,
          ).padding(const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px4)),
          const OnboardingFeatureCard(
            title: "Detailed",
            description: "Plant Care",
            icon: PAAssets.scanner,
          ).padding(const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px4).copyWith(end: PADimens.px20)),
        ],
      ),
    );
  }
}
