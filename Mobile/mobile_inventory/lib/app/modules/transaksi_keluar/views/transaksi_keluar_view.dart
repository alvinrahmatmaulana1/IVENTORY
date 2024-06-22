import 'package:mobile_inventory/app/modules/transaksi_keluar/views/show_transaksi_keluar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_inventory/app/data/transaksikeluar_model.dart';
import '../controllers/transaksi_keluar_controller.dart';

class TransaksiKeluarView extends GetView<TransaksiKeluarController> {
  final TransaksiKeluarController controller = Get.put(TransaksiKeluarController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransaksiKeluarView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/tambah-transaksi-keluar');
            },
          ),
        ]
      ),
     body: Obx(
  () => controller.transaksi_keluar.isEmpty
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
          itemCount: controller.transaksi_keluar.length,
          itemBuilder: (context, index) {
            var transaksi = controller.transaksi_keluar[index];
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
                      'Tanggal Keluar: ${transaksi.tanggalKeluar.toString()}',
                    ),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    Get.to(() => DetailTransaksikeluarView(transaksi_keluar: transaksi));
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
