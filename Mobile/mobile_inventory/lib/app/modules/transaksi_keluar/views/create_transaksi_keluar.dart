import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_inventory/app/modules/transaksi_keluar/controllers/transaksi_keluar_controller.dart';
import 'package:intl/intl.dart';

class TambahTransaksiKeluar extends StatelessWidget {
  final TransaksiKeluarController controller = Get.put(TransaksiKeluarController());
  final RxString tanggalKeluar = ''.obs;
  final TextEditingController kodeBarangController = TextEditingController();
  final TextEditingController jumlahKeluarController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100)
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      tanggalKeluar.value = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi Keluar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () => selectDate(context),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Tanggal keluar',
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Obx(() => Text(tanggalKeluar.value)),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: kodeBarangController,
              decoration: InputDecoration(labelText: 'Kode Barang'),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: jumlahKeluarController,
              decoration: InputDecoration(labelText: 'Jumlah Keluar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.tambahTransaksikeluar(
                    tanggalKeluar.value,
                    jumlahKeluarController.text,
                    kodeBarangController.text,
                  );
                }
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }

  bool _validateInput() {
    if (tanggalKeluar.value.isEmpty ||
        kodeBarangController.text.isEmpty ||
        jumlahKeluarController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
