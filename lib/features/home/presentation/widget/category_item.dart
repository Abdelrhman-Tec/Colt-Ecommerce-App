import 'package:cached_network_image/cached_network_image.dart';
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
        CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) =>
              CircleAvatar(radius: 26, backgroundImage: imageProvider),
          placeholder: (context, url) => CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[200],
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
          errorWidget: (context, url, error) => CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.error, size: 20),
          ),
        ),
        verticalSpace(10),
        // Category name
        SizedBox(
          width: 60.w,
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
