import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    _modalDialog({required String title, required String messages}) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          title: Text(
            title,
            style: urbanist.copyWith(
              fontWeight: bold,
            ),
          ),
          content: RichText(
            text: TextSpan(
              text: messages.replaceFirst("logout?", ""),
              style: urbanist.copyWith(
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: messages.split(" ").last.split("?").first,
                  style: urbanist.copyWith(
                    color: Colors.black,
                    fontWeight: bold,
                  ),
                ),
                TextSpan(
                  text: "?",
                  style: urbanist.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: green,
              ),
              onPressed: () async {},
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    Widget header() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: Text(
                "Profil",
                style: urbanist.copyWith(
                  color: Colors.black,
                  fontWeight: semiBold,
                  fontSize: 18,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ],
        ),
      );
    }

    Widget profileItem({
      required String title,
      required String value,
    }) {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: urbanist.copyWith(
                fontWeight: bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              value,
              style: urbanist,
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            header(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    width: 70,
                    height: 80,
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
                    height: 10,
                  ),
                  Text(
                    "Kurir Pusat",
                    style: urbanist.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                      color: green,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        SolarIconsOutline.mapPoint,
                        size: 15,
                      ),
                      Text(
                        "Cabang Pusat",
                        style: urbanist.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  profileItem(
                    title: "Nama Lengkap",
                    value: "Lorem Ipsum Dolor",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  profileItem(
                    title: "Nama Lengkap",
                    value: "Lorem Ipsum Dolor",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  profileItem(
                    title: "Nama Lengkap",
                    value: "Lorem Ipsum Dolor",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  profileItem(
                    title: "Nama Lengkap",
                    value: "Lorem Ipsum Dolor",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  profileItem(
                    title: "Nama Lengkap",
                    value: "Lorem Ipsum Dolor",
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _modalDialog(
                  title: "Warning",
                  messages: "Apakah anda yakin ingin melakukan logout?",
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    SolarIconsBold.power,
                    color: green,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Logout",
                    style: urbanist.copyWith(
                      color: green,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
