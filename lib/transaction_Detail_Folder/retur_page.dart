import 'package:flutter/material.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class ReturPage extends StatelessWidget {
  const ReturPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: Text(
                "Pengajuan Retur",
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            header(),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Ini adalah halaman retur",
                    ),
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
