import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Untuk format uang
import 'package:mobile_inventory/app/data/barang_models.dart';
import '../controllers/barang_controller.dart';

class BarangView extends GetView<BarangController> {
  final BarangController controller = Get.put(BarangController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BarangView'),
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
                headingRowColor: MaterialStateColor.resolveWith(
                    (states) => Colors.grey[300]!),
                columns: <DataColumn>[
                  DataColumn(
                      label: SelectableText("No",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  // DataColumn(
                  //     label: SelectableText("Gambar",
                  //         style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: SelectableText("Nama Barang",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: SelectableText("Kode Barang",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  
                  DataColumn(
                      label: SelectableText("Harga",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: SelectableText("Stok",
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: List<DataRow>.generate(
                  controller.barang.length,
                  (index) {
                    var barang = controller.barang[index];
                    var nomor = index + 1;
                    var hargaFormatted =
                        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp')
                            .format(barang.harga);
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(SelectableText(nomor.toString())),
                        // DataCell(
                        //   Image.network(
                        //     barang.imageBarang!, // URL gambar dari API
                        //     loadingBuilder: (context, child, loadingProgress) {
                        //       if (loadingProgress == null) {
                        //         return child;
                        //       } else {
                        //         return CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null
                        //             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        //             : null);
                        //       }
                        //     },
                        //     errorBuilder: (context, error, stackTrace) {
                        //       return Icon(Icons.error); // Widget yang ditampilkan jika terjadi kesalahan saat mengunduh gambar
                        //     },
                        //     width: 50, // Lebar gambar
                        //     height: 50, // Tinggi gambar
                        //   ),
                        // ),
                        DataCell(SelectableText(barang.namaBarang.toString())),
                        DataCell(SelectableText(barang.kodeBarang.toString())),
                        DataCell(SelectableText(hargaFormatted)),
                        DataCell(SelectableText(barang.stok.toString())),
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
