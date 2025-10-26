import 'package:colt_ecommerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CartButton extends StatelessWidget {
  final int itemCount;
  const CartButton({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.primary,
          child: SvgPicture.asset("asset/icon/shop_icon.svg", width: 20.w),
        ),
        if (itemCount > 0)
          Positioned(
            left: 24,
            top: 3,
            child: Container(
              width: 15,
              height: 15,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "$itemCount",
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall?.copyWith(fontSize: 10.sp),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
