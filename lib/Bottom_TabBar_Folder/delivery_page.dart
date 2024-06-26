import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  TextEditingController searchTextFieldController =
      TextEditingController(text: "");
  FocusNode searchTextFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Widget searchBar() {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        child: TextFormField(
          onChanged: (value) {
            setState(() {});
          },
          textInputAction: TextInputAction.search,
          controller: searchTextFieldController,
          cursorColor: green,
          focusNode: searchTextFieldFocusNode,
          onFieldSubmitted: (_) {},
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            hintText: "Cari",
            hintStyle: urbanist,
            suffixIcon: const Icon(
              SolarIconsOutline.minimalisticMagnifier,
            ),
            suffixIconColor:
                searchTextFieldFocusNode.hasFocus ? green : Colors.grey,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: green, width: 2.0),
              borderRadius: const BorderRadius.all(Radius.circular(7.0)),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7.0)),
            ),
          ),
        ),
      );
    }

    Widget deliveryItem({
      required String deliveryId,
      required String totalProduct,
      required String date,
      required String status,
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
            Icon(
              SolarIconsBold.delivery,
              size: 35,
              color: green,
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
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        date,
                        style: urbanist.copyWith(
                          fontWeight: light,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color:
                              status.toLowerCase() == "proses" ? yellow : green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          status,
                          style: urbanist.copyWith(
                            fontWeight: semiBold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
            searchBar(),
            Expanded(
              child: ListView(
                children: [
                  deliveryItem(
                    deliveryId: "12345678",
                    totalProduct: "3 transaksi",
                    date: "26 Juni 2024",
                    status: "Proses",
                  ),
                  deliveryItem(
                    deliveryId: "12345678",
                    totalProduct: "3 transaksi",
                    date: "26 Juni 2024",
                    status: "Selesai",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
