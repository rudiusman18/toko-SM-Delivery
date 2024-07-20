import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Models/detail_transaction_model.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class ReturInformationPage extends StatefulWidget {
  final String noInvoice = "";
  const ReturInformationPage({super.key, required});

  @override
  State<ReturInformationPage> createState() => _ReturInformationPageState();
}

class _ReturInformationPageState extends State<ReturInformationPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getReturData();
  }

  _getReturData() async {
    ShippingProvider shippingProvider =
        Provider.of<ShippingProvider>(context, listen: false);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await shippingProvider.getReturInformation(
        token: authProvider.user.token ?? "",
        noInvoice:
            shippingProvider.detailTransactionData?.data?.noInvoice ?? "");
  }

  @override
  Widget build(BuildContext context) {
    ShippingProvider shippingProvider = Provider.of(context);
    Widget header() {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Stack(
          children: [
            Center(
              child: Text(
                "Informasi Retur",
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

    Widget productItem({
      required String? productName,
      required String price,
      required List<dynamic>? totalProduct,
      required List<dynamic> multiSatuan,
    }) {
      // var listTotalProduct = totalProduct.split("/");
      print(
          "isi multisatuan adalah: $productName dengan ${multiSatuan} dengan $totalProduct");
      return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    productName.toString(),
                    style: urbanist,
                  ),
                ),
                Text(
                  "@ Rp $price",
                  style: urbanist.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (multiSatuan.isNotEmpty && totalProduct!.isNotEmpty) ...[
              for (var i = 0; i < multiSatuan.length; i++) ...[
                if (totalProduct[i] != 0)
                  Text(
                    "${totalProduct[i]} ${multiSatuan[i]}",
                    style: urbanist.copyWith(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
              ]
            ],
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      );
    }

    print(
        "Jumlah objek nya adalah: ${(shippingProvider.returInformationModel?.data?.produk ?? []).length}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            header(),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Keterangan",
                      style: urbanist.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Text(
                      "${(shippingProvider.returInformationModel?.data?.keterangan?.isEmpty ?? true) ? "Tidak Ada Keterangan" : shippingProvider.returInformationModel?.data?.keterangan}",
                      style: urbanist,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Produk",
                      style: urbanist.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (var i = 0;
                      i <
                          (shippingProvider
                                      .returInformationModel?.data?.produk ??
                                  [])
                              .length;
                      i++) ...[
                    productItem(
                      productName: shippingProvider
                          .returInformationModel?.data?.produk![i].namaProduk
                          .toString(),
                      price:
                          "${shippingProvider.returInformationModel?.data?.produk![i].harga.toString()}",
                      totalProduct: (shippingProvider.returInformationModel
                                      ?.data?.produk![i].jumlahMultisatuan ??
                                  [])
                              .isEmpty
                          ? [
                              shippingProvider.returInformationModel?.data
                                  ?.produk![i].jumlah
                            ]
                          : shippingProvider.returInformationModel?.data
                              ?.produk![i].jumlahMultisatuan,
                      multiSatuan: (shippingProvider.returInformationModel?.data
                                      ?.produk![i].multisatuanUnit ??
                                  [])
                              .isEmpty
                          ? [
                              shippingProvider.returInformationModel?.data
                                  ?.produk![i].satuanProduk
                            ]
                          : shippingProvider.returInformationModel?.data
                                  ?.produk![i].multisatuanUnit ??
                              [],
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
