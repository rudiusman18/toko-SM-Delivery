import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Bottom_TabBar_Folder/delivery_page.dart';
import 'package:toko_sm_delivery/Bottom_TabBar_Folder/home_page.dart';
import 'package:toko_sm_delivery/Bottom_TabBar_Folder/transaction_page.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/bottom_tabbar_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class BottomTabbar extends StatefulWidget {
  const BottomTabbar({super.key});

  @override
  State<BottomTabbar> createState() => _BottomTabbarState();
}

class _BottomTabbarState extends State<BottomTabbar> {
  @override
  Widget build(BuildContext context) {
    BottomTabbarProvider bottomNavbarProvider =
        Provider.of<BottomTabbarProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget body() {
      switch (bottomNavbarProvider.selectedIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const DeliveryPage();
        case 2:
          return const TransactionPage();
        default:
          return const HomePage();
      }
    }

    if (authProvider.user.data.kategori?.toLowerCase() == "checker") {
      return DeliveryPage();
    } else {
      return Scaffold(
        body: body(),
        bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: urbanist,
            unselectedLabelStyle: urbanist,
            selectedItemColor: green,
            currentIndex: bottomNavbarProvider.selectedIndex,
            onTap: (index) {
              setState(() {
                bottomNavbarProvider.selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.homeAngle,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.boxMinimalistic,
                ),
                label: "Pengiriman",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  SolarIconsOutline.billList,
                ),
                label: "Transaksi",
              ),
            ]),
      );
    }
  }
}
