import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/core/di/injection.dart' as di;
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/core/utils/shared_preferences_service.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_features_slider.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/payment_options_list_widget.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_button.dart';
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
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const PaLogo(
                            height: PADimens.px27,
                          ).padding(const EdgeInsetsDirectional.only(end: PADimens.px4)),
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
                        style: PATextStyles.light17.copyWith(color: PAColors.white.withOpacity(PADimens.opacity07)),
                        textAlign: TextAlign.start,
                      ).padding(const EdgeInsetsDirectional.only(start: PADimens.px20)),
                      const OnboardingFeaturesSlider()
                          .padding(const EdgeInsetsDirectional.symmetric(vertical: PADimens.px24)),
                      const PaymentOptionsListWidget()
                          .padding(const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px20)),
                      PAButton(
                        text: "Try free for 3 days",
                        onPressed: () {
                          di.getIt<SharedPreferencesService>().setOnboardingCompleted(true);
                          context.router.replace(const HomeRoute());
                        },
                      ).padding(
                        const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px20).copyWith(top: PADimens.px24),
                      ),
                      PAText(
                        r"After the 3-day free trial period you’ll be charged ₺274.99 per year unless you cancel before the trial expires. Yearly Subscription is Auto-Renewable",
                        style: PATextStyles.light9.copyWith(color: PAColors.white.withOpacity(PADimens.opacity052)),
                        textAlign: TextAlign.center,
                      ).padding(
                          const EdgeInsetsDirectional.symmetric(horizontal: PADimens.px20, vertical: PADimens.px10)),
                      _buildTermsAndConditionsLinks(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              bottom: false,
              child: RawMaterialButton(
                onPressed: () {
                  di.getIt<SharedPreferencesService>().setOnboardingCompleted(true);
                  context.router.replace(const HomeRoute());
                },
                elevation: PADimens.px2,
                fillColor: PAColors.black.withOpacity(PADimens.opacity04),
                constraints: const BoxConstraints(minWidth: 0.0),
                padding: const EdgeInsets.all(PADimens.px8),
                shape: const CircleBorder(),
                child: const Icon(
                  Icons.close,
                  size: PADimens.px16,
                  color: PAColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditionsLinks() {
    //TODO convert to actual links
    return SafeArea(
      top: false,
      child: PAText(
        r"Terms • Privacy • Restore",
        style: PATextStyles.regular12,
        textAlign: TextAlign.center,
        color: PAColors.white.withOpacity(PADimens.opacity05),
      ),
    );
  }
}
