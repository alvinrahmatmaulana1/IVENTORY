import 'package:get/get.dart';

import '../middleware/auth.dart';
import '../modules/barang/bindings/barang_binding.dart';
import '../modules/barang/views/barang_view.dart';
import '../modules/bottom_menu/bindings/bottom_menu_binding.dart';
import '../modules/bottom_menu/views/bottom_menu_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/laporan_keluar/bindings/laporan_keluar_binding.dart';
import '../modules/laporan_keluar/views/laporan_keluar_view.dart';
import '../modules/laporan_masuk/bindings/laporan_masuk_binding.dart';
import '../modules/laporan_masuk/views/laporan_masuk_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/onbording_view.dart';
import '../modules/profil/bindings/profil_binding.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';
import '../modules/transaksi_keluar/bindings/transaksi_keluar_binding.dart';
import '../modules/transaksi_keluar/views/transaksi_keluar_view.dart';
import '../modules/transaksi_masuk/bindings/transaksi_masuk_binding.dart';
import '../modules/transaksi_masuk/views/transaksi_masuk_view.dart';
import 'package:mobile_inventory/app/modules/transaksi_masuk/views/show_transaksi.dart';
import 'package:mobile_inventory/app/modules/transaksi_keluar/views/show_transaksi_keluar.dart';
import '../modules/transaksi_masuk/views/create_transaksi_masuk.dart';
import '../modules/transaksi_keluar/views/create_transaksi_keluar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        middlewares: [AuthMiddleware()]),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ONBORDING,
      page: () => const OnbordingView(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: _Paths.BARANG,
      page: () => BarangView(),
      binding: BarangBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_MASUK,
      page: () => LaporanMasukView(),
      binding: LaporanMasukBinding(),
    ),
    GetPage(
      name: _Paths.LAPORAN_KELUAR,
      page: () => LaporanKeluarView(),
      binding: LaporanKeluarBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_MASUK,
      page: () => TransaksiMasukView(),
      binding: TransaksiMasukBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI_KELUAR,
      page: () => TransaksiKeluarView(),
      binding: TransaksiKeluarBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_MENU,
      page: () => BottomMenuView(),
      binding: BottomMenuBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => const TransaksiView(),
      binding: TransaksiBinding(),
    ),
     GetPage(
      name: _Paths.DetailTransaksi,
      page: () => DetailTransaksiView(transaksimasuk: Get.arguments),
    ),
    GetPage(
      name: _Paths.DetailTransaksikeluar,
      page: () => DetailTransaksikeluarView(transaksi_keluar: Get.arguments),
    ),
    GetPage(
      name: _Paths.TambahTransaksi,
      page: () => TambahTransaksiMasuk(),
    ),
    GetPage(
      name: _Paths.TambahTransaksiKeluar,
      page: () => TambahTransaksiKeluar(),
    ),
  ];
}
