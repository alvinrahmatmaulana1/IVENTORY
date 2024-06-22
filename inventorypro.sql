-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Bulan Mei 2024 pada 10.59
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventorypro`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `blacklists`
--

CREATE TABLE `blacklists` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `blacklists`
--

INSERT INTO `blacklists` (`id`, `token`, `createdAt`, `updatedAt`) VALUES
(1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyVG9rZW4iOnsiaWQiOjMsInVzZXJuYW1lIjoiZGltYXMifSwiaWF0IjoxNzA4MjUzNjY2LCJleHAiOjE3MDgyNTcyNjZ9.kuQBQ1qO2V6LiKQSGfZPywqcChS_wV2HYzLFDrTh89k', '2024-02-18 11:03:14', '2024-02-18 11:03:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_keluars`
--

CREATE TABLE `laporan_keluars` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `transaksi_keluars_id` int(11) DEFAULT NULL,
  `pendapatan` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan_keluars`
--

INSERT INTO `laporan_keluars` (`id`, `products_id`, `users_id`, `transaksi_keluars_id`, `pendapatan`, `createdAt`, `updatedAt`) VALUES
(1, 18, 31, 26, 2100000, '2024-04-25 01:04:09', '2024-04-25 01:04:09'),
(2, 18, 32, 27, 1050000, '2024-04-25 01:14:17', '2024-04-25 01:14:17'),
(3, 18, 31, 28, 26250000, '2024-04-26 03:33:17', '2024-04-26 03:33:17'),
(4, 18, 32, 29, 420000, '2024-04-29 02:49:47', '2024-04-29 02:49:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `laporan_masuks`
--

CREATE TABLE `laporan_masuks` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  `transaksi_masuks_id` int(11) DEFAULT NULL,
  `pengeluaran` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `laporan_masuks`
--

INSERT INTO `laporan_masuks` (`id`, `products_id`, `users_id`, `transaksi_masuks_id`, `pengeluaran`, `createdAt`, `updatedAt`) VALUES
(1, 18, 31, 74, 1050000, '2024-04-25 01:02:28', '2024-04-25 01:02:28'),
(2, 18, 31, 75, 1050000, '2024-04-25 01:03:24', '2024-04-25 01:03:24'),
(3, 18, 32, 76, 1050000, '2024-04-25 01:12:08', '2024-04-25 01:12:08'),
(4, 12, 32, 77, 480000, '2024-04-25 13:42:58', '2024-04-25 13:42:58'),
(5, 18, 31, 78, 21000000, '2024-04-26 03:32:40', '2024-04-26 03:32:40'),
(6, 18, 32, 79, 1050000, '2024-04-29 02:48:33', '2024-04-29 02:48:33'),
(7, 16, 31, 80, 250000, '2024-04-29 04:10:06', '2024-04-29 04:10:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikases`
--

CREATE TABLE `notifikases` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `tanggal_notifikasi` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `notifikases`
--

INSERT INTO `notifikases` (`id`, `products_id`, `pesan`, `tanggal_notifikasi`, `createdAt`, `updatedAt`) VALUES
(12, 18, 'Barang 3Second Kids Hoodie sudah hampir habis', '2024-04-26 00:00:00', '2024-04-26 03:33:17', '2024-04-26 03:33:17'),
(13, 18, 'Barang 3Second Kids Hoodie sudah hampir habis', '2024-04-30 00:00:00', '2024-04-29 02:49:47', '2024-04-29 02:49:47');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(255) NOT NULL,
  `image_barang` varchar(255) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `kode_barang`, `image_barang`, `nama_barang`, `harga`, `stok`, `createdAt`, `updatedAt`) VALUES
(12, 'd955c7e7-5868-4ec2-a0ba-473300e195e6', '/uploads/produk/Breakside.jpg', 'Breakside Hoodie', 160000, 43, '2024-04-25 00:23:12', '2024-04-25 13:42:57'),
(13, '7cd2d693-f376-4203-a085-16113d684da1', '/uploads/produk/Tozicozy2.jpg', 'Tozicozy Edge Hoodie', 220000, 40, '2024-04-25 00:31:37', '2024-04-25 00:31:37'),
(14, 'c94378d0-b942-4fa2-a132-20e0af6ba053', '/uploads/produk/Bomber.jpg', 'Jaket Bomber Pria ', 140000, 30, '2024-04-25 00:34:05', '2024-04-25 00:34:05'),
(15, 'f1631a21-2840-488c-9983-d3735b70a52c', '/uploads/produk/Holdan.jpg', ' Holdhan Crewneck ', 200000, 30, '2024-04-25 00:41:12', '2024-04-25 00:41:12'),
(16, '3bf8793c-c0d8-42af-9c63-320a2c9ae66e', '/uploads/produk/Screamous.jpg', 'Screamous Sweater', 250000, 26, '2024-04-25 00:44:20', '2024-04-29 04:10:06'),
(18, 'b4e3b0a3-13f5-402e-99aa-a9a0008e0c90', '/uploads/produk/3Second.jpg', '3Second Kids Hoodie', 210000, 9, '2024-04-25 00:49:24', '2024-04-29 04:04:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data untuk tabel `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20240218092325-create-users.js'),
('20240218094007-create-products.js'),
('20240218104842-create-blacklist.js'),
('20240218110754-create-transaksi-masuks.js'),
('20240312030636-create-transaksi-keluar.js'),
('20240312034045-create-notifikasis.js'),
('20240313042349-create-laporan-masuks.js'),
('20240313044111-create-laporan-keluars.js');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_keluars`
--

CREATE TABLE `transaksi_keluars` (
  `id` int(11) NOT NULL,
  `tanggal_keluar` date NOT NULL,
  `products_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `jumlah_keluar` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_keluars`
--

INSERT INTO `transaksi_keluars` (`id`, `tanggal_keluar`, `products_id`, `users_id`, `jumlah_keluar`, `createdAt`, `updatedAt`) VALUES
(26, '2024-04-26', 18, 31, 10, '2024-04-25 01:04:09', '2024-04-25 01:04:09'),
(27, '2024-04-26', 18, 32, 5, '2024-04-25 01:14:16', '2024-04-25 01:14:16'),
(28, '2024-04-26', 18, 31, 125, '2024-04-26 03:33:17', '2024-04-26 03:33:17'),
(29, '2024-04-30', 18, 32, 2, '2024-04-29 02:49:46', '2024-04-29 02:49:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_masuks`
--

CREATE TABLE `transaksi_masuks` (
  `id` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi_masuks`
--

INSERT INTO `transaksi_masuks` (`id`, `tanggal_masuk`, `product_id`, `user_id`, `jumlah_masuk`, `createdAt`, `updatedAt`) VALUES
(74, '2024-04-25', 18, 31, 5, '2024-04-25 01:02:27', '2024-04-25 01:02:27'),
(75, '2024-04-25', 18, 31, 5, '2024-04-25 01:03:24', '2024-04-25 01:03:24'),
(76, '2024-04-25', 18, 32, 5, '2024-04-25 01:12:07', '2024-04-25 01:12:07'),
(77, '2024-04-25', 12, 32, 3, '2024-04-25 13:42:55', '2024-04-25 13:42:55'),
(78, '2024-04-26', 18, 31, 100, '2024-04-26 03:32:40', '2024-04-26 03:32:40'),
(79, '2024-04-29', 18, 32, 5, '2024-04-29 02:48:32', '2024-04-29 02:48:32'),
(80, '2024-04-29', 16, 31, 1, '2024-04-29 04:10:06', '2024-04-29 04:10:06');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `createdAt`, `updatedAt`) VALUES
(31, 'Alvin Rahmat Maulana', 'alvin12@gmail.com', 'sha1$31647aeb$1$e4ad7a26983a286461144702ee4677a69ef26341', 'admin', '2024-04-25 00:13:42', '2024-04-25 00:13:42'),
(32, 'Septian', 'asep12@gmail.com', 'sha1$6aecb333$1$89c304102519b146f488a1a4658104652a26463f', 'pegawai', '2024-04-25 00:13:42', '2024-04-26 03:31:39'),
(33, 'ujang', 'ujang@gmail.com', '1234', 'admin', '2024-04-26 10:49:22', '2024-04-26 10:49:22');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `blacklists`
--
ALTER TABLE `blacklists`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `laporan_keluars`
--
ALTER TABLE `laporan_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporan__keluars_products_id` (`products_id`),
  ADD KEY `laporan__keluars_users_id` (`users_id`),
  ADD KEY `laporan__keluars_transaksi_keluars_id` (`transaksi_keluars_id`);

--
-- Indeks untuk tabel `laporan_masuks`
--
ALTER TABLE `laporan_masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `laporan__masuks_products_id` (`products_id`),
  ADD KEY `laporan__masuks_users_id` (`users_id`),
  ADD KEY `laporan__masuks_transaksi_masuks_id` (`transaksi_masuks_id`);

--
-- Indeks untuk tabel `notifikases`
--
ALTER TABLE `notifikases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifikases_products_id` (`products_id`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indeks untuk tabel `transaksi_keluars`
--
ALTER TABLE `transaksi_keluars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi__keluars_products_id` (`products_id`),
  ADD KEY `transaksi__keluars_users_id` (`users_id`);

--
-- Indeks untuk tabel `transaksi_masuks`
--
ALTER TABLE `transaksi_masuks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_masuks_user_id` (`user_id`) USING BTREE,
  ADD KEY `transaksi_masuks_ibfk_1` (`product_id`) USING BTREE;

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `blacklists`
--
ALTER TABLE `blacklists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `laporan_keluars`
--
ALTER TABLE `laporan_keluars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `laporan_masuks`
--
ALTER TABLE `laporan_masuks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `notifikases`
--
ALTER TABLE `notifikases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `transaksi_keluars`
--
ALTER TABLE `transaksi_keluars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `transaksi_masuks`
--
ALTER TABLE `transaksi_masuks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `laporan_keluars`
--
ALTER TABLE `laporan_keluars`
  ADD CONSTRAINT `laporan_keluars_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `laporan_keluars_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `laporan_keluars_ibfk_3` FOREIGN KEY (`transaksi_keluars_id`) REFERENCES `transaksi_keluars` (`id`);

--
-- Ketidakleluasaan untuk tabel `laporan_masuks`
--
ALTER TABLE `laporan_masuks`
  ADD CONSTRAINT `laporan_masuks_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `laporan_masuks_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `laporan_masuks_ibfk_3` FOREIGN KEY (`transaksi_masuks_id`) REFERENCES `transaksi_masuks` (`id`);

--
-- Ketidakleluasaan untuk tabel `notifikases`
--
ALTER TABLE `notifikases`
  ADD CONSTRAINT `notifikases_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_keluars`
--
ALTER TABLE `transaksi_keluars`
  ADD CONSTRAINT `transaksi_keluars_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transaksi_keluars_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `transaksi_masuks`
--
ALTER TABLE `transaksi_masuks`
  ADD CONSTRAINT `transaksi_masuks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transaksi_masuks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
