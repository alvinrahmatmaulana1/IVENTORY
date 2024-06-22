import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_inventory/app/modules/transaksi_masuk/controllers/transaksi_masuk_controller.dart';
import 'package:intl/intl.dart';

class TambahTransaksiMasuk extends StatelessWidget {
  final TransaksiMasukController controller = Get.put(TransaksiMasukController());
  final RxString tanggalMasuk = ''.obs;
  final TextEditingController kodeBarangController = TextEditingController();
  final TextEditingController jumlahMasukController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(1900), 
      lastDate: DateTime(2100)
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      tanggalMasuk.value = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Transaksi Masuk'),
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
                    Obx(() => Text(tanggalMasuk.value)),
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
              controller: jumlahMasukController,
              decoration: InputDecoration(labelText: 'Jumlah Keluar'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_validateInput()) {
                  controller.tambahTransaksi(
                    tanggalMasuk.value,
                    jumlahMasukController.text,
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
    if (tanggalMasuk.value.isEmpty ||
        kodeBarangController.text.isEmpty ||
        jumlahMasukController.text.isEmpty) {
      Get.snackbar('Error', 'Semua field harus diisi');
      return false;
    }
    return true;
  }
}
