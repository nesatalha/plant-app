import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class PAButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? backgroundColor;

  const PAButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: PADimens.px16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PADimens.borderRadius12),
          ),
          backgroundColor: backgroundColor ?? PAColors.primary,
        ),
        child: isLoading
            ? const SizedBox(
                height: PADimens.px20,
                width: PADimens.px20,
                child: CircularProgressIndicator(
                  strokeWidth: PADimens.px2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : PAText(
                text,
                style: PATextStyles.semibold16,
                color: PAColors.white,
              ),
      ),
    );
  }
}
