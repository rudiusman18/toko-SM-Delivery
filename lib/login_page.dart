import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';
import 'package:toko_sm_delivery/bottom_tabbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailTextController = TextEditingController(text: "");
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordTextController =
      TextEditingController(text: "");
  FocusNode passwordFocusNode = FocusNode();

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
                child: const BottomTabbar(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false);
        } else {}
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      // setState(() {
      //   isLoading = true;
      // });
      if (await authProvider.kurirLogin(
        email: emailTextController.text,
        password: passwordTextController.text,
      )) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var getData = prefs.getString("data");

        if (context.mounted) {
          // setState(() {
          //   isLoading = false;
          // });
          Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                child: const BottomTabbar(),
                type: PageTransitionType.rightToLeft,
              ),
              (route) => false);
        }
      } else {
        if (context.mounted) {
          // setState(() {
          //   isLoading = false;
          // });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              content: Text(
                'Gagal Login!',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
    }

    Widget loginForm() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email",
              style: urbanist.copyWith(
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: emailFocusNode.hasFocus ? Colors.black : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: urbanist,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 23, maxHeight: 20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.email,
                      color: Colors.grey,
                    ),
                  ),
                ),
                controller: emailTextController,
                focusNode: emailFocusNode,
                onTap: () {
                  setState(() {
                    passwordFocusNode.canRequestFocus = false;
                    emailFocusNode.canRequestFocus = true;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    emailFocusNode.canRequestFocus = false;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: urbanist.copyWith(
                fontWeight: semiBold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 5,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      passwordFocusNode.hasFocus ? Colors.black : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: urbanist,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: const EdgeInsets.all(0),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 23, maxHeight: 20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                  ),
                ),
                controller: passwordTextController,
                focusNode: passwordFocusNode,
                onTap: () {
                  setState(() {
                    emailFocusNode.canRequestFocus = false;
                    passwordFocusNode.canRequestFocus = true;
                  });
                },
                onEditingComplete: () {
                  setState(() {
                    passwordFocusNode.canRequestFocus = false;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                ),
                onPressed: () {
                  handleSignIn();
                },
                child: Text(
                  "Login",
                  style: urbanist.copyWith(
                    fontWeight: bold,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        setState(() {
          emailFocusNode.canRequestFocus = false;
          passwordFocusNode.canRequestFocus = false;
        });
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Text(
                  "Kurir",
                  style: urbanist.copyWith(
                    fontWeight: bold,
                    fontSize: 24,
                    color: green,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "Log In",
                        style: urbanist.copyWith(
                          fontSize: 40,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    Icon(
                      SolarIconsOutline.shop_2,
                      color: green,
                      size: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),

              // NOTE: LOGIN FORM
              loginForm()
            ],
          ),
        ),
      ),
    );
  }
}
