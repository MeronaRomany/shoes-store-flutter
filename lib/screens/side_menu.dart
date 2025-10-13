import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../resources/core/config/theme/cubit_theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(microseconds: 600), // ⏱️ زمن التحريك
      curve: Curves.easeInOutCirc, // 🎞️ منحنى حركة ناعم
      color: isDark ? Colors.black : Colors.white, // 🎨
      child: Scaffold(
          backgroundColor: Colors.transparent, // 👈 نخلي الخلفية شفافة

          body:    ElevatedButton(
          onPressed: () {
            final isDarkMode = Theme.of(context).brightness == Brightness.dark;
            if (isDarkMode) {
          context.read<ThemeCubit>().updateTheme(ThemeMode.light);
        } else {
          context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
        }
      },
      child: const Text("Toggle Theme"),
      )),
    );
  }
}




