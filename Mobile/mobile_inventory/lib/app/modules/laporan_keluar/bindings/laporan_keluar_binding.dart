import 'package:get/get.dart';

import '../controllers/laporan_keluar_controller.dart';

class LaporanKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LaporanKeluarController>(
      () => LaporanKeluarController(),
    );
  }
}
