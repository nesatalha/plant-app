import 'package:flutter/material.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';

class PAPageIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Color? activeColor;
  final Color? inactiveColor;
  final double activeSize;
  final double inactiveSize;

  const PAPageIndicator({
    super.key,
    required this.currentPage,
    required this.totalPages,
    this.activeColor,
    this.inactiveColor,
    this.activeSize = 10,
    this.inactiveSize = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        double size = currentPage == index ? activeSize : inactiveSize;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: currentPage == index ? (activeColor ?? PAColors.mainTextColor) : (inactiveColor ?? PAColors.grey),
            borderRadius: BorderRadius.circular(size),
          ),
        );
      }),
    );
  }
}
