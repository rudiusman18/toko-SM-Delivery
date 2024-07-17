import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:toko_sm_delivery/Models/delivery_data_model.dart';
import 'package:toko_sm_delivery/Models/detail_delivery_model.dart';
import 'package:toko_sm_delivery/Models/detail_transaction_model.dart';
import 'package:toko_sm_delivery/Models/shipping_state_model.dart';
import 'package:toko_sm_delivery/Models/success_model.dart';
import 'package:toko_sm_delivery/Models/transaction_data_model.dart';

class ShippingService {
  String baseURL = 'http://103.127.132.116/api/v1/';

  Future<ShippingStateModel> getStateDataByTime(
      {required String time, required String token}) async {
    var url = Uri.parse("${baseURL}pengiriman/stat?time=$time");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: header);
    // ignore: avoid_print
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      ShippingStateModel storeLocateModel = ShippingStateModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Mendapatkan History");
    }
  }

  Future<TransationDataModel> getTransactionData(
      {required String query,
      required String date,
      required String token}) async {
    var url =
        Uri.parse("${baseURL}pengiriman/transaksi?q=$query&tanggal=$date");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: header);
    // ignore: avoid_print
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      TransationDataModel storeLocateModel = TransationDataModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Mendapatkan Data Transaksi");
    }
  }

  Future<DeliveryDataModel> getDeliveryData(
      {required String query,
      required String page,
      required String date,
      required String token}) async {
    var url = Uri.parse(
        "${baseURL}pengiriman/data?q=$query&limit=&page=$page&tanggal=$date");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: header);
    // ignore: avoid_print
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      DeliveryDataModel storeLocateModel = DeliveryDataModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Mendapatkan Data Delivery");
    }
  }

  Future<DetailDeliveryModel> getDetailDeliveryData(
      {required String id, required String token}) async {
    var url = Uri.parse("${baseURL}pengiriman/detail/${id}");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: header);
    // ignore: avoid_print
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      DetailDeliveryModel storeLocateModel = DetailDeliveryModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Mendapatkan Data Delivery");
    }
  }

  Future<DetailTransactionModel> getDetailTransaction(
      {required String id, required String token}) async {
    var url = Uri.parse("${baseURL}transaksi/detail/$id");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var response = await http.get(url, headers: header);
    // ignore: avoid_print
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      DetailTransactionModel storeLocateModel =
          DetailTransactionModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Mendapatkan Data Delivery");
    }
  }

  Future<SuccessModel> postTransactionData(
      {required Map<String, dynamic> data, required String token}) async {
    var url = Uri.parse("${baseURL}transaksi/status");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var body = jsonEncode(data);
    var response = await http.post(url, headers: header, body: body);
    // ignore: avoid_print
    print("State Data By Time: ${body}");
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      SuccessModel storeLocateModel = SuccessModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Memperbarui data");
    }
  }

  Future<SuccessModel> postPaymentData(
      {required Map<String, dynamic> data, required String token}) async {
    var url = Uri.parse("${baseURL}transaksi/metodepembayaran");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    var body = jsonEncode(data);
    var response = await http.post(url, headers: header, body: body);
    // ignore: avoid_print
    print("State Data By Time: ${body}");
    print("State Data By Time: ${url}");
    print("State Data By Time: ${response.body}");
    // **success melakukan login
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      SuccessModel storeLocateModel = SuccessModel.fromJson(data);
      return storeLocateModel;
    } else {
      throw Exception("Gagal Memperbarui data");
    }
  }

  Future<Map<String, dynamic>> postDetailDelivery({
    required String token,
    required String noResi,
    required int status,
    required Map<String, List<bool>> golongan,
  }) async {
    var url = Uri.parse("${baseURL}pengiriman/data");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    Map data = {
      'no_resi': noResi,
      'status': status,
      'golongan': golongan,
    };
    var body = jsonEncode(data);
    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Gagal melakukan postDelivery");
    }
  }

  Future<Map<String, dynamic>> postReturTransaction({
    required String token,
    required String noInvoice,
    required String keterangan,
    required List<Produk> products,
  }) async {
    var url = Uri.parse("${baseURL}pengiriman/data");
    var header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    Map data = {
      'no_invoice': noInvoice,
      'keterangan': keterangan,
      'produk': generateProducts(initProducts: products),
    };
    var body = jsonEncode(data);
    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Gagal melakukan postDelivery");
    }
  }

  List<Map<String, dynamic>> generateProducts(
      {required List<Produk> initProducts}) {
    // Create a list to hold the dynamic products
    List<Map<String, dynamic>> products = [];

    // Convert Product objects to Map and add them to the list
    for (Produk product in initProducts) {
      products.add({
        "id": "${product.sId}",
        "produk_id": "${product.produkId}",
        "nama_produk": "${product.namaProduk}",
        "jumlah": "${product.jumlah}",
        "jumlah_multisatuan": product.jumlahMultisatuan
      });
    }

    return products;
  }
}
