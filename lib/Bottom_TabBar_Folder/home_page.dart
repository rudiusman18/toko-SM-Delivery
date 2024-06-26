import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Lorem Dolor Sit Amet",
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
                      "Cabang Krebet",
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
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: green,
                  child: Text(
                    "Semua",
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    "Bulan Ini",
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    "Minggu Ini",
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: Text(
                    "Hari Ini",
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
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
      return Container(
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
              prosesPengirimanValue: "2",
              prossesTransaksiValue: "6",
              selesaPengirimanValue: "7",
              selesaiTransaksiValue: "8",
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
                  Text(
                    "Lihat Semua",
                    style: urbanist.copyWith(
                      fontSize: 16,
                      color: green,
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
                  for (var i = 0; i < 100; i++)
                    deliveryItem(
                      deliveryId: "12345678",
                      totalProduct: "3 transaksi",
                      time: "22:30 WIB",
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
