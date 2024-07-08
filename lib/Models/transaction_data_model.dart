class TransationDataModel {
  String? message;
  List<TransactionData>? data;

  TransationDataModel({this.message, this.data});

  TransationDataModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <TransactionData>[];
      json['data'].forEach((v) {
        data!.add(new TransactionData.fromJson(v));
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

class TransactionData {
  String? sId;
  String? noInvoice;
  String? namaPelanggan;
  String? status;
  int? jumlahProduk;
  String? createdAt;
  String? date;
  String? time;

  TransactionData(
      {this.sId,
      this.noInvoice,
      this.namaPelanggan,
      this.status,
      this.jumlahProduk,
      this.createdAt,
      this.date,
      this.time});

  TransactionData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    namaPelanggan = json['nama_pelanggan'];
    status = json['status'];
    jumlahProduk = json['jumlah_produk'];
    createdAt = json['created_at'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['no_invoice'] = this.noInvoice;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['status'] = this.status;
    data['jumlah_produk'] = this.jumlahProduk;
    data['created_at'] = this.createdAt;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
