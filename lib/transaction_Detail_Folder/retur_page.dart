import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Models/detail_transaction_model.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class ReturPage extends StatefulWidget {
  final List<Produk>? produk;
  const ReturPage({super.key, required this.produk});

  @override
  State<ReturPage> createState() => _ReturPageState();
}

class _ReturPageState extends State<ReturPage> {
  TextEditingController descriptionTextField = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    ShippingProvider shippingProvider = Provider.of<ShippingProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
          content: Text(
            messages,
            style: urbanist,
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
              onPressed: () async {
                if (await shippingProvider.postReturData(
                  token: authProvider.user.token ?? "",
                  pelangganId: shippingProvider
                          .detailTransactionData?.data?.pelangganId ??
                      0,
                  noInvoice: widget.produk?.first.noInvoice ?? "",
                  keterangan: descriptionTextField.text,
                  products: widget.produk ?? [],
                )) {
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Berhasil mengajukan retur',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Gagal mengajukan retur',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    Widget customtextFormField({
      required TextInputType keyboardType,
      required TextEditingController controller,
    }) {
      return Container(
        height: 100,
        margin: const EdgeInsets.only(top: 10),
        child: TextFormField(
          textInputAction: TextInputAction.newline,
          maxLines: 4,
          style: urbanist.copyWith(
            color: Colors.black,
          ),
          keyboardType: keyboardType,
          cursorColor: Colors.black,
          controller: controller,
          decoration: InputDecoration(
            hintText: "Masukkan Keterangan",
            hintStyle: urbanist.copyWith(
              color: Colors.grey,
            ),
            prefixIconColor: Colors.grey,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          ),
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

    Widget productItem({
      required Produk product,
    }) {
      List<int> removeTrailingZeros(List<int> arr) {
        while (arr.isNotEmpty && arr.last == 0) {
          arr.removeLast();
        }
        return arr;
      }

      var data = removeTrailingZeros((product.jumlahMultisatuan ?? [])
          .map((e) => int.tryParse(e.toString()) ?? 0)
          .toList());

      return Container(
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.namaProduk.toString(),
                    style: urbanist,
                  ),
                  Text(
                    "@${product.harga}",
                    style: urbanist.copyWith(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  for (var index = 0;
                      index <
                          (product.golonganProduk is List ? (data).length : 1);
                      index++) ...{
                    if ((product.golonganProduk is List) &&
                            product.jumlahMultisatuan?[index] != null ||
                        (product.golonganProduk is! List)) ...{
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              product.multisatuanUnit is List
                                  ? (product.multisatuanUnit?[index] ?? [])
                                  : product.satuanProduk,
                              style: urbanist,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                // if (detailData.returValue > 0) {
                                //   detailData.returValue -= 1;
                                // }
                                if ((product.returValue?[index] ?? 0) > 0) {
                                  setState(() {
                                    product.returValue?[index] -= 1;
                                  });
                                }
                              });
                            },
                            child: const Icon(
                              SolarIconsBold.minusSquare,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 1,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(80),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "${product.returValue?[index]}",
                              style: urbanist,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                product.returValue?[index] += 1;
                                int totalProduct = 0;

                                if (product.golonganProduk is List) {
                                  for (int i = 0;
                                      i <
                                          (product.multisatuanJumlah?.length ??
                                              0);
                                      i++) {
                                    totalProduct += (product.returValue?[i] ??
                                            0) *
                                        (int.tryParse(
                                                "${product.multisatuanJumlah?[i]}") ??
                                            0);
                                  }
                                } else {
                                  totalProduct =
                                      (product.returValue?[index] ?? 0);
                                }

                                if (totalProduct > (product.jumlah ?? 0)) {
                                  product.returValue?[index] -= 1;
                                }
                              });
                            },
                            child: Icon(
                              SolarIconsBold.addSquare,
                              color: green,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              //  (product.jumlahMultisatuan?[index]) *
                              "${(product.jumlahMultisatuan?[index] ?? "")} (isi ${(product.golonganProduk is List) ? int.tryParse("${(product.multisatuanJumlah?[index])}") ?? 0 : product.jumlah})",
                              style: urbanist,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    },
                  },
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget bottomContent() {
      return Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Keterangan",
              style: urbanist.copyWith(
                fontWeight: bold,
                color: Colors.grey,
              ),
            ),
            customtextFormField(
              keyboardType: TextInputType.multiline,
              controller: descriptionTextField,
            ),
            Row(
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Kembali",
                      style: urbanist.copyWith(
                        fontWeight: semiBold,
                        color: green,
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
                      _modalDialog(
                        title: "Konfirmasi Retur",
                        messages:
                            "Data tidak dapat diubah setelah disimpan. Anda yakin ingin menyimpannya?",
                      );
                    },
                    child: Text(
                      "Proses Retur",
                      style: urbanist.copyWith(
                        color: Colors.white,
                        fontWeight: semiBold,
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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Produk",
                            style: urbanist.copyWith(
                              fontWeight: bold,
                              fontSize: 20,
                            ),
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
                            "${(widget.produk ?? []).length}",
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
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        Text(
                          "Jml Retur",
                          style: urbanist.copyWith(
                            fontWeight: bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Jml Beli",
                          style: urbanist.copyWith(
                            fontWeight: bold,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    // NOTE: Product Item

                    for (Produk data in (widget.produk ?? [])) ...{
                      productItem(
                        product: data,
                      )
                    }
                  ],
                ),
              ),
            ),
            bottomContent(),
          ],
        ),
      ),
    );
  }
}

class ProductRetur {
  String productName = "";
  int price = 0;
  List<ProductReturData> data = [];

  ProductRetur({
    required this.productName,
    required this.price,
    required this.data,
  });
}

class ProductReturData {
  String satuan = "";
  int returValue = 0;
  int buyValue = 0;

  ProductReturData({
    required this.satuan,
    required this.returValue,
    required this.buyValue,
  });
}
