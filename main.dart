import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:food_app/theme/theme.dart';
import 'package:provider/provider.dart';
import 'pages/main_page.dart';
import 'models/main_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => bottom_nav()),
        ChangeNotifierProvider(create: (context) => sections_model()),
        ChangeNotifierProvider(create: (context) => food()),
        ChangeNotifierProvider(create: (context) => themes()),
      ],
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<themes>(
      builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: main_page(),
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: value.theme_data,
      ),
    );
  }
}
