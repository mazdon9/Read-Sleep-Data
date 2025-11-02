import 'package:flutter/material.dart';

import '../../core/constants/app_theme.dart';

/// Reusable loading widget with consistent styling
/// Shows a circular progress indicator with optional text
class LoadingWidget extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? color;

  const LoadingWidget({super.key, this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size ?? AppDimensions.loadingIndicatorSize,
          height: size ?? AppDimensions.loadingIndicatorSize,
          child: CircularProgressIndicator(
            color: color ?? AppColors.primary,
            strokeWidth: 3.0,
          ),
        ),
        if (text != null) ...[
          const SizedBox(height: AppDimensions.paddingM),
          Text(
            text!,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// Small loading indicator for inline use
class SmallLoadingWidget extends StatelessWidget {
  final Color? color;

  const SmallLoadingWidget({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.iconM,
      height: AppDimensions.iconM,
      child: CircularProgressIndicator(
        color: color ?? AppColors.primary,
        strokeWidth: 2.0,
      ),
    );
  }
}
