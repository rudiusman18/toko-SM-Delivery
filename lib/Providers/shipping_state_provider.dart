import 'package:flutter/material.dart';
import 'package:toko_sm_delivery/Models/delivery_data_model.dart';
import 'package:toko_sm_delivery/Models/shipping_state_model.dart';
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
}
