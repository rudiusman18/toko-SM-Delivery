// lib/models/retur_information_model.dart
import 'package:toko_sm_delivery/Models/detail_transaction_model.dart';

class ReturInformationModel {
  String? message;
  Data? data;

  ReturInformationModel({this.message, this.data});

  ReturInformationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? noInvoice;
  int? pegawaiId;
  int? pelangganId;
  String? keterangan;
  int? status;
  String? createdAt;
  List<Produk>? produk;

  Data(
      {this.sId,
      this.noInvoice,
      this.pegawaiId,
      this.pelangganId,
      this.keterangan,
      this.status,
      this.createdAt,
      this.produk});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    pegawaiId = json['pegawai_id'];
    pelangganId = json['pelanggan_id'];
    keterangan = json['keterangan'];
    status = json['status'];
    createdAt = json['created_at'];
    if (json['produk'] != null) {
      produk = <Produk>[];
      json['produk'].forEach((v) {
        produk!.add(new Produk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['no_invoice'] = this.noInvoice;
    data['pegawai_id'] = this.pegawaiId;
    data['pelanggan_id'] = this.pelangganId;
    data['keterangan'] = this.keterangan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    if (this.produk != null) {
      data['produk'] = this.produk!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
