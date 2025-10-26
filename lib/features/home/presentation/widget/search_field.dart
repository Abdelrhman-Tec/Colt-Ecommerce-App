import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.text,
      borderRadius: 50,
      prefixIcon: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(Icons.search_rounded),
      ),
      hintText: T.current.search,
    );
  }
}
