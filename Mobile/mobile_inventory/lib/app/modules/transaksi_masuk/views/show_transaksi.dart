// detail_pasien_view.dart
import 'package:flutter/material.dart';
import 'package:mobile_inventory/app/data/transaksimasuk_model.dart';

class DetailTransaksiView extends StatelessWidget {
  final Transaksi_Masuk transaksimasuk;

  DetailTransaksiView({required this.transaksimasuk});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Transaksi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tanggal Masuk: ${transaksimasuk.tanggalMasuk}'),
            Text('Kode Barang: ${transaksimasuk.product?.kodeBarang}'),
            Text('Nama Barang: ${transaksimasuk.product?.namaBarang}'),
            Text('Jumlah Masuk: ${transaksimasuk.jumlahMasuk}'),
          ],
        ),
      ),
    );
  }
}