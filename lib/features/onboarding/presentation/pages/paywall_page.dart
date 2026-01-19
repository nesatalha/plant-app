import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_features_slider.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_logo.dart';
import 'package:plant_app/shared/widgets/pa_scaffold.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PAScaffold(
      backgroundColor: PAColors.pwGreen,
      enableDeviceBack: false,
      useSafeArea: false,
      body: Stack(
        children: [
          Image.asset(
            PAAssets.paywallPageBg,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsetsDirectional.only(end: PADimens.px20),
                  height: PADimens.px24,
                  width: PADimens.px24,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(PADimens.px24),
                    color: PAColors.black.withOpacity(0.4),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: PADimens.px14,
                    color: PAColors.white,
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          PaLogo(
                            height: 27,
                          ).padding(const EdgeInsetsDirectional.only(end: 4)),
                          PAText(
                            "Premium",
                            style: PATextStyles.light27,
                          )
                        ],
                      ).padding(
                        const EdgeInsetsDirectional.only(
                          top: PADimens.px320,
                          start: PADimens.px20,
                          end: PADimens.px20,
                        ),
                      ),
                      PAText(
                        "Access All Features",
                        style: PATextStyles.light17.copyWith(color: PAColors.white.withOpacity(0.7)),
                        textAlign: TextAlign.start,
                      ).padding(const EdgeInsetsDirectional.only(start: PADimens.px20)),
                      const OnboardingFeaturesSlider().padding(EdgeInsetsDirectional.symmetric(vertical: PADimens.px24))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
