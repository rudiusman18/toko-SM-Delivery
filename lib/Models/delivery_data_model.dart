class DeliveryDataModel {
  String? message;
  List<DeliveryData>? data;

  DeliveryDataModel({this.message, this.data});

  DeliveryDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <DeliveryData>[];
      json['data'].forEach((v) {
        data!.add(new DeliveryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['no_resi'] = this.noResi;
    data['no_invoice'] = this.noInvoice;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['jumlah_transaksi'] = this.jumlahTransaksi;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
