import 'package:flutter/material.dart';
import 'package:plant_app/core/constants/pa_dimens.dart';
import 'package:plant_app/features/home/domain/entities/question.dart';
import 'package:plant_app/shared/theme/pa_colors.dart';
import 'package:plant_app/shared/widgets/pa_text.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class QuestionCardWidget extends StatelessWidget {
  final Question question;
  final VoidCallback? onTap;

  const QuestionCardWidget({
    super.key,
    required this.question,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: PADimens.px10),
        decoration: BoxDecoration(
          color: PAColors.mainTextColor,
          borderRadius: BorderRadius.circular(PADimens.px12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(PADimens.px12),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  question.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: PAColors.mainTextColor,
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 48,
                      ),
                    );
                  },
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
              // Content
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(PADimens.px16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PAText(
                        question.question,
                        style: PATextStyles.medium16,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
