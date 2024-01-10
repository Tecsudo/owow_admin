import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'src/provider/temp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CampaignProvider>(
            create: (_) => CampaignProvider()),
        ChangeNotifierProvider<DiscountProvider>(
            create: (_) => DiscountProvider()),
        ChangeNotifierProvider<FeedbackProvider>(
            create: (_) => FeedbackProvider()),
        // Provider<TempProvider>(
        //   create: (_) => TempProvider(),
        // ),
      ],
      child: MaterialApp.router(
        title: 'O wOW!',
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown
          },
        ),
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 451, end: 930, name: TABLET),
            const Breakpoint(start: 931, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: routerConfig,
      ),
    );
  }
}
