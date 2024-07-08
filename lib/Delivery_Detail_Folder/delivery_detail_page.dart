import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class DeliveryDetailPage extends StatefulWidget {
  final String resiId;
  const DeliveryDetailPage({super.key, required this.resiId});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  List<ProductGolonganItem?> listProductGolonganA = [];
  List<ProductGolonganItem?> listProductGolonganB = [];
  List<ProductGolonganItem?> listProductGolonganC = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(widget.resiId);
    _getDetailDelivery();
  }

  void _getDetailDelivery() async {
    final shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (await shippingProvider.getDetailDeliveryData(
      id: widget.resiId,
      token: authProvider.user.token.toString(),
    )) {
      if (shippingProvider.detailDeliveryData?.data?.golongan?.a != null) {
        for (var dataA
            in shippingProvider.detailDeliveryData!.data!.golongan!.a!) {
          listProductGolonganA.add(ProductGolonganItem(
              isChecked: dataA.checked!,
              productName: dataA.namaProduk.toString(),
              totalProduct: dataA.jumlah.toString()));
        }
      }

      if (shippingProvider.detailDeliveryData?.data?.golongan?.b != null) {
        for (var dataA
            in shippingProvider.detailDeliveryData!.data!.golongan!.b!) {
          listProductGolonganB.add(ProductGolonganItem(
              isChecked: dataA.checked!,
              productName: dataA.namaProduk.toString(),
              totalProduct: dataA.jumlah.toString()));
        }
      }

      if (shippingProvider.detailDeliveryData?.data?.golongan?.c != null) {
        for (var dataA
            in shippingProvider.detailDeliveryData!.data!.golongan!.c!) {
          listProductGolonganC.add(ProductGolonganItem(
              isChecked: dataA.checked!,
              productName: dataA.namaProduk.toString(),
              totalProduct: dataA.jumlah.toString()));
        }
      }

      print(
          "Get data success ${shippingProvider.shippingState?.data.toString()}");
    } else {
      print("Data gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);

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
              text: messages.replaceFirst("Dikirim?", ""),
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
              onPressed: () {},
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
          ],
        ),
      );
    }

    Widget golonganItem({
      required String golongan,
      required List<ProductGolonganItem?> product,
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
                    "${product.length}",
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
            for (var i = 0; i < (product.length); i++) ...{
              Row(
                children: [
                  Expanded(
                    child: Text(
                      product[i]!.productName,
                      style: urbanist,
                    ),
                  ),
                  Text(
                    "${product[i]!.totalProduct} Pcs",
                    style: urbanist,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        product[i]?.isChecked = !product[i]!.isChecked;
                        print(
                            "isi produk nya adalah: ${product[i]!.isChecked}");
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color:
                            product[i]!.isChecked ? green : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: !product[i]!.isChecked
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
              const SizedBox(
                height: 10,
              ),
            },
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
                    "${shippingProvider.detailDeliveryData?.data?.transaksi!.length.toString()}",
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
            for (var i = 0;
                i <
                    (shippingProvider.detailDeliveryData?.data?.transaksi! ??
                            [])
                        .length;
                i++) ...[
              transactionItem(
                transactionName:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi![i].noInvoice}",
                date:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi![i].noInvoice}",
                invoiceNumber:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi![i].noInvoice}",
                totalProduct:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi![i].jumlahProduk}",
                index: i,
              ),
            ],
            if (listProductGolonganA.isNotEmpty) ...[
              golonganItem(
                golongan: "Golongan A",
                product: listProductGolonganA,
              ),
            ],
            if (listProductGolonganB.isNotEmpty) ...[
              golonganItem(
                golongan: "Golongan B",
                product: listProductGolonganB,
              ),
            ],
            if (listProductGolonganC.isNotEmpty) ...[
              golonganItem(
                golongan: "Golongan C",
                product: listProductGolonganC,
              ),
            ],
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
                        "Simpan Checklist",
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
                      onPressed: () {
                        print("proses dikirim ditekan");
                        _modalDialog(
                          title: "Konfirmasi Status",
                          messages:
                              "Anda yakin ingin mengubah status menjadi Dikirim?",
                        );
                      },
                      child: Text(
                        "Proses Untuk Dikirim",
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

class ProductGolonganItem {
  String productName = "";
  String totalProduct = "";
  bool isChecked = false;
  ProductGolonganItem({
    this.productName = "",
    this.totalProduct = "",
    this.isChecked = false,
  });
}
