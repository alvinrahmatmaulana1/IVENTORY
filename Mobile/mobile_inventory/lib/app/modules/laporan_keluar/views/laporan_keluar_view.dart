import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_inventory/app/data/laporankeluar_model.dart';

import '../controllers/laporan_keluar_controller.dart';

class LaporanKeluarView extends GetView<LaporanKeluarController> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanKeluarView'),
        centerTitle: true,
      ),
      body:Obx(
        () {
          if (controller.isLoggedIn.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.grey[300]!),
                columns: <DataColumn>[
                  DataColumn(
                      label: Text("No",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Tanggal Masuk",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Kode Barang",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Nama Barang",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Jumlah Keluar",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Pendapatan",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List<DataRow>.generate(
                  controller.laporan_keluar.length,
                  (index) {
                    var laporan = controller.laporan_keluar[index];
                    var nomor = index + 1;
                    var hargaFormatted =
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                            .format(laporan.pendapatan);
                    // Misalkan struktur data LaporanMasuk memiliki properti sesuai dengan DataColumn yang ditampilkan
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(nomor.toString())),
                        DataCell(Text(laporan.transaksiKeluar!.tanggalKeluar.toString())),
                        DataCell(Text(laporan.product!.kodeBarang.toString())),
                        DataCell(Text(laporan.product!.namaBarang.toString())),
                        DataCell(Text(laporan.transaksiKeluar != null ? laporan.transaksiKeluar!.jumlahKeluar.toString() : '-')),
                        DataCell(Text(hargaFormatted)),
                      ],
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
