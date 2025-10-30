// ignore_for_file: deprecated_member_use

import 'package:colt_ecommerce_app/core/generated/l10n/cubit/language_cubit.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/cubit/language_state.dart';
import 'package:colt_ecommerce_app/core/generated/l10n/l10n.dart';
import 'package:colt_ecommerce_app/core/helpers/extensions.dart';
import 'package:colt_ecommerce_app/core/helpers/spacing.dart';
import 'package:colt_ecommerce_app/core/networking/cache/cache_helper.dart';
import 'package:colt_ecommerce_app/core/widgets/custom_button.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:colt_ecommerce_app/core/routing/routes.dart';
import 'package:colt_ecommerce_app/core/theme/cubit/theme_cubit.dart';
import 'package:colt_ecommerce_app/core/theme/cubit/theme_state.dart';
import 'package:colt_ecommerce_app/features/auth/presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final cachedEmail = CacheHelper.getData(key: 'email') ?? '';
    final displayName = cachedEmail.isNotEmpty ? cachedEmail : 'User';

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            if (data == null) {
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (Route<dynamic> route) => false,
              );
            }
          },
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(message)));
          },
        );
      },
      child: Scaffold(
        backgroundColor: colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              verticalSpace(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomBackButton(),
              ),
              verticalSpace(40),
              _buildProfileAvatar(context, displayName),
              verticalSpace(16),
              Text(
                displayName,
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              verticalSpace(20),
              _buildOptionItem(
                context,
                T.current.wishlist,
                Icons.favorite_border,
                () => context.pushNamed(Routes.wishlist),
              ),
              _buildOptionItem(
                context,
                T.current.support,
                Icons.support_agent_outlined,
                () => context.pushNamed(Routes.supportScreen),
              ),
              BlocBuilder<LanguageCubit, LanguageState>(
                builder: (context, langState) {
                  return _buildOptionItem(
                    context,
                    langState.locale.languageCode == 'en'
                        ? 'Arabic'
                        : 'English',
                    Icons.language,
                    () => context.read<LanguageCubit>().toggleLanguage(),
                  );
                },
              ),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, themeState) {
                  final isDark = themeState.themeMode == ThemeMode.dark;
                  return _buildOptionItem(
                    context,
                    isDark ? T.current.lightMode : T.current.darkMode,
                    isDark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    () => context.read<ThemeCubit>().toggleTheme(),
                  );
                },
              ),
              const Spacer(),
              CustomButton(
                text: T.current.signOut,
                onPressed: () => context.read<AuthCubit>().logout(),
                width: 190.w,
                height: 60.h,
                borderRadius: 28,
                backgroundColor: Colors.red.shade600,
                textColor: Colors.white,
                elevation: 4,
                shadowColor: Colors.black.withOpacity(0.2),
                icon: Icons.logout,
                iconSize: 20,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context, String email) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    String initial = email.isNotEmpty ? email[0].toUpperCase() : "?";

    return CircleAvatar(
      radius: 40,
      backgroundColor: colorScheme.surfaceContainerHighest.withOpacity(0.6),
      child: Text(
        initial,
        style: theme.textTheme.headlineMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildOptionItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Material(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Icon(icon, color: colorScheme.primary, size: 22),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
