import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12 && hour > 5) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  String _getGreetingEmoji() {
    final hour = DateTime.now().hour;
    if (hour < 12 && hour > 5) {
      return '☀️';
    } else if (hour < 17) {
      return '⛅';
    } else {
      return '🌙';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(PADimens.px20),
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(PAAssets.homeHeaderBg), fit: BoxFit.fill),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    bottom: false,
                    child: PAText(
                      'Hi, plant lover!',
                      style: PATextStyles.regular16.copyWith(
                        color: PAColors.mainTextColor,
                      ),
                    ),
                  ).padding(const EdgeInsetsDirectional.only(bottom: PADimens.px4)),
                  Row(
                    children: [
                      PAText(
                        _getGreeting(),
                        style: PATextStyles.medium24,
                        color: PAColors.mainTextColor,
                      ).padding(const EdgeInsetsDirectional.only(bottom: PADimens.px8)),
                      Text(
                        _getGreetingEmoji(),
                        style: PATextStyles.medium24,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          _buildSearchBar().padding(const EdgeInsetsDirectional.only(top: PADimens.px16)),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: PADimens.px16),
      decoration: BoxDecoration(
        color: PAColors.white.withOpacity(PADimens.opacity088),
        borderRadius: BorderRadius.circular(PADimens.px12),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search for plants',
          hintStyle: PATextStyles.regular16.copyWith(
            color: PAColors.mainTextColor.withOpacity(PADimens.opacity03),
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: PAColors.mainTextColor.withOpacity(PADimens.opacity03),
          ),
        ),
      ),
    );
  }
}
