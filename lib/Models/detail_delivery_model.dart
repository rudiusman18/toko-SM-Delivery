class DetailDeliveryModel {
  String? message;
  Data? data;

  DetailDeliveryModel({this.message, this.data});

  DetailDeliveryModel.fromJson(Map<String, dynamic> json) {
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
  String? noResi;
  List<Transaksi>? transaksi;
  List<Golongan>? golongan;

  Data({this.noResi, this.transaksi, this.golongan});

  Data.fromJson(Map<String, dynamic> json) {
    noResi = json['no_resi'];
    if (json['transaksi'] != null) {
      transaksi = <Transaksi>[];
      json['transaksi'].forEach((v) {
        transaksi!.add(new Transaksi.fromJson(v));
      });
    }
    if (json['golongan'] != null) {
      golongan = <Golongan>[];
      json['golongan'].forEach((v) {
        golongan!.add(new Golongan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no_resi'] = this.noResi;
    if (this.transaksi != null) {
      data['transaksi'] = this.transaksi!.map((v) => v.toJson()).toList();
    }
    if (this.golongan != null) {
      data['golongan'] = this.golongan!.map((v) => v.toJson()).toList();
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

class Golongan {
  String? label;
  List<GolData>? data;

  Golongan({this.label, this.data});

  Golongan.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    if (json['data'] != null) {
      data = <GolData>[];
      json['data'].forEach((v) {
        data!.add(new GolData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
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

  GolData({this.namaProduk, this.satuan, this.jumlah, this.checked});

  GolData.fromJson(Map<String, dynamic> json) {
    namaProduk = json['nama_produk'];
    satuan = json['satuan'];
    jumlah = json['jumlah'];
    checked = json['checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nama_produk'] = this.namaProduk;
    data['satuan'] = this.satuan;
    data['jumlah'] = this.jumlah;
    data['checked'] = this.checked;
    return data;
  }
}
