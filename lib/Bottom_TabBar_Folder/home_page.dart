import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Delivery_Detail_Folder/delivery_detail_page.dart';
import 'package:toko_sm_delivery/Models/delivery_data_model.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/bottom_tabbar_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';
import 'package:page_transition/page_transition.dart';
import 'package:toko_sm_delivery/bottom_tabbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var filterSelectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _getTransactionHistoryByTime();

    _getDeliveryHistory();
  }

  void _getTransactionHistoryByTime() async {
    // setState(() {
    //   isLoading = true;
    // });

    var time = "all";
    final shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    switch (filterSelectedIndex) {
      case 0:
        // do something
        time = "day";
        break;
      case 1:
        // do something else
        time = "week";
        break;
      case 2:
        // do something else
        time = "month";
        break;
      case 3:
        // do something else
        time = "all";
        break;
      default:
        time = "day";
        break;
    }

    print("Melakukan load data dengan time : $time");

    if (await shippingProvider.getStateDataByTime(
      time: time,
      token: authProvider.user.token.toString(),
    )) {
      print(
          "Get data success ${shippingProvider.shippingState?.data.toString()}");
    } else {
      print("Data gagal");
    }
  }

  void _getDeliveryHistory() async {
    final shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (await shippingProvider.getDeliveryData(
      date: "",
      query: "",
      page: "1",
      token: authProvider.user.token.toString(),
    )) {
      print(
          "Get data success ${shippingProvider.shippingState?.data.toString()}");
    } else {
      print("Data gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    BottomTabbarProvider bottomTabbarProvider =
        Provider.of<BottomTabbarProvider>(context);

    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Text(
                "UI",
                style: urbanist.copyWith(
                  color: Colors.white,
                  fontWeight: bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authProvider.user.data.namaLengkap.toString(),
                  style: urbanist.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      SolarIconsOutline.mapPoint,
                      size: 15,
                    ),
                    Text(
                      "Cabang ${authProvider.user.data.namaCabang}",
                      style: urbanist.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            const Icon(
              SolarIconsBold.user,
              size: 35,
            ),
          ],
        ),
      );
    }

    Widget filter() {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        // padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    filterSelectedIndex = 0;
                    _getTransactionHistoryByTime();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color:
                        filterSelectedIndex == 0 ? green : Colors.transparent,
                    child: Text(
                      "Hari Ini",
                      style: urbanist.copyWith(
                        fontWeight: semiBold,
                        color: filterSelectedIndex == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    filterSelectedIndex = 1;
                    _getTransactionHistoryByTime();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color:
                        filterSelectedIndex == 1 ? green : Colors.transparent,
                    child: Text(
                      "Minggu Ini",
                      style: urbanist.copyWith(
                        fontWeight: semiBold,
                        color: filterSelectedIndex == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    filterSelectedIndex = 2;
                    _getTransactionHistoryByTime();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color:
                        filterSelectedIndex == 2 ? green : Colors.transparent,
                    child: Text(
                      "Bulan Ini",
                      style: urbanist.copyWith(
                        fontWeight: semiBold,
                        color: filterSelectedIndex == 2
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    filterSelectedIndex = 3;
                    _getTransactionHistoryByTime();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color:
                        filterSelectedIndex == 3 ? green : Colors.transparent,
                    child: Text(
                      "Semua",
                      style: urbanist.copyWith(
                        fontWeight: semiBold,
                        color: filterSelectedIndex == 3
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget report({
      required String selesaPengirimanValue,
      required String selesaiTransaksiValue,
      required String prosesPengirimanValue,
      required String prossesTransaksiValue,
    }) {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(95),
                          blurRadius: 10,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengiriman",
                          style: urbanist.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          selesaPengirimanValue,
                          style: urbanist.copyWith(
                            fontSize: 72,
                            color: green,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(95),
                          blurRadius: 10,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaksi",
                          style: urbanist.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          selesaiTransaksiValue,
                          style: urbanist.copyWith(
                            fontSize: 72,
                            color: green,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(95),
                          blurRadius: 10,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pengiriman",
                              style: urbanist.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          prosesPengirimanValue,
                          style: urbanist.copyWith(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(95),
                          blurRadius: 10,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transaksi",
                              style: urbanist.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          prossesTransaksiValue,
                          style: urbanist.copyWith(
                            fontSize: 72,
                            color: Colors.white,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget deliveryItem({
      required String deliveryId,
      required String totalProduct,
      required String time,
    }) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: DeliveryDetailPage(
                resiId: deliveryId,
              ),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withAlpha(95),
                blurRadius: 10,
                offset: const Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                SolarIconsBold.delivery,
                size: 35,
                color: Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deliveryId,
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    totalProduct,
                    style: urbanist.copyWith(
                      fontWeight: light,
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                time,
                style: urbanist.copyWith(
                  fontWeight: light,
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            header(),
            const SizedBox(
              height: 30,
            ),
            filter(),
            const SizedBox(
              height: 20,
            ),
            report(
              prosesPengirimanValue:
                  "${shippingProvider.shippingState?.data!.proses!.pengiriman ?? 0}",
              prossesTransaksiValue:
                  "${shippingProvider.shippingState?.data!.proses!.transaksi ?? 0}",
              selesaPengirimanValue:
                  "${shippingProvider.shippingState?.data!.selesai!.pengiriman ?? 0}",
              selesaiTransaksiValue:
                  "${shippingProvider.shippingState?.data!.selesai!.transaksi ?? 0}",
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pengiriman Hari Ini",
                    style: urbanist.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      bottomTabbarProvider.selectedIndex = 2;
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                            child: const BottomTabbar(),
                            type: PageTransitionType.leftToRight,
                          ));
                    },
                    child: Text(
                      "Lihat Semua",
                      style: urbanist.copyWith(
                        fontSize: 16,
                        color: green,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  for (DeliveryData i
                      in shippingProvider.deliveryData?.data ?? []) ...[
                    deliveryItem(
                      deliveryId: i.noResi.toString(),
                      totalProduct: "${i.jumlahTransaksi} transaksi",
                      time: "${i.time} WIB",
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
