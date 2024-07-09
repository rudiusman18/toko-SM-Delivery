import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:toko_sm_delivery/Models/delivery_data_model.dart';
import 'package:toko_sm_delivery/Models/detail_delivery_model.dart';
import 'package:toko_sm_delivery/Models/detail_transaction_model.dart';
import 'package:toko_sm_delivery/Models/shipping_state_model.dart';
import 'package:toko_sm_delivery/Models/success_model.dart';
import 'package:toko_sm_delivery/Models/transaction_data_model.dart';
import 'package:toko_sm_delivery/Services/shipping_service.dart';

class ShippingProvider with ChangeNotifier {
  // Shipping Home State Model
  ShippingStateModel? _shippingState;

  ShippingStateModel? get shippingState => _shippingState;

  set shippingState(ShippingStateModel? shippingState) {
    _shippingState = shippingState;
    notifyListeners();
  }

  Future<bool> getStateDataByTime({
    required String time,
    required String token,
  }) async {
    try {
      ShippingStateModel data =
          await ShippingService().getStateDataByTime(time: time, token: token);
      shippingState = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Transaction data Model
  TransationDataModel? _transactionData;

  TransationDataModel? get transactionData => _transactionData;

  set transactionData(TransationDataModel? transactionData) {
    _transactionData = transactionData;
    notifyListeners();
  }

  Future<bool> getTransactionData({
    required String date,
    required String query,
    required String token,
  }) async {
    try {
      TransationDataModel data = await ShippingService().getTransactionData(
        date: date,
        query: query,
        token: token,
      );
      transactionData = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Delivery data Model
  DeliveryDataModel? _deliveryData;

  DeliveryDataModel? get deliveryData => _deliveryData;

  set deliveryData(DeliveryDataModel? deliveryData) {
    _deliveryData = deliveryData;
    notifyListeners();
  }

  Future<bool> getDeliveryData(
      {required String date,
      required String query,
      required String page,
      required String token}) async {
    try {
      DeliveryDataModel data = await ShippingService()
          .getDeliveryData(query: query, page: page, date: date, token: token);
      deliveryData = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Delivery data Model
  DetailDeliveryModel? _detailDeliveryData;

  DetailDeliveryModel? get detailDeliveryData => _detailDeliveryData;

  set detailDeliveryData(DetailDeliveryModel? deliveryData) {
    _detailDeliveryData = deliveryData;
    notifyListeners();
  }

  Future<bool> getDetailDeliveryData(
      {required String id, required String token}) async {
    try {
      DetailDeliveryModel data =
          await ShippingService().getDetailDeliveryData(id: id, token: token);
      detailDeliveryData = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Delivery data Model
  DetailTransactionModel? _detailTransactionData;

  DetailTransactionModel? get detailTransactionData => _detailTransactionData;

  set detailTransactionData(DetailTransactionModel? deliveryData) {
    _detailTransactionData = deliveryData;
    notifyListeners();
  }

  Future<bool> getDetailTransactionData(
      {required String id, required String token}) async {
    try {
      DetailTransactionModel data =
          await ShippingService().getDetailTransaction(id: id, token: token);
      detailTransactionData = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Delivery data Model
  SuccessModel? _postTransaction;

  SuccessModel? get postTransaction => _postTransaction;

  set postTransaction(SuccessModel? deliveryData) {
    _postTransaction = deliveryData;
    notifyListeners();
  }

  Future<bool> postTransactionData(
      {required Map<String, dynamic> data, required String token}) async {
    try {
      SuccessModel datas =
          await ShippingService().postTransactionData(data: data, token: token);
      postTransaction = datas; // Set data
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }

  // Delivery data Model
  SuccessModel? _postPayment;

  SuccessModel? get postPayment => _postPayment;

  set postPayment(SuccessModel? deliveryData) {
    _postPayment = deliveryData;
    notifyListeners();
  }

  Future<bool> postPaymentData(
      {required Map<String, dynamic> data, required String token}) async {
    try {
      SuccessModel datas =
          await ShippingService().postPaymentData(data: data, token: token);
      postTransaction = datas; // Set data
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }
}
