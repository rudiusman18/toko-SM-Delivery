import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:toko_sm_delivery/Bottom_TabBar_Folder/delivery_page.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';
import 'package:toko_sm_delivery/bottom_tabbar.dart';
import 'package:toko_sm_delivery/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    Future.delayed(const Duration(seconds: 1), () async {
      var data = await authProvider.getLoginData();
      if (context.mounted) {
        if (data?.token != null) {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: BottomTabbar(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: const LoginPage(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: green,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo-tokosm.png",
              scale: 2,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
