import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_button.dart';
import 'package:plant_app/shared/widgets/pa_scaffold.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PAScaffold(
      useSafeArea: true,
      enableDeviceBack: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(PAAssets.welcomePageBg),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const PAText(
                      'Welcome to PlantApp',
                      style: PATextStyles.bold28,
                    ).padding(
                        const EdgeInsetsDirectional.only(top: PADimens.px8, start: PADimens.px20, end: PADimens.px20)),
                    PAText(
                      'Identify more than 3000+ plants and 88% accuracy.',
                      style: PATextStyles.regular16,
                    ).padding(const EdgeInsetsDirectional.only(top: PADimens.px8, start: PADimens.px20, end: PADimens.px20)),
                  ],
                ),
              ],
            ),
          ),
          PAButton(
            text: 'Get Started',
            onPressed: () {
              context.router.push(const OnboardingRoute());
            },
          ).padding(
            const EdgeInsetsDirectional.only(
              start: PADimens.px20,
              top: PADimens.px24,
              end: PADimens.px20,
              bottom: PADimens.px16,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: PATextStyles.regular12.copyWith(color: PAColors.termsAndConditionsGrey),
              children: [
                const TextSpan(text: 'By tapping next, you are agreeing to PlantID\n'),
                TextSpan(
                  text: 'Terms of Use',
                  style: PATextStyles.regular12.copyWith(
                    decoration: TextDecoration.underline,
                    color: PAColors.termsAndConditionsGrey,
                  ),
                ),
                const TextSpan(text: ' & '),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: PATextStyles.regular12.copyWith(
                    decoration: TextDecoration.underline,
                    color: PAColors.termsAndConditionsGrey,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Handle Privacy Policy tap
                    },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
