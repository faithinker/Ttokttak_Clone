import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:children_remote_reservation_app/feature/bottom_tab/tap_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ProviderScope(
    child: ChildRemoteReservationApp(),
  ));
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => TabScreen(),
    ),

    // GoRoute(
    //   path: '/classA',
    //   builder: (context, state) => ClassA(),
    // ),

    // GoRoute(
    //   path: '/classB',
    //   builder: (context, state) => ClassB(),
    // ),
  ],
);

class ChildRemoteReservationApp extends StatelessWidget {
  const ChildRemoteReservationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
    );
  }
}
