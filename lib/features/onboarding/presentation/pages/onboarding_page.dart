import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/core/router/app_router.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_page_1.dart';
import 'package:plant_app/features/onboarding/presentation/widgets/onboarding_page_2.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/widgets/pa_button.dart';
import 'package:plant_app/shared/widgets/pa_page_indicator.dart';
import 'package:plant_app/shared/widgets/pa_scaffold.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage != 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: PADimens.animationDurationMs),
        curve: Curves.easeInOut,
      );
    } else {
      context.router.push(const PaywallRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PAScaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                OnboardingPage1(),
                OnboardingPage2(),
              ],
            ),
          ),
          Column(
            children: [
              PAButton(
                text: 'Continue',
                onPressed: _nextPage,
              ).padding(const EdgeInsetsDirectional.only(bottom: PADimens.px16)),
              PAPageIndicator(
                currentPage: _currentPage,
                totalPages: 2,
              ),
            ],
          ).padding(const EdgeInsetsDirectional.all(PADimens.px24).copyWith(top: PADimens.px0)),
        ],
      ),
    );
  }
}
