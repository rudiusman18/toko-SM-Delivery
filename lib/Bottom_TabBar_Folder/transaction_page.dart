import 'package:flutter/material.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  TextEditingController searchTextFieldController =
      TextEditingController(text: "");
  FocusNode searchTextFieldFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    Widget transactionItem({
      required String name,
      required String invoice,
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
              SolarIconsBold.billList,
              size: 35,
              color: green,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: urbanist.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        invoice,
                        style: urbanist.copyWith(
                          fontWeight: light,
                          color: Colors.grey,
                          fontSize: 12,
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            Expanded(
                child: ListView(
              children: [
                transactionItem(
                  name: "John Doe",
                  invoice: "#INV2123345",
                  totalProduct: "3 Produk",
                  date: "26 Juni 2024",
                  status: "Proses",
                ),
                transactionItem(
                  name: "tom Jerry",
                  invoice: "#INV2123345",
                  totalProduct: "3 Produk",
                  date: "26 Juni 2024",
                  status: "Proses",
                ),
                transactionItem(
                  name: "Isabella",
                  invoice: "#INV2123345",
                  totalProduct: "3 Produk",
                  date: "26 Juni 2024",
                  status: "Proses",
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
