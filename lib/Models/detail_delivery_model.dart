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
  Golongan? golongan;

  DeliveryData({this.noResi, this.transaksi, this.golongan});

  DeliveryData.fromJson(Map<String, dynamic> json) {
    noResi = json['no_resi'];
    if (json['transaksi'] != null) {
      transaksi = <Transaksi>[];
      json['transaksi'].forEach((v) {
        transaksi!.add(new Transaksi.fromJson(v));
      });
    }
    golongan = json['golongan'] != null
        ? new Golongan.fromJson(json['golongan'])
        : null;
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

class Golongan {
  List<A>? a;
  List<A>? b;
  List<A>? c;

  Golongan({this.a, this.b, this.c});

  Golongan.fromJson(Map<String, dynamic> json) {
    if (json['A'] != null) {
      a = <A>[];
      json['A'].forEach((v) {
        a!.add(new A.fromJson(v));
      });
    }
    if (json['B'] != null) {
      b = <A>[];
      json['B'].forEach((v) {
        b!.add(new A.fromJson(v));
      });
    }
    if (json['C'] != null) {
      b = <A>[];
      json['B'].forEach((v) {
        b!.add(new A.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.a != null) {
      data['A'] = this.a!.map((v) => v.toJson()).toList();
    }
    if (this.b != null) {
      data['B'] = this.b!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class A {
  String? namaProduk;
  String? satuan;
  int? jumlah;
  bool? checked;

  A({this.namaProduk, this.satuan, this.jumlah, this.checked});

  A.fromJson(Map<String, dynamic> json) {
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
