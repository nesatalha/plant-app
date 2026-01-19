import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/features/home/domain/entities/category.dart';
import 'package:plant_app/shared/extensions/widget_extensions.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class CategoryCardWidget extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryCardWidget({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: PAColors.homeCategoryBg,
          borderRadius: BorderRadius.circular(PADimens.px12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(PADimens.opacity005),
              blurRadius: PADimens.shadowBlurRadius10,
              offset: const Offset(0, PADimens.px2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(PADimens.px12),
                  bottomRight: Radius.circular(PADimens.px12),
                ),
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.fitWidth,
                  height: PADimens.px152,
                ),
              ),
            ),
            PAText(
              category.name,
              color: PAColors.mainTextColor,
              style: PATextStyles.medium16,
            ).padding(const EdgeInsetsDirectional.all(PADimens.px16)),
          ],
        ),
      ),
    );
  }
}
