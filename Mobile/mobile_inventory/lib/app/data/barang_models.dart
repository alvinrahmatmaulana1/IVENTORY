class Barang {
  int? id;
  String? kodeBarang;
  String? imageBarang;
  String? namaBarang;
  int? harga;
  int? stok;
  String? createdAt;
  String? updatedAt;

  Barang(
      {this.id,
      this.kodeBarang,
      this.imageBarang,
      this.namaBarang,
      this.harga,
      this.stok,
      this.createdAt,
      this.updatedAt});

  Barang.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeBarang = json['kode_barang'];
    imageBarang = json['image_barang'];
    namaBarang = json['nama_barang'];
    harga = json['harga'];
    stok = json['stok'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kode_barang'] = this.kodeBarang;
    data['image_barang'] = this.imageBarang;
    data['nama_barang'] = this.namaBarang;
    data['harga'] = this.harga;
    data['stok'] = this.stok;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
