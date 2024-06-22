// detail_pasien_view.dart
import 'package:flutter/material.dart';
import 'package:mobile_inventory/app/data/transaksikeluar_model.dart';

class DetailTransaksikeluarView extends StatelessWidget {
  final Transaksi_Keluar transaksi_keluar;

  DetailTransaksikeluarView({required this.transaksi_keluar});

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
            Text('Tanggal Keluar: ${transaksi_keluar.tanggalKeluar}'),
            Text('Kode Barang: ${transaksi_keluar.product?.kodeBarang}'),
            Text('Nama Barang: ${transaksi_keluar.product?.namaBarang}'),
            Text('Jumlah Masuk: ${transaksi_keluar.jumlahKeluar}'),
          ],
        ),
      ),
    );
  }
}