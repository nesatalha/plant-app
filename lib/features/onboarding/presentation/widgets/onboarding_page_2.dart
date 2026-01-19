import 'package:flutter/material.dart';
import 'package:plant_app/shared/widgets/pa_text_styles.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDFFFE),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 46),
            RichText(
              text: TextSpan(
                style: PATextStyles.medium28,
                children: [
                  const TextSpan(text: 'Take a photo to '),
                  TextSpan(
                    text: 'identify',
                    style: PATextStyles.extraBold28,
                  ),
                  const TextSpan(text: '\nthe plant!'),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
