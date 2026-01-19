import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class PaymentOptionsListWidget extends StatefulWidget {
  const PaymentOptionsListWidget({super.key});

  @override
  State<PaymentOptionsListWidget> createState() => _PaymentOptionsListWidgetState();
}

class _PaymentOptionsListWidgetState extends State<PaymentOptionsListWidget> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentOption(
          index: 0,
          title: "1 Month",
          description: r"$2.99/month, auto renewable",
          isSelected: _selectedIndex == 0,
        ),
        const SizedBox(height: PADimens.px16),
        _buildPaymentOption(
          index: 1,
          title: "1 Year",
          description: r"First 3 days free, then $529,99/year",
          isSelected: _selectedIndex == 1,
          badge: "Save 50%",
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required int index,
    required String title,
    required String description,
    required bool isSelected,
    String? badge,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: badge != null
              ? LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    PAColors.primary.withOpacity(0.24),
                    PAColors.primary.withOpacity(0.0),
                  ],
                )
              : null,
          color: badge != null && isSelected ? null : PAColors.white.withOpacity(0.05),
          border: Border.all(
            color: isSelected ? PAColors.primary : PAColors.white.withOpacity(0.3),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(PADimens.px14),
        ),
        child: badge != null && isSelected
            ? ClipRRect(
                borderRadius: BorderRadius.circular(PADimens.px14),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: _buildContent(title, description, isSelected, badge),
                ),
              )
            : _buildContent(title, description, isSelected, badge),
      ),
    );
  }

  Widget _buildContent(String title, String description, bool isSelected, String? badge) {
    return Stack(
      children: [
        Row(
          children: [
            Container(
              width: PADimens.px24,
              height: PADimens.px24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? PAColors.primary : const Color(0xFF525252),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(
                        Icons.circle,
                        size: 10,
                        color: PAColors.white,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: PADimens.px16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PAText(
                    title,
                    style: PATextStyles.bold27.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: PADimens.px4),
                  PAText(
                    description,
                    style: PATextStyles.light17.copyWith(
                      fontSize: 14,
                      color: PAColors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ).padding(const EdgeInsetsDirectional.all(PADimens.px14)),
        if (badge != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: PADimens.px12,
                vertical: PADimens.px4,
              ),
              decoration: const BoxDecoration(
                color: PAColors.primary,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(PADimens.px14),
                  bottomLeft: Radius.circular(PADimens.px14),
                ),
              ),
              child: PAText(
                badge,
                style: PATextStyles.medium16.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
