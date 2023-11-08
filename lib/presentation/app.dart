import 'package:flutter/material.dart';
import 'package:note_app/app/config/theme/theme.dart';
import 'router.dart';

class TodosApp extends StatelessWidget {
  const TodosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todos',
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      theme: AppTheme.light,
      themeMode: ThemeMode.system,
    );
  }
}
