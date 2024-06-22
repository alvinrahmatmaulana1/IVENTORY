class Laporan_Masuk {
  int? id;
  int? pengeluaran;
  String? createdAt;
  String? updatedAt;
  Product? product;
  User? user;
  TransaksiMasuk? transaksiMasuk;

  Laporan_Masuk(
      {this.id,
      this.pengeluaran,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.user,
      this.transaksiMasuk});

  Laporan_Masuk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pengeluaran = json['pengeluaran'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    transaksiMasuk = json['Transaksi_Masuk'] != null
        ? new TransaksiMasuk.fromJson(json['Transaksi_Masuk'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pengeluaran'] = this.pengeluaran;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.product != null) {
      data['Product'] = this.product!.toJson();
    }
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    if (this.transaksiMasuk != null) {
      data['Transaksi_Masuk'] = this.transaksiMasuk!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? kodeBarang;
  String? namaBarang;
  int? harga;

  Product({this.id, this.kodeBarang, this.namaBarang, this.harga});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeBarang = json['kode_barang'];
    namaBarang = json['nama_barang'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_barang'] = this.kodeBarang;
    data['nama_barang'] = this.namaBarang;
    data['harga'] = this.harga;
    return data;
  }
}

class User {
  int? id;
  String? username;

  User({this.id, this.username});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    return data;
  }
}

class TransaksiMasuk {
  int? id;
  String? tanggalMasuk;
  int? jumlahMasuk;

  TransaksiMasuk({this.id, this.tanggalMasuk, this.jumlahMasuk});

  TransaksiMasuk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggalMasuk = json['tanggal_masuk'];
    jumlahMasuk = json['jumlah_masuk'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal_masuk'] = this.tanggalMasuk;
    data['jumlah_masuk'] = this.jumlahMasuk;
    return data;
  }
}
