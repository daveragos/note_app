import 'package:flutter/material.dart';
import 'package:note_app/presentation/router.dart';

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
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green, brightness: Brightness.light)),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.green, brightness: Brightness.dark)),
      themeMode: ThemeMode.system,
    );
  }
}
