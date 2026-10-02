import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF6D28D9));
    final fieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide.none,
    );

    return MaterialApp(
      title: 'Thanon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          border: fieldBorder,
          enabledBorder: fieldBorder,
          focusedBorder: fieldBorder.copyWith(
            borderSide: BorderSide(color: colorScheme.primary, width: 1.6),
          ),
          errorBorder: fieldBorder.copyWith(
            borderSide: BorderSide(color: colorScheme.error),
          ),
          focusedErrorBorder: fieldBorder.copyWith(
            borderSide: BorderSide(color: colorScheme.error, width: 1.6),
          ),
        ),
      ),
      // واجهة التطبيق من اليمين لليسار (عربي)
      builder: (context, child) =>
          Directionality(textDirection: TextDirection.rtl, child: child!),
      home: const LoginScreen(),
    );
  }
}
