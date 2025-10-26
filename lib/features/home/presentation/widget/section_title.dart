import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 18.sp),
        ),
        const Spacer(),
        Text(
          T.current.seeAll,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
