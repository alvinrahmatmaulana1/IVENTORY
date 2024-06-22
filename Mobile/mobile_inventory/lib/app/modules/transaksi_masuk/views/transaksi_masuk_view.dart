
import 'package:mobile_inventory/app/modules/transaksi_masuk/views/show_transaksi.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_inventory/app/data/transaksimasuk_model.dart';

import '../controllers/transaksi_masuk_controller.dart';

class TransaksiMasukView extends GetView<TransaksiMasukController> {
  final TransaksiMasukController controller = Get.put(TransaksiMasukController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransaksiMskView'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-transaksi');
            },
          ),
        ],
      ),
      body: Obx(
  () => controller.Transaksimsk.isEmpty
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount: controller.Transaksimsk.length,
          itemBuilder: (context, index) {
            var transaksi = controller.Transaksimsk[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Barang: ${transaksi.product?.namaBarang}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      'Tanggal Masuk: ${transaksi.tanggalMasuk.toString()}',
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    Get.to(() => DetailTransaksiView(transaksimasuk: transaksi));
                  },
                ),
              ),
            );
          },
        ),
)
    );
  }
}