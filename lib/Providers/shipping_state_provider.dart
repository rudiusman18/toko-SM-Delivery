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
  }) async {
    try {
      ShippingStateModel data = await ShippingService().getStateDataByTime(
          time: time,
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInBlZ2F3YWlfa2F0ZWdvcmlfaWQiOjcsImphZHdhbF9rZXJqYV9pZCI6MSwiY2FiYW5nX2lkIjoxLCJndWRhbmdfaWQiOm51bGwsImJhZ2lhbiI6InBlbmdpcmltYW4iLCJ1c2VybmFtZSI6Imt1cmlycHVzYXQiLCJwYXNzd29yZCI6IiQyYiQxMCRyTGQ1ZXRnSzNWZS9oOUFyc3NPMTUuTXNOVlgzV2pVU1hueHNZVm5XNzVuZjJmVS5uZzFaUyIsImVtYWlsIjoia3VyaXIxQGdtYWlsLmNvbSIsIm5hbWFfbGVuZ2thcCI6Ikt1cmlyIFB1c2F0IiwibmFtYV9kZXBhbiI6Ikt1cmlyIiwibmFtYV9iZWxha2FuZyI6IlB1c2F0IiwidGVscCI6IjA4MTIzMjQzNDIzNCIsImFsYW1hdCI6Ik1hbGFuZyIsImZvdG8iOm51bGwsInJvbGVzIjpudWxsLCJpc19zdXBlcmFkbWluIjowLCJzdGF0dXMiOjEsImNyZWF0ZWRfYXQiOiIyMDI0LTAzLTE5IDEwOjUxOjExIiwidXBkYXRlZF9hdCI6IjIwMjQtMDYtMjkgMTY6NDY6MjYiLCJuYW1hX2NhYmFuZyI6IlB1c2F0IiwiaWF0IjoxNzIwMTAwMjEyfQ.3NGdMal3ua8-WKalhH70m9qylim55Xxn8LbvotCDE2Q");
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
  }) async {
    try {
      TransationDataModel data = await ShippingService().getTransactionData(
          date: date,
          query: query,
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInBlZ2F3YWlfa2F0ZWdvcmlfaWQiOjcsImphZHdhbF9rZXJqYV9pZCI6MSwiY2FiYW5nX2lkIjoxLCJndWRhbmdfaWQiOm51bGwsImJhZ2lhbiI6InBlbmdpcmltYW4iLCJ1c2VybmFtZSI6Imt1cmlycHVzYXQiLCJwYXNzd29yZCI6IiQyYiQxMCRyTGQ1ZXRnSzNWZS9oOUFyc3NPMTUuTXNOVlgzV2pVU1hueHNZVm5XNzVuZjJmVS5uZzFaUyIsImVtYWlsIjoia3VyaXIxQGdtYWlsLmNvbSIsIm5hbWFfbGVuZ2thcCI6Ikt1cmlyIFB1c2F0IiwibmFtYV9kZXBhbiI6Ikt1cmlyIiwibmFtYV9iZWxha2FuZyI6IlB1c2F0IiwidGVscCI6IjA4MTIzMjQzNDIzNCIsImFsYW1hdCI6Ik1hbGFuZyIsImZvdG8iOm51bGwsInJvbGVzIjpudWxsLCJpc19zdXBlcmFkbWluIjowLCJzdGF0dXMiOjEsImNyZWF0ZWRfYXQiOiIyMDI0LTAzLTE5IDEwOjUxOjExIiwidXBkYXRlZF9hdCI6IjIwMjQtMDYtMjkgMTY6NDY6MjYiLCJuYW1hX2NhYmFuZyI6IlB1c2F0IiwiaWF0IjoxNzIwMTAwMjEyfQ.3NGdMal3ua8-WKalhH70m9qylim55Xxn8LbvotCDE2Q");
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
      required String page}) async {
    try {
      DeliveryDataModel data = await ShippingService().getDeliveryData(
          query: query,
          page: page,
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsInBlZ2F3YWlfa2F0ZWdvcmlfaWQiOjcsImphZHdhbF9rZXJqYV9pZCI6MSwiY2FiYW5nX2lkIjoxLCJndWRhbmdfaWQiOm51bGwsImJhZ2lhbiI6InBlbmdpcmltYW4iLCJ1c2VybmFtZSI6Imt1cmlycHVzYXQiLCJwYXNzd29yZCI6IiQyYiQxMCRyTGQ1ZXRnSzNWZS9oOUFyc3NPMTUuTXNOVlgzV2pVU1hueHNZVm5XNzVuZjJmVS5uZzFaUyIsImVtYWlsIjoia3VyaXIxQGdtYWlsLmNvbSIsIm5hbWFfbGVuZ2thcCI6Ikt1cmlyIFB1c2F0IiwibmFtYV9kZXBhbiI6Ikt1cmlyIiwibmFtYV9iZWxha2FuZyI6IlB1c2F0IiwidGVscCI6IjA4MTIzMjQzNDIzNCIsImFsYW1hdCI6Ik1hbGFuZyIsImZvdG8iOm51bGwsInJvbGVzIjpudWxsLCJpc19zdXBlcmFkbWluIjowLCJzdGF0dXMiOjEsImNyZWF0ZWRfYXQiOiIyMDI0LTAzLTE5IDEwOjUxOjExIiwidXBkYXRlZF9hdCI6IjIwMjQtMDYtMjkgMTY6NDY6MjYiLCJuYW1hX2NhYmFuZyI6IlB1c2F0IiwiaWF0IjoxNzIwMTAwMjEyfQ.3NGdMal3ua8-WKalhH70m9qylim55Xxn8LbvotCDE2Q");
      deliveryData = data; // Set data
      print("Store Location :  ${data.data.toString()}");
      return true;
    } catch (e) {
      print("Error : $e");
      return false;
    }
  }
}
