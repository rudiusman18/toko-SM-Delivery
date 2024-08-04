import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solar_icons/solar_icons.dart';
import 'package:toko_sm_delivery/Models/detail_delivery_model.dart';
import 'package:toko_sm_delivery/Providers/auth_provider.dart';
import 'package:toko_sm_delivery/Providers/shipping_state_provider.dart';
import 'package:toko_sm_delivery/Utils/loading.dart';
import 'package:toko_sm_delivery/Utils/theme.dart';

class DeliveryDetailPage extends StatefulWidget {
  final String resiId;
  const DeliveryDetailPage({super.key, required this.resiId});

  @override
  State<DeliveryDetailPage> createState() => _DeliveryDetailPageState();
}

class _DeliveryDetailPageState extends State<DeliveryDetailPage> {
  Map<String, List<bool>> mapGolongan = {};
  String selectedInvoice = "";

  @override
  void initState() {
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
      print(
          "Get data success ${shippingProvider.detailDeliveryData!.data?.golongan.toString()}");

      for (var data in shippingProvider.detailDeliveryData!.data!.golongan!) {
        print("Golongan : ${data.label}");
        print("Golongan : ${data.data}");
      }
    } else {
      print("Data gagal");
    }
  }

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
              onPressed: () async {
                if (shippingProvider.detailDeliveryData?.data?.status == 1) {
                  await shippingProvider.postDoneDelivery(
                    token: authProvider.user.token ?? "",
                    noResi:
                        shippingProvider.detailDeliveryData?.data?.noResi ?? "",
                  );
                } else {
                  await shippingProvider.postSendDelivery(
                    token: authProvider.user.token ?? "",
                    noResi:
                        shippingProvider.detailDeliveryData?.data?.noResi ?? "",
                  );
                }

                Navigator.pop(context);
                if (shippingProvider.detailDeliveryData?.data?.status == 1) {
                  Navigator.pop(context);
                }
                _getDetailDelivery();
              },
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

    Future<void> revisiModalDialog({
      required String noResi,
      required List<String> noInvoice,
      required String namaProduk,
      required int produkId,
      required int jumlah,
      required String satuan,
      required String golongan,
    }) {
      selectedInvoice = noInvoice.first;
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Revisi \"$namaProduk\"',
              style: urbanist.copyWith(
                fontWeight: bold,
              ),
            ),
            content: StatefulBuilder(
              builder: (BuildContext context, StateSetter stateSetter) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        value: selectedInvoice == ""
                            ? noInvoice.first
                            : selectedInvoice, // Current selected item
                        isExpanded:
                            true, // Make the dropdown expand to the width of the container
                        hint: const Text(
                            'Select an item'), // Hint text when no item is selected
                        items: noInvoice.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: urbanist,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          stateSetter(() {
                            selectedInvoice =
                                newValue ?? ""; // Update the selected item
                          });
                        },
                        underline:
                            const SizedBox(), // Remove the default underline
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            "Jumlah $satuan",
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                stateSetter(() {
                                  if (jumlah > 0) {
                                    jumlah -= 1;
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
                                "${jumlah}",
                                style: urbanist,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              onTap: () {
                                stateSetter(() {
                                  jumlah += 1;
                                });
                              },
                              child: Icon(
                                SolarIconsBold.addSquare,
                                color: green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withAlpha(99),
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  'Batal',
                  style: urbanist.copyWith(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: green,
                ),
                child: Text(
                  'OK',
                  style: urbanist,
                ),
                onPressed: () async {
                  Loading();
                  if (await shippingProvider.postCheckRevision(
                    token: authProvider.user.token ?? "",
                    noResi: noResi,
                    noInvoice: selectedInvoice,
                    productId: produkId,
                    jumlah: jumlah,
                    satuan: satuan,
                    golongan: golongan,
                  )) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Data berhasil disimpan',
                        style: urbanist,
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Gagal mengirim data revisi',
                        style: urbanist,
                      ),
                      duration: const Duration(seconds: 1),
                    ));
                  }
                },
              ),
            ],
          );
        },
      );
    }

    Widget golonganItem({
      required String golongan,
      required List<GolData>? product,
    }) {
      // if (mapGolongan.isEmpty) {
      if (mapGolongan.keys.length !=
          (shippingProvider.detailDeliveryData?.data?.golongan ?? []).length) {
        mapGolongan[golongan] = [
          for (var i = 0; i < (product?.length ?? 0); i++)
            product?[i].checked ?? false,
        ];
      }

      // }

      return Column(
        children: [
          Container(
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
                        "${product?.length}",
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
                for (var i = 0; i < (product?.length ?? 0); i++) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (shippingProvider
                                    .detailDeliveryData?.data?.status ==
                                0) {
                              product?[i].checked = !product[i].checked!;
                              mapGolongan[golongan]?[i] =
                                  product?[i].checked ?? false;

                              print(
                                  "isi mapgolongan njing: ${mapGolongan} dengan golongan $golongan");
                              print(
                                  "isi produk nya adalah: ${product?[i].checked}");
                              print(
                                  "isi produk nya adalah: ${product?[i].toJson()}");
                            }
                          });
                        },
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${product?[i].namaProduk}",
                                  style: urbanist,
                                ),
                              ),
                              authProvider.user.data.kategori?.toLowerCase() ==
                                      "kurir"
                                  ? SizedBox()
                                  : Expanded(
                                      child: TextButton(
                                        onPressed: () {
                                          revisiModalDialog(
                                            noResi: shippingProvider
                                                    .detailDeliveryData
                                                    ?.data
                                                    ?.noResi ??
                                                "",
                                            namaProduk:
                                                "${product?[i].namaProduk}",
                                            jumlah: product?[i].jumlah ?? 0,
                                            satuan: product?[i].satuan ?? "",
                                            produkId: product?[i].produkId ?? 0,
                                            golongan: golongan,
                                            noInvoice: shippingProvider
                                                    .detailDeliveryData
                                                    ?.data
                                                    ?.transaksi
                                                    ?.map((e) =>
                                                        e.noInvoice.toString())
                                                    .toList() ??
                                                [],
                                          ).then((_) {
                                            _getDetailDelivery();
                                          });
                                        },
                                        child: Text(
                                          "Revisi",
                                          style: urbanist,
                                        ),
                                      ),
                                    ),
                              Expanded(
                                child: Text(
                                  "${product?[i].jumlah} ${product?[i].satuan}",
                                  style: urbanist,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              if (authProvider.user.data.kategori
                                      ?.toLowerCase() ==
                                  "checker") ...{
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (shippingProvider.detailDeliveryData
                                              ?.data?.status ==
                                          0) {
                                        product[i].checked =
                                            !product[i].checked!;
                                        mapGolongan[golongan]?[i] =
                                            product[i].checked ?? false;

                                        print(
                                            "isi mapgolongan njing: ${mapGolongan}");
                                        print(
                                            "isi produk nya adalah: ${product[i].checked}");
                                        print(
                                            "isi produk nya adalah: ${product[i].toJson()}");
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: product![i].checked!
                                          ? green
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 1,
                                        color: !product[i].checked!
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
                              },
                            ],
                          ),
                        ),
                      ),
                      if (authProvider.user.data.kategori?.toLowerCase() ==
                          "checker") ...{
                        for (Revisi data in (product?[i].revisi ?? [])) ...{
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 24,
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Revisi\t\t\t\t\t${data.noInvoice}\t\t\t\t\t${data.jumlah} ${product?[i].satuan}\t\t\t\t\t",
                                    style: urbanist.copyWith(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                Icon(
                                  data.confirm == true
                                      ? SolarIconsBold.addCircle
                                      : SolarIconsBold.minusCircle,
                                  color: data.confirm == true ? green : yellow,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        }
                      },
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
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
                    "${shippingProvider.detailDeliveryData?.data?.transaksi?[i].namaPelanggan}",
                date:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi?[i].date}",
                invoiceNumber:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi?[i].noInvoice}",
                totalProduct:
                    "${shippingProvider.detailDeliveryData?.data?.transaksi?[i].jumlahProduk}",
                index: i,
              ),
            ],
            Text(
              "Golongan",
              style: urbanist.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (shippingProvider.detailDeliveryData != null) ...[
              for (var data
                  in (shippingProvider.detailDeliveryData?.data?.golongan ??
                      [])) ...[
                golonganItem(
                  golongan: "${data.label}",
                  product: data.data,
                ),
              ],
            ],
          ],
        ),
      );
    }

    print(
        "statusnya saat ini adalah ${shippingProvider.detailDeliveryData?.data?.status}");
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
                  if (shippingProvider.detailDeliveryData?.data?.status == 0 &&
                      authProvider.user.data.kategori?.toLowerCase() ==
                          "checker") ...{
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
                        onPressed: () async {
                          await shippingProvider.postDeliveryData(
                            token: authProvider.user.token ?? "",
                            noResi: shippingProvider
                                    .detailDeliveryData?.data?.noResi ??
                                "",
                            golongan: mapGolongan,
                          );
                          setState(() {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                'Data berhasil disimpan',
                                style: urbanist,
                              ),
                              duration: const Duration(seconds: 1),
                            ));
                          });
                        },
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
                  },
                  if (shippingProvider.detailDeliveryData?.data?.status != 2 &&
                      authProvider.user.data.kategori?.toLowerCase() ==
                          "kurir") ...{
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
                          shippingProvider.detailDeliveryData?.data?.status == 1
                              ? "Selesai"
                              : "Proses Untuk Dikirim",
                          style: urbanist.copyWith(
                            color: Colors.white,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  },
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
