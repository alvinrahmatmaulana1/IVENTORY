import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_menu_controller.dart';
import 'package:mobile_inventory/app/modules/transaksi/views/transaksi_view.dart';
import 'package:mobile_inventory/app/modules/home/views/home_view.dart';
import 'package:mobile_inventory/app/modules/barang/views/barang_view.dart';
import 'package:mobile_inventory/app/modules/laporan/views/laporan_view.dart';

class BottomMenuView extends GetView<BottomMenuController> {
  final BottomMenuController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [HomeView(), BarangView(), TransaksiView(), LaporanView()],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            controller.changePage(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.ad_units_sharp),
              label: 'Barang',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Transaksi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Laporan',
            ),
          ],
          type: BottomNavigationBarType.fixed, // Set type menjadi fixed
        ),
      ),
    );
  }
}
