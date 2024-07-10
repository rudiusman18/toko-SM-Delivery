class DetailDeliveryModel {
  String? message;
  DeliveryData? data;

  DetailDeliveryModel({this.message, this.data});

  DetailDeliveryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data =
        json['data'] != null ? new DeliveryData.fromJson(json['data']) : null;
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

class DeliveryData {
  String? noResi;
  List<Transaksi>? transaksi;
  dynamic golongan;

  DeliveryData({this.noResi, this.transaksi, this.golongan});

  DeliveryData.fromJson(Map<String, dynamic> json) {
    noResi = json['no_resi'];
    if (json['transaksi'] != null) {
      transaksi = <Transaksi>[];
      json['transaksi'].forEach((v) {
        transaksi!.add(new Transaksi.fromJson(v));
      });
    }
    golongan = json['golongan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_resi'] = this.noResi;
    if (this.transaksi != null) {
      data['transaksi'] = this.transaksi!.map((v) => v.toJson()).toList();
    }
    if (this.golongan != null) {
      data['golongan'] = this.golongan!.toJson();
    }
    return data;
  }
}

class Transaksi {
  String? sId;
  String? noInvoice;
  String? namaPelanggan;
  int? jumlahProduk;
  int? status;
  String? createdAt;
  String? date;

  Transaksi(
      {this.sId,
      this.noInvoice,
      this.namaPelanggan,
      this.jumlahProduk,
      this.status,
      this.createdAt,
      this.date});

  Transaksi.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    namaPelanggan = json['nama_pelanggan'];
    jumlahProduk = json['jumlah_produk'];
    status = json['status'];
    createdAt = json['created_at'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['no_invoice'] = this.noInvoice;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['jumlah_produk'] = this.jumlahProduk;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['date'] = this.date;
    return data;
  }
}
