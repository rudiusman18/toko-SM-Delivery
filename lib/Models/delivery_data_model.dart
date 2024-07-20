class DeliveryDataModel {
  String? message;
  List<DeliveryData>? data;

  DeliveryDataModel({this.message, this.data});

  DeliveryDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DeliveryData>[];
      json['data'].forEach((v) {
        data!.add(DeliveryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DeliveryData {
  String? sId;
  String? noResi;
  List<String>? noInvoice;
  String? status;
  String? createdAt;
  int? jumlahTransaksi;
  String? date;
  String? time;

  DeliveryData(
      {this.sId,
      this.noResi,
      this.noInvoice,
      this.status,
      this.createdAt,
      this.jumlahTransaksi,
      this.date,
      this.time});

  DeliveryData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noResi = json['no_resi'];
    noInvoice = json['no_invoice'].cast<String>();
    status = json['status'];
    createdAt = json['created_at'];
    jumlahTransaksi = json['jumlah_transaksi'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['no_resi'] = noResi;
    data['no_invoice'] = noInvoice;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['jumlah_transaksi'] = jumlahTransaksi;
    data['date'] = date;
    data['time'] = time;
    return data;
  }
}
