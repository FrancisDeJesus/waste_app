import 'package:flutter/material.dart';
import 'app_router.dart';
import 'theme.dart';
import 'state/app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const WasteApp(),
    ),
  );
}

class WasteApp extends StatelessWidget {
  const WasteApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: appTheme(),
    );
  }
}
