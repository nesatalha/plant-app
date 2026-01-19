import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class OnboardingFeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final String icon;

  const OnboardingFeatureCard({
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(PADimens.px14),
        color: PAColors.white.withOpacity(PADimens.opacity008),
      ),
      constraints: const BoxConstraints(
        minWidth: PADimens.px160,
      ),
      padding: const EdgeInsetsDirectional.all(PADimens.px16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(color: PAColors.black.withOpacity(PADimens.opacity024)),
            width: PADimens.px36,
            child: Image.asset(icon),
          ),
          PAText(
            title,
            style: PATextStyles.medium20,
          ).padding(const EdgeInsetsDirectional.only(top: PADimens.px10)),
          PAText(
            description,
            style: PATextStyles.regular12,
            color: PAColors.white.withOpacity(PADimens.opacity07),
          ).padding(const EdgeInsetsDirectional.only(top: PADimens.px4)),
        ],
      ),
    );
  }
}
