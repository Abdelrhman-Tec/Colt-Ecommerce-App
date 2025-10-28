// features/product_details/presentation/widgets/product_selectors.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductSelectors extends StatelessWidget {
  final List<String> sizes;
  final List<String> colors;
  final String selectedSize;
  final int quantity;
  final ValueChanged<String> onSizeChanged;
  final ValueChanged<int> onQuantityChanged;

  const ProductSelectors({
    super.key,
    required this.sizes,
    required this.colors,
    required this.selectedSize,
    required this.quantity,
    required this.onSizeChanged,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        _selectorRow(
          context: context,
          title: 'Size',
          child: DropdownButton<String>(
            value: (selectedSize.isNotEmpty && sizes.contains(selectedSize))
                ? selectedSize
                : (sizes.isNotEmpty ? sizes.first : null),
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(12),
            items: sizes.map((size) {
              return DropdownMenuItem(value: size, child: Text(size));
            }).toList(),
            onChanged: (value) {
              if (value != null) onSizeChanged(value);
            },
          ),
        ),
        SizedBox(height: 12.h),
        _selectorRow(
          context: context,
          title: 'Quantity',
          child: Row(
            children: [
              _qtyButton(Icons.remove, () {
                if (quantity > 1) onQuantityChanged(quantity - 1);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('$quantity', style: theme.textTheme.bodyLarge),
              ),
              _qtyButton(Icons.add, () {
                onQuantityChanged(quantity + 1);
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _selectorRow({
    required BuildContext context,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), child],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 18, color: Colors.deepPurple),
      ),
    );
  }
}
