import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/historical_places/presentation/screens/not_found_screen.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 4,
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: appRoutes,
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}