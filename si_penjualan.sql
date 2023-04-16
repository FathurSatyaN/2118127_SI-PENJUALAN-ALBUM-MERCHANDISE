-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 15.11
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si_penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `Username` varchar(25) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `ID_Barang` varchar(10) NOT NULL,
  `Nama_Barang` varchar(50) NOT NULL,
  `Jenis_Barang` varchar(40) NOT NULL,
  `Harga_Barang` varchar(40) NOT NULL,
  `Stok_Barang` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_customer`
--

CREATE TABLE `tb_customer` (
  `ID_Customer` varchar(10) NOT NULL,
  `Nama` varchar(25) NOT NULL,
  `Alamat` text NOT NULL,
  `No_Hp` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `ID_Pegawai` varchar(10) NOT NULL,
  `Password_Pegawai` varchar(20) NOT NULL,
  `Username` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `ID_Supplier` varchar(10) NOT NULL,
  `Nama_Supplier` varchar(25) NOT NULL,
  `No_Telp` varchar(20) NOT NULL,
  `Alamat_Supplier` text NOT NULL,
  `ID_Barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksipembelian`
--

CREATE TABLE `tb_transaksipembelian` (
  `ID_Pembelian` varchar(10) NOT NULL,
  `Tanggal_Pembelian` datetime NOT NULL,
  `Metode_Pembayaran` varchar(25) NOT NULL,
  `Total_Harga` varchar(25) NOT NULL,
  `ID_Customer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksipenjualan`
--

CREATE TABLE `tb_transaksipenjualan` (
  `ID_Penjualan` varchar(10) NOT NULL,
  `Tanggal_Penjualan` datetime NOT NULL,
  `ID_Customer` varchar(10) NOT NULL,
  `ID_Barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`Username`);

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`ID_Barang`);

--
-- Indeks untuk tabel `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`ID_Customer`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`ID_Pegawai`),
  ADD KEY `Username` (`Username`);

--
-- Indeks untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`ID_Supplier`),
  ADD KEY `ID_Barang` (`ID_Barang`);

--
-- Indeks untuk tabel `tb_transaksipembelian`
--
ALTER TABLE `tb_transaksipembelian`
  ADD PRIMARY KEY (`ID_Pembelian`),
  ADD KEY `ID_Customer` (`ID_Customer`);

--
-- Indeks untuk tabel `tb_transaksipenjualan`
--
ALTER TABLE `tb_transaksipenjualan`
  ADD PRIMARY KEY (`ID_Penjualan`),
  ADD KEY `ID_Barang` (`ID_Barang`),
  ADD KEY `ID_Customer` (`ID_Customer`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `tb_admin` (`Username`);

--
-- Ketidakleluasaan untuk tabel `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD CONSTRAINT `tb_supplier_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `tb_barang` (`ID_Barang`);

--
-- Ketidakleluasaan untuk tabel `tb_transaksipembelian`
--
ALTER TABLE `tb_transaksipembelian`
  ADD CONSTRAINT `tb_transaksipembelian_ibfk_1` FOREIGN KEY (`ID_Customer`) REFERENCES `tb_customer` (`ID_Customer`);

--
-- Ketidakleluasaan untuk tabel `tb_transaksipenjualan`
--
ALTER TABLE `tb_transaksipenjualan`
  ADD CONSTRAINT `tb_transaksipenjualan_ibfk_1` FOREIGN KEY (`ID_Barang`) REFERENCES `tb_barang` (`ID_Barang`),
  ADD CONSTRAINT `tb_transaksipenjualan_ibfk_2` FOREIGN KEY (`ID_Customer`) REFERENCES `tb_customer` (`ID_Customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
