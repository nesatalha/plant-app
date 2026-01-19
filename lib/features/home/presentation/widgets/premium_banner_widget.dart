import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

abstract class _Constants {
  static const Color gradientColorStart = Color(0xFFE5C990);
  static const Color gradientColorEnd = Color(0xFFE4B046);
}

class PremiumBannerWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const PremiumBannerWidget({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: PADimens.px16, vertical: PADimens.px12)
            .copyWith(right: PADimens.px10),
        decoration: BoxDecoration(
          color: PAColors.homePremiumBannerBg,
          borderRadius: BorderRadius.circular(PADimens.px12),
        ),
        child: Row(
          children: [
            Image.asset(
              PAAssets.homePremiumBannerMessageLogo,
              width: PADimens.px40,
              height: PADimens.px40,
              fit: BoxFit.fill,
            ).padding(const EdgeInsetsDirectional.only(end: PADimens.px12)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGradientText(
                    'FREE Premium Available',
                    gradient: const LinearGradient(
                      colors: [
                        _Constants.gradientColorStart,
                        _Constants.gradientColorEnd,
                      ],
                    ),
                    style: PATextStyles.semibold16,
                  ),
                  _buildGradientText(
                    'Tap to upgrade your account!',
                    gradient: const LinearGradient(
                      colors: [
                        _Constants.gradientColorStart,
                        _Constants.gradientColorEnd,
                      ],
                    ),
                    style: PATextStyles.regular12.copyWith(color: PAColors.mainTextColor),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: _Constants.gradientColorStart,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientText(String text, {required Gradient gradient, required TextStyle style}) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
