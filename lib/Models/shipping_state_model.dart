class ShippingStateModel {
  String? message;
  StateData? data;

  ShippingStateModel({this.message, this.data});

  ShippingStateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new StateData.fromJson(json['data']) : null;
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

class StateData {
  Selesai? selesai;
  Selesai? proses;

  StateData({this.selesai, this.proses});

  StateData.fromJson(Map<String, dynamic> json) {
    selesai =
        json['selesai'] != null ? new Selesai.fromJson(json['selesai']) : null;
    proses =
        json['proses'] != null ? new Selesai.fromJson(json['proses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.selesai != null) {
      data['selesai'] = this.selesai!.toJson();
    }
    if (this.proses != null) {
      data['proses'] = this.proses!.toJson();
    }
    return data;
  }
}

class Selesai {
  int? pengiriman;
  int? transaksi;

  Selesai({this.pengiriman, this.transaksi});

  Selesai.fromJson(Map<String, dynamic> json) {
    pengiriman = json['pengiriman'];
    transaksi = json['transaksi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pengiriman'] = this.pengiriman;
    data['transaksi'] = this.transaksi;
    return data;
  }
}
