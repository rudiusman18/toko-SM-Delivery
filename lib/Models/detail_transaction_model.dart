// ignore_for_file: prefer_collection_literals

class DetailTransactionModel {
  String? message;
  Data? data;

  DetailTransactionModel({this.message, this.data});

  DetailTransactionModel.fromJson(Map<String, dynamic> json) {
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
        produk!.add(Produk.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['no_invoice'] = noInvoice;
    data['pelanggan_id'] = pelangganId;
    data['nama_pelanggan'] = namaPelanggan;
    data['cabang_id'] = cabangId;
    data['kurir_id'] = kurirId;
    data['pengiriman_id'] = pengirimanId;
    data['nama_kurir'] = namaKurir;
    data['total_harga'] = totalHarga;
    data['total_ongkos_kirim'] = totalOngkosKirim;
    data['total_belanja'] = totalBelanja;
    data['metode_pembayaran'] = metodePembayaran;
    data['nama_penerima'] = namaPenerima;
    data['alamat_penerima'] = alamatPenerima;
    data['bank_transfer'] = bankTransfer;
    data['norekening_transfer'] = norekeningTransfer;
    data['jumlah_produk'] = jumlahProduk;
    data['status'] = status;
    data['keterangan_status'] = keteranganStatus;
    data['online'] = online;
    data['created_at'] = createdAt;
    if (produk != null) {
      data['produk'] = produk!.map((v) => v.toJson()).toList();
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
  dynamic golonganProduk;
  String? imageUrl;
  int? harga;
  int? jumlah;
  String? satuanProduk;
  List<dynamic>? jumlahMultisatuan;
  List<dynamic>? multisatuanJumlah;
  List<dynamic>? multisatuanUnit;
  int? totalHarga;
  String? createdAt;

  Produk({
    this.sId,
    this.noInvoice,
    this.produkId,
    this.cabangId,
    this.namaProduk,
    this.golonganProduk,
    this.imageUrl,
    this.harga,
    this.jumlah,
    this.satuanProduk,
    this.jumlahMultisatuan,
    this.multisatuanJumlah,
    this.multisatuanUnit,
    this.totalHarga,
    this.createdAt,
  });

  Produk.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    noInvoice = json['no_invoice'];
    produkId = json['produk_id'];
    cabangId = json['cabang_id'];
    namaProduk = json['nama_produk'];
    golonganProduk = json['golongan_produk'];
    imageUrl = json['image_url'];
    harga = json['harga'];
    jumlah = json['jumlah'];
    satuanProduk = json['satuan_produk'];
    jumlahMultisatuan = json['jumlah_multisatuan'];
    multisatuanJumlah = json['multisatuan_jumlah'];
    multisatuanUnit = json['multisatuan_unit'];
    totalHarga = json['total_harga'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['no_invoice'] = noInvoice;
    data['produk_id'] = produkId;
    data['cabang_id'] = cabangId;
    data['nama_produk'] = namaProduk;
    data['golongan_produk'] = golonganProduk;
    data['image_url'] = imageUrl;
    data['harga'] = harga;
    data['jumlah'] = jumlah;
    data['satuan_produk'] = satuanProduk;
    data['jumlah_multisatuan'] = jumlahMultisatuan;
    data['multisatuan_jumlah'] = multisatuanJumlah;
    data['multisatuan_unit'] = multisatuanUnit;
    data['total_harga'] = totalHarga;
    data['created_at'] = createdAt;
    return data;
  }
}
