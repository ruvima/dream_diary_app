import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../core.dart';

class KSkeleton extends StatelessWidget {
  final double borderRadius;
  final double borderWidth;
  final double rightPadding;
  final double topPadding;
  final double height;
  final double width;

  const KSkeleton({
    super.key,
    this.borderRadius = 17.5,
    this.borderWidth = 0.0,
    this.height = 12.25,
    this.rightPadding = 0.0,
    this.topPadding = 0.0,
    this.width = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: EdgeInsets.only(
        top: topPadding,
        right: rightPadding,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.elegantBlue,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        direction: ShimmerDirection.ltr,
        highlightColor: AppColors.white,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.shimerSecondColor,
          ),
        ),
      ),
    );
  }
}
