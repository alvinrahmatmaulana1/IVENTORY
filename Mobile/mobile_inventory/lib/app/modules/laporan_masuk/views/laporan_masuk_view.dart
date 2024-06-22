import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_inventory/app/data/laporanmasuk_models.dart';
import '../controllers/laporan_masuk_controller.dart';
import 'package:intl/intl.dart';
class LaporanMasukView extends GetView<LaporanMasukController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaporanMasukView'),
        centerTitle: true,
      ),
      body: Obx(
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
                      label: Text("Jumlah Masuk",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text("Pengeluaran",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List<DataRow>.generate(
                  controller.laporan_masuk.length,
                  (index) {
                    var laporan = controller.laporan_masuk[index];
                    var nomor = index + 1;
                    var hargaFormatted =
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                            .format(laporan.pengeluaran);
                    // Misalkan struktur data LaporanMasuk memiliki properti sesuai dengan DataColumn yang ditampilkan
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text(nomor.toString())),
                        DataCell(Text(laporan.transaksiMasuk!.tanggalMasuk.toString())),
                        DataCell(Text(laporan.product!.kodeBarang.toString())),
                        DataCell(Text(laporan.product!.namaBarang.toString())),
                        DataCell(Text(laporan.transaksiMasuk != null ? laporan.transaksiMasuk!.jumlahMasuk.toString() : '-')),
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
