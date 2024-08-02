// ignore_for_file: prefer_collection_literals

class DetailDeliveryModel {
  String? message;
  Data? data;

  DetailDeliveryModel({this.message, this.data});

  DetailDeliveryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? noResi;
  int? status;
  List<Transaksi>? transaksi;
  List<Golongan>? golongan;

  Data({this.noResi, this.transaksi, this.golongan});

  Data.fromJson(Map<String, dynamic> json) {
    noResi = json['no_resi'];
    status = json['status'];
    if (json['transaksi'] != null) {
      transaksi = <Transaksi>[];
      json['transaksi'].forEach((v) {
        transaksi!.add(Transaksi.fromJson(v));
      });
    }
    if (json['golongan'] != null) {
      golongan = <Golongan>[];
      json['golongan'].forEach((v) {
        golongan!.add(Golongan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['no_resi'] = noResi;
    data['status'] = status;
    if (transaksi != null) {
      data['transaksi'] = transaksi!.map((v) => v.toJson()).toList();
    }
    if (golongan != null) {
      data['golongan'] = golongan!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['no_invoice'] = noInvoice;
    data['nama_pelanggan'] = namaPelanggan;
    data['jumlah_produk'] = jumlahProduk;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['date'] = date;
    return data;
  }
}

class Golongan {
  String? label;
  List<GolData>? data;

  Golongan({this.label, this.data});

  Golongan.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['data'] != null) {
      data = <GolData>[];
      json['data'].forEach((v) {
        data!.add(GolData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['label'] = label;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GolData {
  String? namaProduk;
  String? satuan;
  int? jumlah;
  bool? checked;
  int? produkId;

  GolData({this.namaProduk, this.satuan, this.jumlah, this.checked});

  GolData.fromJson(Map<String, dynamic> json) {
    namaProduk = json['nama_produk'];
    satuan = json['satuan'];
    jumlah = json['jumlah'];
    checked = json['checked'];
    produkId = json['produk_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['nama_produk'] = namaProduk;
    data['satuan'] = satuan;
    data['jumlah'] = jumlah;
    data['checked'] = checked;
    data['produk_id'] = produkId;
    return data;
  }
}
