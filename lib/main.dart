import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:toko_sm_delivery/Providers/auth_provider.dart";
import 'package:toko_sm_delivery/Providers/bottom_tabbar_provider.dart';
import "package:toko_sm_delivery/Providers/shipping_state_provider.dart";
import "package:toko_sm_delivery/login_page.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import "package:toko_sm_delivery/splash_page.dart";

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomTabbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShippingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: "Toko SM Delivery",
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('id', 'ID'),
        ],
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashPage(),
    );
  }
}
