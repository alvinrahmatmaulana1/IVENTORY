import 'package:get/get.dart';

import '../controllers/transaksi_keluar_controller.dart';

class TransaksiKeluarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiKeluarController>(
      () => TransaksiKeluarController(),
    );
  }
}
