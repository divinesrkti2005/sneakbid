import 'package:flutter/material.dart';
import 'package:sneakbid/views/onboarding_view.dart';
import 'package:sneakbid/views/login_view.dart';
import 'package:sneakbid/views/signup_view.dart';
import 'package:sneakbid/views/dashboard_view.dart';


void main() {
  runApp(SneakBid());
}

class SneakBid extends StatelessWidget {
  const SneakBid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SneakBid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingView(),
        '/login': (context) => LoginView(),
        '/signup': (context) => SignUpView(),
        '/dashboard': (context) => DashboardView(),
      },
    );
  }
}