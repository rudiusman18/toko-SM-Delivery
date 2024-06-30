import 'package:flutter/material.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class DeliveryDetailPage extends StatefulWidget {
  const DeliveryDetailPage({super.key});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  var listTransactionStatus = [];
  var listGolonganProduct = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < 2; i++) {
      listTransactionStatus.add(0);
      listGolonganProduct.add(true);
    }

    Widget header() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: Text(
                "Detail pengiriman",
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

    Widget transactionItem({
      required String transactionName,
      required String date,
      required String invoiceNumber,
      required String totalProduct,
      required int index,
    }) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transactionName,
                  style: urbanist.copyWith(
                    fontWeight: light,
                  ),
                ),
                Text(
                  date,
                  style: urbanist.copyWith(
                    fontWeight: light,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  invoiceNumber,
                  style: urbanist.copyWith(
                    fontWeight: light,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "$totalProduct produk",
                  style: urbanist.copyWith(
                    fontWeight: light,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
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
                          setState(() {
                            listTransactionStatus[index] = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: listTransactionStatus[index] == 0
                              ? green
                              : Colors.transparent,
                          child: Text(
                            "Diproses",
                            style: urbanist.copyWith(
                              fontWeight: semiBold,
                              color: listTransactionStatus[index] == 0
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
                          setState(() {
                            listTransactionStatus[index] = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: listTransactionStatus[index] == 1
                              ? green
                              : Colors.transparent,
                          child: Text(
                            "Dikirim",
                            style: urbanist.copyWith(
                              fontWeight: semiBold,
                              color: listTransactionStatus[index] == 1
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
                          setState(() {
                            listTransactionStatus[index] = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.center,
                          color: listTransactionStatus[index] == 2
                              ? green
                              : Colors.transparent,
                          child: Text(
                            "Diterima",
                            style: urbanist.copyWith(
                              fontWeight: semiBold,
                              color: listTransactionStatus[index] == 2
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
            ),
          ],
        ),
      );
    }

    Widget golonganItem({
      required String golongan,
      required String productName,
      required String totalProduct,
      required int index,
    }) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  golongan,
                  style: urbanist.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                index != 0
                    ? const SizedBox()
                    : Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "2",
                          style: urbanist.copyWith(
                            fontWeight: semiBold,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      productName,
                      style: urbanist,
                    ),
                    Text(
                      "$totalProduct Produk",
                      style: urbanist,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      listGolonganProduct[index] = !listGolonganProduct[index];
                    });
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: listGolonganProduct[index]
                          ? green
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: !listGolonganProduct[index]
                            ? Colors.grey
                            : Colors.transparent,
                      ),
                    ),
                    child: const FittedBox(
                      fit: BoxFit.cover,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Transaksi",
                  style: urbanist.copyWith(
                    fontSize: 18,
                    fontWeight: semiBold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: yellow,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "3",
                    style: urbanist.copyWith(
                      fontWeight: semiBold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            for (var i = 0; i < 2; i++) ...{
              transactionItem(
                transactionName: "Lorem Ipsum",
                date: "30 Jun 2024",
                invoiceNumber: "#INV12312312",
                totalProduct: "3",
                index: i,
              ),
            },
            for (var i = 0; i < 2; i++) ...{
              golonganItem(
                golongan: "Golongan A",
                productName: "Produk A",
                totalProduct: "3",
                index: i,
              ),
            }
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
              child: content(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(
                          color: green,
                          width: 1,
                        ), // Border color
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Selesai",
                        style: urbanist.copyWith(
                          color: green,
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Simpan",
                        style: urbanist.copyWith(
                          fontWeight: semiBold,
                        ),
                      ),
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
