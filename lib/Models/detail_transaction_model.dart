class DetailTransactionModel {
  String? message;
  Data? data;

  DetailTransactionModel({this.message, this.data});

  DetailTransactionModel.fromJson(Map<String, dynamic> json) {
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
  int? pelangganId;
  String? namaPelanggan;
  int? cabangId;
  int? kurirId;
  int? pengirimanId;
  String? namaKurir;
  int? totalHarga;
  int? totalOngkosKirim;
  int? totalBelanja;
  String? metodePembayaran;
  String? namaPenerima;
  String? alamatPenerima;
  String? bankTransfer;
  String? norekeningTransfer;
  int? jumlahProduk;
  int? status;
  String? keteranganStatus;
  bool? online;
  String? createdAt;
  List<Produk>? produk;

  Data(
      {this.sId,
      this.noInvoice,
      this.pelangganId,
      this.namaPelanggan,
      this.cabangId,
      this.kurirId,
      this.pengirimanId,
      this.namaKurir,
      this.totalHarga,
      this.totalOngkosKirim,
      this.totalBelanja,
      this.metodePembayaran,
      this.namaPenerima,
      this.alamatPenerima,
      this.bankTransfer,
      this.norekeningTransfer,
      this.jumlahProduk,
      this.status,
      this.keteranganStatus,
      this.online,
      this.createdAt,
      this.produk});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    pelangganId = json['pelanggan_id'];
    namaPelanggan = json['nama_pelanggan'];
    cabangId = json['cabang_id'];
    kurirId = json['kurir_id'];
    pengirimanId = json['pengiriman_id'];
    namaKurir = json['nama_kurir'];
    totalHarga = json['total_harga'];
    totalOngkosKirim = json['total_ongkos_kirim'];
    totalBelanja = json['total_belanja'];
    metodePembayaran = json['metode_pembayaran'];
    namaPenerima = json['nama_penerima'];
    alamatPenerima = json['alamat_penerima'];
    bankTransfer = json['bank_transfer'];
    norekeningTransfer = json['norekening_transfer'];
    jumlahProduk = json['jumlah_produk'];
    status = json['status'];
    keteranganStatus = json['keterangan_status'];
    online = json['online'];
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
    data['pelanggan_id'] = this.pelangganId;
    data['nama_pelanggan'] = this.namaPelanggan;
    data['cabang_id'] = this.cabangId;
    data['kurir_id'] = this.kurirId;
    data['pengiriman_id'] = this.pengirimanId;
    data['nama_kurir'] = this.namaKurir;
    data['total_harga'] = this.totalHarga;
    data['total_ongkos_kirim'] = this.totalOngkosKirim;
    data['total_belanja'] = this.totalBelanja;
    data['metode_pembayaran'] = this.metodePembayaran;
    data['nama_penerima'] = this.namaPenerima;
    data['alamat_penerima'] = this.alamatPenerima;
    data['bank_transfer'] = this.bankTransfer;
    data['norekening_transfer'] = this.norekeningTransfer;
    data['jumlah_produk'] = this.jumlahProduk;
    data['status'] = this.status;
    data['keterangan_status'] = this.keteranganStatus;
    data['online'] = this.online;
    data['created_at'] = this.createdAt;
    if (this.produk != null) {
      data['produk'] = this.produk!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Produk {
  String? sId;
  String? noInvoice;
  int? produkId;
  int? cabangId;
  String? namaProduk;
  List<String>? golonganProduk;
  String? imageUrl;
  int? harga;
  int? jumlah;
  List<dynamic>? jumlahMultisatuan;
  List<int>? multisatuanJumlah;
  List<String>? multisatuanUnit;
  int? totalHarga;
  String? createdAt;

  Produk(
      {this.sId,
      this.noInvoice,
      this.produkId,
      this.cabangId,
      this.namaProduk,
      this.golonganProduk,
      this.imageUrl,
      this.harga,
      this.jumlah,
      this.jumlahMultisatuan,
      this.multisatuanJumlah,
      this.multisatuanUnit,
      this.totalHarga,
      this.createdAt});

  Produk.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    produkId = json['produk_id'];
    cabangId = json['cabang_id'];
    namaProduk = json['nama_produk'];
    golonganProduk = json['golongan_produk'].cast<String>();
    imageUrl = json['image_url'];
    harga = json['harga'];
    jumlah = json['jumlah'];
    jumlahMultisatuan = json['jumlah_multisatuan'];
    multisatuanJumlah = json['multisatuan_jumlah'].cast<int>();
    multisatuanUnit = json['multisatuan_unit'].cast<String>();
    totalHarga = json['total_harga'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['no_invoice'] = this.noInvoice;
    data['produk_id'] = this.produkId;
    data['cabang_id'] = this.cabangId;
    data['nama_produk'] = this.namaProduk;
    data['golongan_produk'] = this.golonganProduk;
    data['image_url'] = this.imageUrl;
    data['harga'] = this.harga;
    data['jumlah'] = this.jumlah;
    data['jumlah_multisatuan'] = this.jumlahMultisatuan;
    data['multisatuan_jumlah'] = this.multisatuanJumlah;
    data['multisatuan_unit'] = this.multisatuanUnit;
    data['total_harga'] = this.totalHarga;
    data['created_at'] = this.createdAt;
    return data;
  }
}
