import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showIcon;
  const CustomAppBar({super.key, required this.title, required this.showIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showIcon ? CustomBackButton() : SizedBox.shrink(),
          const Spacer(),
          Center(
            child: Text(title, style: Theme.of(context).textTheme.displaySmall),
          ),
          showIcon ? horizontalSpace(20) : horizontalSpace(0),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
