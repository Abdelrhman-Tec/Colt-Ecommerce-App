import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const CategoryItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 26, backgroundImage: AssetImage(imageUrl)),
        verticalSpace(10),
        Text(
          maxLines: 1,
          textAlign: TextAlign.center,
          name,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
