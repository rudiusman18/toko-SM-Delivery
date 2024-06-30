import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:toko_sm_delivery/Providers/bottom_tabbar_provider.dart';
import "package:toko_sm_delivery/bottom_tabbar.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomTabbarProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          body: BottomTabbar(),
        ),
      ),
    );
  }
}
