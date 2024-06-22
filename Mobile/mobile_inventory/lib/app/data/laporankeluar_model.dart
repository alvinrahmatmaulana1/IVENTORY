class Laporan_Keluar {
  int? id;
  int? pendapatan;
  String? createdAt;
  String? updatedAt;
  Product? product;
  User? user;
  TransaksiKeluar? transaksiKeluar;

  Laporan_Keluar(
      {this.id,
      this.pendapatan,
      this.createdAt,
      this.updatedAt,
      this.product,
      this.user,
      this.transaksiKeluar});

  Laporan_Keluar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pendapatan = json['pendapatan'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
        json['Product'] != null ? new Product.fromJson(json['Product']) : null;
    user = json['User'] != null ? new User.fromJson(json['User']) : null;
    transaksiKeluar = json['Transaksi_Keluar'] != null
        ? new TransaksiKeluar.fromJson(json['Transaksi_Keluar'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pendapatan'] = this.pendapatan;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.product != null) {
      data['Product'] = this.product!.toJson();
    }
    if (this.user != null) {
      data['User'] = this.user!.toJson();
    }
    if (this.transaksiKeluar != null) {
      data['Transaksi_Keluar'] = this.transaksiKeluar!.toJson();
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

class TransaksiKeluar {
  int? id;
  String? tanggalKeluar;
  int? jumlahKeluar;

  TransaksiKeluar({this.id, this.tanggalKeluar, this.jumlahKeluar});

  TransaksiKeluar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tanggalKeluar = json['tanggal_keluar'];
    jumlahKeluar = json['jumlah_keluar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tanggal_keluar'] = this.tanggalKeluar;
    data['jumlah_keluar'] = this.jumlahKeluar;
    return data;
  }
}
