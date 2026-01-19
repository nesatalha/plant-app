import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/assets.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class HomeBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.none,
      child: Container(
        height: PADimens.px108,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(PADimens.opacity005),
              blurRadius: PADimens.shadowBlurRadius10,
              offset: const Offset(0, PADimens.shadowOffsetY2),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.eco,
                  label: 'Home',
                  index: 0,
                  isActive: currentIndex == 0,
                ),
                _buildNavItem(
                  icon: Icons.shield,
                  label: 'Diagnose',
                  index: 1,
                  isActive: currentIndex == 1,
                ),
                const SizedBox(width: PADimens.px33),
                _buildNavItem(
                  icon: Icons.local_florist,
                  label: 'My Garden',
                  index: 2,
                  isActive: currentIndex == 2,
                ),
                _buildNavItem(
                  icon: Icons.person,
                  label: 'Profile',
                  index: 3,
                  isActive: currentIndex == 3,
                ),
              ],
            ),
            Positioned(
              top: -PADimens.px33,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () => onTap(4),
                child: Container(
                  width: PADimens.px66,
                  height: PADimens.px66,
                  decoration: BoxDecoration(
                    color: PAColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(width: PADimens.px4, color: PAColors.primaryLight),
                    boxShadow: [
                      BoxShadow(
                        color: PAColors.primary.withOpacity(PADimens.opacity03),
                        blurRadius: PADimens.shadowBlurRadius15,
                        offset: const Offset(0, PADimens.shadowOffsetY4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    PAAssets.scanner,
                    height: PADimens.px24,
                    width: PADimens.px24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
    required bool isActive,
  }) {
    final color = isActive ? PAColors.primary : Colors.grey;

    return SafeArea(
      top: false,
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
              size: PADimens.iconSize24,
            ),
            const SizedBox(height: PADimens.px4),
            PAText(
              label,
              style: PATextStyles.regular16.copyWith(
                fontSize: PADimens.fontSize12,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
