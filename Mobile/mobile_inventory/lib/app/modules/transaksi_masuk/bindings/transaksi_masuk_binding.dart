import 'package:get/get.dart';

import '../controllers/transaksi_masuk_controller.dart';

class TransaksiMasukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransaksiMasukController>(
      () => TransaksiMasukController(),
    );
  }
}
