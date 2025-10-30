import 'package:colt_ecommerce_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: CustomAppBar(title: T.current.support, showIcon: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                T.current.howCanWeHelp,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onBackground,
                ),
              ),
              SizedBox(height: 20.h),

              // FAQ Section
              Text(
                T.current.frequentlyAskedQuestions,
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: ListView(
                  children: [
                    _faqItem(
                      context,
                      T.current.howToPlaceOrder,
                      T.current.orderHelpDesc,
                    ),
                    _faqItem(
                      context,
                      T.current.paymentIssues,
                      T.current.paymentHelpDesc,
                    ),
                    _faqItem(
                      context,
                      T.current.deliveryTime,
                      T.current.deliveryHelpDesc,
                    ),
                  ],
                ),
              ),

              // Contact Buttons
              Text(T.current.contactUs, style: theme.textTheme.titleMedium),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: T.current.emailUs,
                      backgroundColor: Colors.purple.shade500,
                      textColor: Colors.white,
                      height: 55.h,
                      onPressed: () {},
                      icon: Icons.email_outlined,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomButton(
                      text: T.current.callUs,
                      backgroundColor: Colors.blue.shade300,
                      textColor: Colors.white,
                      height: 55.h,
                      onPressed: () {},
                      icon: Icons.phone_outlined,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              CustomButton(
                text: T.current.liveChat,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                height: 55.h,
                onPressed: () {},
                icon: Icons.chat_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _faqItem(BuildContext context, String question, String answer) {
    final theme = Theme.of(context);
    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: ExpansionTile(
        iconColor: theme.colorScheme.primary,
        textColor: theme.colorScheme.onSurface,
        title: Text(
          question,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(answer, style: theme.textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
