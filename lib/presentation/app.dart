import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home/home_page.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
  ],
);

class WatchTechNowApp extends StatelessWidget {
  const WatchTechNowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Watch Tech Now',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      routerConfig: appRouter,
    );
  }
}
