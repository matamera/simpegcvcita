-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 15 Mei 2018 pada 14.04
-- Versi Server: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simpeg32`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_dp3`
--

CREATE TABLE `tbl_data_dp3` (
  `id_dp3` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `tahun` varchar(30) NOT NULL,
  `kesetiaan` varchar(100) NOT NULL,
  `prestasi` varchar(100) NOT NULL,
  `tanggung_jawab` varchar(100) NOT NULL,
  `ketaatan` varchar(100) NOT NULL,
  `kejujuran` varchar(100) NOT NULL,
  `kerjasama` varchar(100) NOT NULL,
  `prakarsa` varchar(100) NOT NULL,
  `kepemimpinan` varchar(100) NOT NULL,
  `rata_rata` varchar(100) NOT NULL,
  `pejabat_penilai` varchar(100) NOT NULL,
  `atasan_pejabat_penilai` varchar(100) NOT NULL,
  `mengetahui` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_gaji_pokok`
--

CREATE TABLE `tbl_data_gaji_pokok` (
  `id_gaji_pokok` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_golongan` int(50) NOT NULL,
  `nomor_sk` varchar(100) NOT NULL,
  `tanggal_sk` varchar(100) NOT NULL,
  `dasar_perubahan` varchar(100) NOT NULL,
  `gaji_pokok` varchar(50) NOT NULL,
  `tanggal_mulai` varchar(50) NOT NULL,
  `tanggal_selesai` varchar(50) NOT NULL,
  `masa_kerja` varchar(50) NOT NULL,
  `pejabat_menetapkan` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_hukuman`
--

CREATE TABLE `tbl_data_hukuman` (
  `id_hukuman` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_master_hukuman` int(50) NOT NULL,
  `uraian` text NOT NULL,
  `nomor_sk` varchar(100) NOT NULL,
  `tanggal_sk` varchar(100) NOT NULL,
  `tanggal_mulai` varchar(50) NOT NULL,
  `tanggal_selesai` varchar(50) NOT NULL,
  `no_sk_pembatalan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_keluarga`
--

CREATE TABLE `tbl_data_keluarga` (
  `id_data_keluarga` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `nama_anggota_keluarga` varchar(150) NOT NULL,
  `tanggal_lahir` varchar(100) NOT NULL,
  `status_keluarga` varchar(20) NOT NULL,
  `status_kawin` varchar(50) NOT NULL,
  `tanggal_nikah` varchar(100) NOT NULL,
  `tanggal_cerai_meninggal` text NOT NULL,
  `tanggal_meninggal` varchar(110) DEFAULT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `no_kartu` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_organisasi`
--

CREATE TABLE `tbl_data_organisasi` (
  `id_organisasi` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_satuan_kerja` int(11) NOT NULL,
  `nomor` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_pegawai`
--

CREATE TABLE `tbl_data_pegawai` (
  `id_pegawai` int(50) NOT NULL,
  `nip` varchar(100) NOT NULL,
  `nip_lama` varchar(100) NOT NULL,
  `no_kartu_pegawai` varchar(100) NOT NULL,
  `nama_pegawai` varchar(150) NOT NULL,
  `agama` int(11) NOT NULL DEFAULT '1',
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` varchar(50) NOT NULL,
  `nomor_kk` varchar(114) NOT NULL,
  `nomor_ktp` varchar(114) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `usia` varchar(10) NOT NULL,
  `status_pegawai` varchar(50) NOT NULL,
  `tanggal_pengangkatan_cpns` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(114) DEFAULT NULL,
  `email` varchar(114) DEFAULT NULL,
  `no_npwp` varchar(75) NOT NULL,
  `kartu_askes_pegawai` varchar(100) NOT NULL,
  `status_pegawai_pangkat` varchar(50) NOT NULL,
  `id_golongan` int(20) DEFAULT NULL,
  `nomor_sk_pangkat` varchar(50) NOT NULL,
  `tanggal_sk_pangkat` varchar(50) NOT NULL,
  `tanggal_mulai_pangkat` varchar(50) NOT NULL,
  `tanggal_selesai_pangkat` varchar(50) NOT NULL,
  `id_status_jabatan` int(20) NOT NULL,
  `id_jabatan` int(20) NOT NULL,
  `id_unit_kerja` int(20) NOT NULL,
  `id_satuan_kerja` int(20) NOT NULL,
  `nomor_sk_jabatan` varchar(50) NOT NULL,
  `tanggal_sk_jabatan` varchar(50) NOT NULL,
  `tanggal_mulai_jabatan` varchar(50) NOT NULL,
  `tanggal_selesai_jabatan` varchar(50) NOT NULL,
  `id_eselon` int(20) NOT NULL,
  `tmt_eselon` varchar(50) NOT NULL,
  `tmt_cpns` varchar(50) NOT NULL,
  `gaji_pokok` varchar(110) NOT NULL,
  `tmt_pns` varchar(50) NOT NULL,
  `foto` varchar(100) NOT NULL DEFAULT 'avatar.png',
  `gelar_dpn` varchar(114) DEFAULT NULL,
  `gelar_belakang` varchar(114) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_data_pegawai`
--

INSERT INTO `tbl_data_pegawai` (`id_pegawai`, `nip`, `nip_lama`, `no_kartu_pegawai`, `nama_pegawai`, `agama`, `tempat_lahir`, `tanggal_lahir`, `nomor_kk`, `nomor_ktp`, `jenis_kelamin`, `usia`, `status_pegawai`, `tanggal_pengangkatan_cpns`, `alamat`, `no_hp`, `email`, `no_npwp`, `kartu_askes_pegawai`, `status_pegawai_pangkat`, `id_golongan`, `nomor_sk_pangkat`, `tanggal_sk_pangkat`, `tanggal_mulai_pangkat`, `tanggal_selesai_pangkat`, `id_status_jabatan`, `id_jabatan`, `id_unit_kerja`, `id_satuan_kerja`, `nomor_sk_jabatan`, `tanggal_sk_jabatan`, `tanggal_mulai_jabatan`, `tanggal_selesai_jabatan`, `id_eselon`, `tmt_eselon`, `tmt_cpns`, `gaji_pokok`, `tmt_pns`, `foto`, `gelar_dpn`, `gelar_belakang`) VALUES
(1, '197112262000031002', '132253755', 'K.062457', 'LA AMPERA', 1, 'BUTON', '26-12-1971', '', '7472042612710001', 'Laki-Laki', '', '3', '', 'DESA WAJO GU KEC. LAKUDO', '', 'laampera9@gmai.com', '49.458.722.3816.000', '0000134337521', '', 18, '', '', '', '', 0, 0, 0, 1, '', '', '', '', 0, '', '01-03-2000', '', '01-09-2001', '', '', 'S.Pd, M.Pd'),
(2, '196012311982031366', '320003638', 'C 0506967', 'MAKMUR', 1, 'BUTON', '31-12-1960', '', '7404293112600004', 'Laki-Laki', '', '3', '', 'JL. PROTOKOL KEL.PASARWAJO KEC. PASARWAJO', '081245884328', 'makmur_balitbang@yahoo.co.id', '66.224.026.6816.000', '0000134352911', '', 19, '', '', '', '', 0, 0, 0, 1, '', '', '', '', 0, '', '01-03-1982', '', '01-06-1983', '', '', 'SH'),
(3, '196112311986031203', '010197398', 'E 454839', 'TOHIR', 1, 'BUTON', '31-12-1961', '', '7472053112610007', 'Laki-Laki', '', '3', '', 'LRNG SKB KELURAHAN KADOLOMOKO,KECAMATAN KOKALUKUNA,KOTA BAUBAU', '', 'tohirsepto.1961@gmail.com', '49.162.125.6816.000', '0000134288649', '', 18, '', '', '', '', 0, 0, 0, 2, '', '', '', '', 0, '', '01-03-1986', '', '01-03-1988', '', '', 'SE'),
(4, '197101061994032004', '080118849', 'G 260985', 'ASNI', 1, 'MALUKU TENGAH', '06-01-1971', '', '7404114601710001', 'Perempuan', '', '3', '', 'JL.POROS LASALIMU KELURAHAN WASAGA KEC.PASARWAJO KABUPATEN BUTON', '', 'Asniamin@ymail.com', '69.894.465.9.816.000', '0000134206839', '', 14, '', '', '', '', 0, 0, 0, 2, '', '', '', '', 0, '', '01-03-1994', '', '01-05-1995', '', '', 'SST'),
(5, '196502151987101001', '080089256', 'F 197897', 'IGNASIUS SUKARMAN', 1, 'SLEMAN', '15-02-1965', '', '7472021502650001', 'Laki-Laki', '', '3', '', 'JL. PAHLAWAN KELURAHAN BUKIT WOLIO INDAH KEC.WOLIO KOTA BAUBAU SULAWESI TENGGARA', '', 'ignasiussukarman@yahoo.com', '68.588.965.1.816.000', '0000134173743', '', 17, '', '', '', '', 0, 0, 0, 3, '', '', '', '', 0, '', '01-10-1987', '', '01-01-1989', '', '', 'S.PKP'),
(6, '198301312006051001', '640040606', 'A09004069', 'YOHANIS PETRUS MOAR', 1, 'MERAUKE', '31-01-1983', '', '9110013101830002', 'Laki-Laki', '', '3', '', 'KELURAHAN LANTO', '', 'yohanispetrus83@gmail.com', '', '0000154465244', '', 10, '', '', '', '', 0, 0, 0, 4, '', '', '', '', 0, '', '01-05-2006', '', '01-11-2012', '', '', ''),
(7, '198107032012122002', '', 'Q312640', 'YANTI SYAH', 1, 'AMBON', '03-07-1981', '', '7472054307810001', 'Perempuan', '', '3', '', 'KEL. KADOLOMOKO KOTA BAU-BAU', '082393224557', 'yantisyah201212@yahoo.co.id', '16.850.586.5816.000', '0001438543743', '', 10, '', '', '', '', 0, 0, 0, 5, '', '', '', '', 0, '', '01-12-2012', '', '01-04-2014', '', '', ''),
(8, '197904162007012014', '590026358', 'N.320099', 'SUSANTI TAWILE', 1, 'BAUBAU', '16-04-1979', '', '7472065604790001', 'Perempuan', '', '3', '', 'KOTA BAU BAU', '', 'SUSANTITAWILE@gmail.com', '16.653.587.2.816.000', '0000134173001', '', 13, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-01-2007', '', '01-08-2008', '', '', 'A.Md'),
(9, '198108192009031005', '', 'P.083756', 'MURSALIN', 1, 'MUNA', '19-08-1981', '', '7404111908810001', 'Laki-Laki', '', '3', '', 'LINGK.BENTE KEL.KAMBULABULANA KEC.PASARWAJO', '', 'ulisinda@gmail.com', '166934265816000', '', '', 13, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-03-2009', '', '01-04-2010', '', '', 'A.Md'),
(10, '196708152000032004', '710032577', 'G 423908', 'FARIATI HAK', 1, 'BAUBAU', '15-08-1967', '', '7472065508670001', 'Perempuan', '', '3', '', 'JL. DR. WAHIDIN\r\nKEL. LAMANGGA KEC. MURHUM\r\nKOTA BAUBAU', '085299745377', 'fariati.hak@gmail.com', '14.460.230.7.816.000', '0000134211071', '', 14, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-03-2000', '', '01-03-2001', '', '', 'S.AP'),
(11, '198203242009011002', '', 'P. 102949', 'ZAHIDIN', 1, 'BUTON', '24-03-1982', '', '7471102403820002', 'Laki-Laki', '', '3', '', 'KELURAHAN TAKIMPO KECAMATAN PASARWAJO', '', 'zahidinidin4@gmail.com', '16.091.588.8.8111.000', '0000149590877', '', 14, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-01-2009', '', '01-02-2010', '', '', 'S.IP'),
(12, '196905282007011012', '590025732', 'X', 'SOSAM ALAMSYAH', 1, 'MAKASSAR', '28-05-1969', '', '7472022805690001', 'Laki-Laki', '', '3', '', 'JL. BUNGA TERATAI NO. 3 KELURAHAN KADOLOMOKO KECAMATAN KOKALUKUNA', '', 'sosam.alamsyah1969@gmail.com', '16.919.067.5.816.000', '0000134172999', '', 14, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-01-2007', '', '01-08-2008', '', '', 'SH'),
(13, '196612011990031010', '140251099', 'F 354568', 'LA JUUFUDIN', 1, 'AMBON', '01-12-1966', '', '8104010112660001', 'Laki-Laki', '', '3', '', 'KEC. LAPANDEWA', '', 'la_juufudin@yahoo.com', '', '0000159033868', '', 12, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-03-1990', '', '01-02-1992', '', '', ''),
(14, '197411032012122001', '', 'Q 312603', 'WA ODE MAS INDRAWATY', 1, 'BUTON', '03-11-1974', '', '7404114311740001', 'Perempuan', '', '3', '', 'KEC. PASARWAJO KAB.BUTON', '', 'bkdd.buton7402@gmail.com', '7404114311740001', '0001081786882', '', 10, '', '', '', '', 0, 0, 0, 6, '', '', '', '', 0, '', '01-12-2012', '', '01-04-2014', '', '', ''),
(15, '196812312009021004', '', '00', 'LA SAIRI', 1, 'BUTON', '31-12-1968', '', '7404113112680024', 'Laki-Laki', '', '3', '', 'LABAHAWA\r\nKEL.LAPODI\r\nKEC.PASARWAJO', '', 'bkdd.buton7402@gmail.com', '73.945.692.9.816.000', '', '', 23, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-02-2009', '', '01-04-2010', '', '', ''),
(16, '196112311990041002', '131829035', 'F 363555', 'LA LICA', 1, 'BUTON', '31-12-1961', '', '7404113112610006', 'Laki-Laki', '', '3', '', 'DUSUN LABAHAWA DESA LAPODI KEC. PASARWAJO', '', 'bkdd.buton7402@gmail.com', '16.693.427.3816.000', '0000134213848', '', 12, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-04-1990', '', '01-07-1991', '', '', ''),
(17, '198409292008012007', '590029784', 'P.032907', 'EMIL SALNA', 1, 'BUTON', '29-09-1984', '', '7472056909840001', 'Perempuan', '', '3', '', 'JL. ANOA  KEL. KADOLOMOKO KEC. KOKALUKUNA BAUBAU', '', 'emilsalna79@gmail.com', '87.703.380.3.816.000', '0000134173157', '', 14, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-01-2008', '', '01-05-2009', '', '', 'S.Sos'),
(18, '196709031994021006', '132084180', 'g.168818', 'LA HASIBA', 1, 'MALUKU TENGAH', '03-09-1967', '', '7404110309670001', 'Laki-Laki', '', '3', '', 'LING.LIMBO KELURAHAN KOMBELI KEC.PASARWAJO', '', 'ulisinda@gmail.com', '16.693.428.1816.000', '0000134212533', '', 13, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-02-1994', '', '01-08-1995', '', '', ''),
(19, '195812311980101023', '130856862', 'C 0361692', 'LAODE MUHAMMAD KASIM', 1, 'BUTON', '31-12-1958', '', '7404313112580004', 'Laki-Laki', '', '7', '', 'DESA KUMBEWAHA, KEC. SIOTAPINA, KAB. BUTON, PROV. SULAWESI TENGGARA', '', 'laodemuhammadkasim@yahoo.co.id', '15.915.094.5.816.000', '0000134285073', '', 17, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-10-1980', '', '01-01-1982', '', '', 'S.IP'),
(20, '196512311992032091', '131998218', 'F 404453', 'ZANURIAH', 1, 'BUTON', '31-12-1965', '', '7472064107650036', 'Perempuan', '', '3', '', 'JL. LIMBO WOLIO KEL. TANGANAPADA KEC. MURHUM BAUBAU', '', 'bkdd.buton7402@gmail.com', '48.677.838.4.816.000', '0000134173113', '', 19, '', '', '', '', 0, 0, 0, 8, '', '', '', '', 0, '', '01-03-1992', '', '01-12-1993', '', ' Dra', 'M.Si');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_pelatihan`
--

CREATE TABLE `tbl_data_pelatihan` (
  `id_pelatihan` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_master_pelatihan` int(50) NOT NULL,
  `nama_kursus` varchar(114) NOT NULL,
  `lama_kursus` varchar(114) NOT NULL,
  `tanggal` varchar(50) NOT NULL,
  `no_sertifikat` varchar(50) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `instansi_penyelenggara` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_pendidikan`
--

CREATE TABLE `tbl_data_pendidikan` (
  `id_pendidikan` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `tingkat_pendidikan` int(12) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `sekolah` varchar(100) NOT NULL,
  `tempat_sekolah` text NOT NULL,
  `tanggal_lulus` varchar(50) NOT NULL,
  `nomor_ijazah` varchar(114) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_penghargaan`
--

CREATE TABLE `tbl_data_penghargaan` (
  `id_penghargaan` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `jenis_penghargaan` varchar(114) NOT NULL,
  `no_keputusan` varchar(114) NOT NULL,
  `tanggal` varchar(100) NOT NULL,
  `tahun` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_riwayat_golongan`
--

CREATE TABLE `tbl_data_riwayat_golongan` (
  `id_riwayat_golongan` int(100) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_golongan` int(50) DEFAULT NULL,
  `nomor_sk` varchar(50) NOT NULL,
  `tanggal_sk` varchar(50) NOT NULL,
  `tmt_golongan` varchar(50) NOT NULL,
  `nomor_bkn` varchar(100) NOT NULL,
  `tanggal_bkn` varchar(50) NOT NULL,
  `masa_kerja` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_riwayat_jabatan`
--

CREATE TABLE `tbl_data_riwayat_jabatan` (
  `id_riwayat_jabatan` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_jenis_jabatan` int(11) NOT NULL,
  `nm_jabatan` varchar(114) DEFAULT NULL,
  `id_jabatan` int(11) NOT NULL,
  `id_satuan_kerja` int(11) NOT NULL,
  `id_eselon` int(11) NOT NULL,
  `tmt_jabatan_rj` date NOT NULL,
  `tanggal_sk_rj` date NOT NULL,
  `tmt_pelantikan_rj` date DEFAULT NULL,
  `nomor_sk` varchar(114) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_riwayat_pangkat`
--

CREATE TABLE `tbl_data_riwayat_pangkat` (
  `id_riwayat_pangkat` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `id_golongan` int(30) NOT NULL,
  `status` varchar(50) NOT NULL,
  `nomor_sk` varchar(50) NOT NULL,
  `tanggal_sk` varchar(50) NOT NULL,
  `tanggal_mulai` varchar(50) NOT NULL,
  `tanggal_selesai` varchar(50) NOT NULL,
  `masa_kerja` varchar(30) NOT NULL,
  `masa_kerja_bulan` int(11) NOT NULL,
  `masa_kerja_tahun` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_data_seminar`
--

CREATE TABLE `tbl_data_seminar` (
  `id_seminar` int(50) NOT NULL,
  `id_pegawai` int(50) NOT NULL,
  `uraian` text NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_groups`
--

CREATE TABLE `tbl_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_groups`
--

INSERT INTO `tbl_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'prodi', 'Program Studi'),
(4, 'fakultas', 'Fakultas'),
(5, 'rektor', 'Pimpinan Universitas'),
(6, 'pr1', 'Wakil Rektor 1'),
(7, 'pr2', 'Wakil Rektor 2'),
(8, 'pr3', 'Wakil Rektor 3'),
(9, 'pr4', 'Wakil Rektor 4'),
(10, '54211', 'S1 Agroteknologi'),
(11, '55201', 'S1 Teknik Informatika'),
(12, '87203', 'S1 Pendidikan Ekonomi'),
(13, '84202', 'S1 Pendidikan Matematika'),
(14, '21201', 'S1 Teknik Mesin'),
(15, '63201', 'S1 Ilmu Administrasi Negara'),
(16, '61201', 'S1 Manajemen'),
(17, '88203', 'S1 Pendidikan Bahasa Inggris'),
(18, '69201', 'S1 Sosiologi'),
(19, '22201', 'S1 Teknik Sipil'),
(20, '74201', 'S1 Ilmu Hukum'),
(21, '62201', 'S1 Akuntansi'),
(22, '87201', 'S1 Pendidikan Sejarah'),
(23, '54243', 'S1 Budidaya Perairan'),
(24, '13201', 'S1 Kesehatan Masyarakat'),
(25, '63101', 'S2 Ilmu Administrasi Negara'),
(26, 'ekonomi', 'Fakultas Ekonomi'),
(27, 'hukum', 'Fakultas Hukum'),
(28, 'sospol', 'Fakultas Ilmu Sosial dan Ilmu Politik'),
(29, 'fkip', 'Fakultas Keguruan dan Ilmu Pendidikan'),
(30, 'fkm', 'Fakultas Kesehatan Masyarakat'),
(31, 'perikanan', 'Fakultas Perikanan'),
(32, 'pertanian', 'Fakultas Pertanian'),
(33, 'teknik', 'Fakultas Teknik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_honorer`
--

CREATE TABLE `tbl_honorer` (
  `id_honorer` int(5) NOT NULL,
  `nama` varchar(114) NOT NULL,
  `alamat` varchar(114) NOT NULL,
  `nomor_sk` varchar(50) NOT NULL,
  `id_lokasi_kerja` varchar(50) DEFAULT NULL,
  `tmt` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_honorer`
--

INSERT INTO `tbl_honorer` (`id_honorer`, `nama`, `alamat`, `nomor_sk`, `id_lokasi_kerja`, `tmt`, `no_hp`) VALUES
(1, 'Mugi', 'dimanasaja', '1233496i0492', '3', '213456789', '852345678'),
(2, 'Reza', 'disitumi', '123456789', '4', '13245678', '82345675'),
(3, 'iyar1', 'itumi', '2213245678', '1', '1234', '2147483647'),
(6, 'aris', 'disanaeh', '1234557', '1', '1994-12-12', '897435896');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_info_pt`
--

CREATE TABLE `tbl_info_pt` (
  `id_info_pt` int(11) NOT NULL,
  `nama_info_pt` varchar(114) DEFAULT NULL,
  `alias_pt` varchar(114) DEFAULT NULL,
  `kode_pt` varchar(114) DEFAULT NULL,
  `kontak_1` varchar(50) DEFAULT NULL,
  `kontak_2` varchar(50) DEFAULT NULL,
  `kontak_3` varchar(50) DEFAULT NULL,
  `kontak_4` varchar(50) DEFAULT NULL,
  `header_pt` varchar(114) DEFAULT NULL,
  `alamat_pt` varchar(114) DEFAULT NULL,
  `slogan` varchar(114) DEFAULT NULL,
  `logo_pt` varchar(114) DEFAULT NULL,
  `logo_kecil_pt` varchar(114) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_info_pt`
--

INSERT INTO `tbl_info_pt` (`id_info_pt`, `nama_info_pt`, `alias_pt`, `kode_pt`, `kontak_1`, `kontak_2`, `kontak_3`, `kontak_4`, `header_pt`, `alamat_pt`, `slogan`, `logo_pt`, `logo_kecil_pt`) VALUES
(1, 'Sistem Informasi Manajemen Kepegawaian', 'SIMPEG', '000012', '1111-11111-1111', '1111-11111-1111', '1111-11111-1111', '1111-11111-1111', NULL, 'Pasar Wajo, Kabupaten Buton', '', 'logo-sistem-informasi-manajemen-pegawai-20180401-1522588626.png', 'logo.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jk`
--

CREATE TABLE `tbl_jk` (
  `id_jk` int(11) NOT NULL,
  `kode_jk` varchar(12) NOT NULL,
  `nm_jk` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_jk`
--

INSERT INTO `tbl_jk` (`id_jk`, `kode_jk`, `nm_jk`) VALUES
(1, 'l', 'Laki-laki'),
(2, 'p', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_login_attempts`
--

CREATE TABLE `tbl_login_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_agama`
--

CREATE TABLE `tbl_master_agama` (
  `id_agama` int(11) NOT NULL,
  `nm_agama` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_agama`
--

INSERT INTO `tbl_master_agama` (`id_agama`, `nm_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Hindu'),
(4, 'Budha'),
(5, 'Kristen Katolik'),
(6, 'Kristen Portestan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_eselon`
--

CREATE TABLE `tbl_master_eselon` (
  `id_eselon` int(50) NOT NULL,
  `nama_eselon` varchar(150) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_eselon`
--

INSERT INTO `tbl_master_eselon` (`id_eselon`, `nama_eselon`, `level`) VALUES
(23, 'I.a', '1'),
(24, 'I.b', '2'),
(25, 'II.a', '3'),
(26, 'II.b', '4'),
(27, 'III.a', '5'),
(28, 'III.b', '6'),
(29, 'IV.a', '7'),
(30, 'IV.b', '8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_golongan`
--

CREATE TABLE `tbl_master_golongan` (
  `id_golongan` int(50) NOT NULL,
  `golongan` varchar(100) NOT NULL,
  `uraian` text NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_golongan`
--

INSERT INTO `tbl_master_golongan` (`id_golongan`, `golongan`, `uraian`, `level`) VALUES
(4, 'PNS', 'PEGAWAI NEGERI SIPIL', '18'),
(5, 'I/a', 'JURU MUDA', '17'),
(6, 'I/b', 'JURU MUDA TINGKAT I', '16'),
(7, 'I/c', 'JURU', '15'),
(8, 'I/d', 'JURU TINGKAT I', '14'),
(9, 'II/a', 'PENGATUR MUDA', '13'),
(10, 'II/b', 'PENGATUR MUDA TK IPENGATUR MUDA TK I', '12'),
(12, 'II/d', 'PENGATUR TINGKAT I', '10'),
(13, 'III/a', 'PENATA MUDA', '9'),
(14, 'III/b', 'PENATA MUDA TINGKAT I', '8'),
(15, 'III/c', 'PENATA', '7'),
(16, 'III/d', 'PENATA TINGKAT I', '6'),
(17, 'IV/a', 'PEMBINA', '5'),
(18, 'IV/b', 'PEMBINA TINGKAT I', '4'),
(19, 'IV/c', 'PEMBINA UTAMA MUDA', '3'),
(20, 'IV/b', 'PEMBINA UTAMA MADYA', '2'),
(23, 'II/c', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_hukuman`
--

CREATE TABLE `tbl_master_hukuman` (
  `id_hukuman` int(50) NOT NULL,
  `nama_hukuman` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_hukuman`
--

INSERT INTO `tbl_master_hukuman` (`id_hukuman`, `nama_hukuman`) VALUES
(4, 'KILI KILI'),
(5, 'TEGURAN TERTULIS'),
(6, 'PERNYATAAN TAK PUAS TERTULIS'),
(7, 'PENUNDAAN KGB'),
(8, 'PENUNDAAN Kp'),
(9, 'PENURUNAN PANGKAT'),
(10, 'PEMBEBASAN DARI JABATAN'),
(11, 'PEMBERHENTIAN DENGAN HORMAT TAPS'),
(12, 'PEMBERHENTIAN TIDAK DENGAN HORMAT'),
(13, 'HUKUMAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_jabatan`
--

CREATE TABLE `tbl_master_jabatan` (
  `id_jabatan` int(50) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_jabatan`
--

INSERT INTO `tbl_master_jabatan` (`id_jabatan`, `nama_jabatan`, `level`) VALUES
(1, 'Kepala Dinas', 1),
(2, 'Sekretasi Daerah', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_jenis_jabatan`
--

CREATE TABLE `tbl_master_jenis_jabatan` (
  `id_jenis_jabatan` int(11) NOT NULL,
  `nama_jenis_jabatan` varchar(114) NOT NULL,
  `kode_jenis_jabatan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_jenis_jabatan`
--

INSERT INTO `tbl_master_jenis_jabatan` (`id_jenis_jabatan`, `nama_jenis_jabatan`, `kode_jenis_jabatan`) VALUES
(1, 'Struktural', '1'),
(2, 'Fungsional Umum', '2'),
(3, 'Fungsional Tertentu', '3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_lokasi_kerja`
--

CREATE TABLE `tbl_master_lokasi_kerja` (
  `id_lokasi_kerja` int(10) NOT NULL,
  `lokasi_kerja` varchar(100) NOT NULL,
  `unit_kerja_induk` varchar(100) DEFAULT NULL,
  `alamat_loker` varchar(114) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_lokasi_kerja`
--

INSERT INTO `tbl_master_lokasi_kerja` (`id_lokasi_kerja`, `lokasi_kerja`, `unit_kerja_induk`, `alamat_loker`) VALUES
(1, 'SEKRETARIAT DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'Jalan Sultan Hasanuddin No.26, Baubau Sulawesi Tenggara. Telp: (0402) 2821424'),
(2, 'SEKRETARIAT DPRD KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', NULL),
(3, 'INSPEKTORAT KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', NULL),
(4, 'SATUAN POL PP KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', NULL),
(5, 'BAPPEDA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', NULL),
(6, 'BADAN PENGELOLA KEUANGAN DAN ASET DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', NULL),
(7, 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN DAERAH', 'PEMERINTAH KABUPATEN BUTON', NULL),
(8, 'BADAN PENGELOLA PAJAK DAN RETRIBUSI DAERAH KAB. BUTON', NULL, NULL),
(9, 'BADAN PENELITIAN DAN PENGEMBANGAN KAB. BUTON', NULL, NULL),
(10, 'BADAN KESATUAN BANGSA DAN POLITIK KAB. BUTON', NULL, NULL),
(11, 'BADAN PENANGGULANGAN BENCANA KABUPATEN BUTON', NULL, NULL),
(12, 'DINAS PARIWISATA KAB. BUTON', NULL, NULL),
(13, 'DINAS KELAUTAN DAN PERIKANAN KAB. BUTON', NULL, NULL),
(14, 'DINAS PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK KAB. BUTON', NULL, NULL),
(15, 'DINAS PENDIDIKAN KAB. BUTON', NULL, NULL),
(16, 'DINAS KESEHATAN KAB. BUTON', NULL, NULL),
(17, 'DINAS PERHUBUNGAN KAB. BUTON', NULL, NULL),
(18, 'DINAS PEKERJAAN UMUM DAN PENATAAN RUANG KAB. BUTON', NULL, NULL),
(19, 'DINAS KOPERASI DAN UKM KABUPATEN BUTON', NULL, NULL),
(20, 'DINAS TRANSMIGRASI KAB. BUTON', NULL, NULL),
(21, 'DINAS PERTANIAN KAB. BUTON', NULL, NULL),
(22, 'DINAS PERINDUSTRIAN KAB. BUTON', NULL, NULL),
(23, 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL KAB. BUTON', NULL, NULL),
(24, 'DINAS KEPEMUDAAN DAN OLAHRAGA KAB. BUTON', NULL, NULL),
(25, 'DINAS SOSIAL KAB. BUTON', NULL, NULL),
(26, 'DINAS PENGENDALIAN PENDUDUKAN DAN KB KAB. BUTON', NULL, NULL),
(27, 'DINAS LINGKUNGAN HIDUP KABUPATEN BUTON', NULL, NULL),
(28, 'DINAS KOMINFO DAN PERSANDIAN KAB. BUTON', NULL, NULL),
(29, 'DINAS KETAHANAN PANGAN KABUPATEN BUTON', NULL, NULL),
(30, 'DINAS PEMBERDAYAAN DAN DESA KAB. BUTON', NULL, NULL),
(31, 'DINAS PENANAMAN MODAL DAN PELAYANAN PTSP KAB. BUTON', NULL, NULL),
(32, 'DINAS KEARSIPAN DAN PERPUSTAKAAN DAERAH KAB. BUTON', NULL, NULL),
(33, 'DINAS PEMADAM KEBAKARAN KABUPATEN BUTON', NULL, NULL),
(34, 'DINAS TENAGA KERJA KAB. BUTON', NULL, NULL),
(35, 'DINAS PERDAGANGAN KAB. BUTON', NULL, NULL),
(36, 'DINAS PERUMAHAN DAN KAWASAN PERMUKIMAN KAB. BUTON', NULL, NULL),
(37, 'DINAS KEBUDAYAAN KAB. BUTON', NULL, NULL),
(38, 'RUMAH SAKIT UMUM DAERAH KABUPATEN BUTON', NULL, NULL),
(39, 'KECAMATAN PASARWAJO', NULL, NULL),
(40, 'KECAMATAN WABULA', NULL, NULL),
(41, 'KECAMATAN WOLOWA', NULL, NULL),
(42, 'KECAMATAN SIOTAPINA', NULL, NULL),
(43, 'KECAMATAN LASALIMU', NULL, NULL),
(44, 'KECAMATAN LASALIMU SELATAN', NULL, NULL),
(45, 'KECAMATAN KAPONTORI', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_lokasi_pelatihan`
--

CREATE TABLE `tbl_master_lokasi_pelatihan` (
  `id_lokasi_pelatihan` int(50) NOT NULL,
  `nama_lokasi` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_lokasi_pelatihan`
--

INSERT INTO `tbl_master_lokasi_pelatihan` (`id_lokasi_pelatihan`, `nama_lokasi`) VALUES
(3, 'BALAI DIKLAT PU WIL I'),
(4, 'BALAI DIKLAT PU WIL II BANDUNG'),
(5, 'BALAI DIKLAT PU WIL III YOGYAKARTA'),
(6, 'BALAI DIKLAT PU WIL IV SURABAYA'),
(7, 'BALAI DIKLAT PU WIL V MAKASAR'),
(8, 'BALAI DIKLAT PU WIL VI JAKARTA'),
(9, 'BALAI DIKLAT PU WIL VII BANJARMASIN'),
(10, 'BALAI DIKLAT PU WIL VIII PALEMBANG'),
(11, 'BALAI DIKLAT PU WIL IX JAYAPURA'),
(12, 'LAN JAKARTA'),
(13, 'LAN SEMARANG'),
(14, 'LAN SURABAYA'),
(15, 'LAN MAKASAR'),
(16, 'LAIN-LAIN'),
(17, 'LOKASI PELATIHAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_pelatihan`
--

CREATE TABLE `tbl_master_pelatihan` (
  `id_pelatihan` int(50) NOT NULL,
  `nama_pelatihan` varchar(150) NOT NULL,
  `level` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_pelatihan`
--

INSERT INTO `tbl_master_pelatihan` (`id_pelatihan`, `nama_pelatihan`, `level`) VALUES
(2, 'SESPA', '2'),
(3, 'SESPASUS', '0'),
(4, 'SESKOAD', '0'),
(5, 'KM-III', '0'),
(6, 'SEPADYA', '3'),
(7, 'KM-IV', '0'),
(8, 'SEPALA', '4'),
(9, 'SEPADA', '0'),
(10, 'SESPUT', '0'),
(11, 'TARPADNAS', '0'),
(12, 'UJIAN DINAS TK I', '0'),
(13, 'UJIAN DINAS TK II', '0'),
(14, 'UJIAN DINAS TK III', '0'),
(15, 'SPATI', '1'),
(16, 'SPAMEN (DIKLATPIM TK.II)', '2'),
(17, 'SPAMA (DIKLATPIM TK.III)', '3'),
(18, 'ADUM (DIKLATPIM TK.IV)', '4'),
(19, 'EVALUASI & PELAPORAN', '0'),
(20, 'PENATARAN P4', '0'),
(21, 'ADMINISTRASI & KEUANGAN', '0'),
(22, 'ANALISA JABATAN', '0'),
(23, 'MATERIAL MANAGEMENT', '0'),
(24, 'NETWORK PLANNING', '0'),
(25, 'PENATARAN ATLAS', '0'),
(26, 'PENGAWASAN MELEKAT', '0'),
(27, 'P.T.K.', '0'),
(28, 'PROCUREMENT', '0'),
(29, 'MANAGEMENT PROYEK', '0'),
(30, 'SCREENING', '0'),
(31, 'PUBLIC ADMINISTRATION', '0'),
(32, 'ADMINISTRASI KEPEGAWAIAN', '0'),
(33, 'ADMINISTRASI PERKANTORAN', '0'),
(34, 'AKUNTANSI', '0'),
(35, 'ADMINISTRASI TEKNIS', '0'),
(36, 'ASPAL BETON', '0'),
(37, 'BAHASA INGGRIS', '0'),
(38, 'BENDAHARAWAN', '0'),
(39, 'BENDAHARAWAN', '0'),
(40, 'BREVET', '0'),
(41, 'BREVET A', '0'),
(42, 'BREVET B', '0'),
(43, 'BREVET C', '0'),
(44, 'DRAFTER REPRODUKSI GRAFIKA', '0'),
(45, 'DRAINASE', '0'),
(46, 'DRIVER', '0'),
(47, 'E & P', '0'),
(48, 'E & P IRIGASI', '0'),
(49, 'ENGINEERING & MANAGEMENT', '0'),
(50, 'GAMBAR', '0'),
(51, 'GROUND WATER MONITORING PROCEDURE', '0'),
(52, 'HIDROMETRI', '0'),
(53, 'INSTRUKTUR DIKLAT KEPENDUDUKAN', '0'),
(54, 'INSTRUKTUR MEKANIK', '0'),
(55, 'INSTRUKTUR MEKANIK & PERALATAN', '0'),
(56, 'INSTRUKTUR OPERATOR', '0'),
(57, 'INSTRUKTUR OPERATOR PERALATAN', '0'),
(58, 'INTERPRET FOTO UDARA', '0'),
(59, 'INVENTARISASI BARANG', '0'),
(60, 'IRIGASI SEDERHANA', '0'),
(61, 'JURU AIR', '0'),
(62, 'JURU UKUR', '0'),
(63, 'KADER TEKNIK TK C (OPSETER)', '0'),
(64, 'KEARSIPAN', '0'),
(65, 'KEINSTRUKTURAN', '0'),
(66, 'KOMPUTER', '0'),
(67, 'KEPROTOKOLAN', '0'),
(68, 'KESELAMATAN & KESEHATAN KERJA', '0'),
(69, 'KETERTIBAN & KEAMANAN', '0'),
(70, 'KOMPUTER BASIC', '0'),
(71, 'KOMPUTER FORTRAN', '0'),
(72, 'KOMPUTER INTRODUCTION', '0'),
(73, 'KOMPUTER PROGRAMMING', '0'),
(74, 'MANAGEMENT LOGISTIK', '0'),
(75, 'MANDOR/FOREMAN', '0'),
(76, 'MEKANIK', '0'),
(77, 'MEKANIK LAPANGAN', '0'),
(78, 'MEKANIK LISTRIK', '0'),
(79, 'MEKANIK UMUM', '0'),
(80, 'OPERATION RESEARCH', '0'),
(81, 'OPERATOR KOMPUTER', '0'),
(82, 'OPERATOR MEKANIK', '0'),
(83, 'PADAT KARYA GAYA BARU', '0'),
(84, 'PEJABAT INTI PROYEK', '0'),
(85, 'PEMADAM KEBAKARAN', '0'),
(86, 'PEMASANGAN BATA & PELESTERAN', '0'),
(87, 'PEMBINAAN HUKUM', '0'),
(88, 'PEMIMPIN PROYEK JALAN (PPJ)', '0'),
(89, 'PENGAMAT BID PENGAIRAN', '0'),
(90, 'PENGAWASAN BANGUNAN', '0'),
(91, 'PENGETAHUAN BARANG', '0'),
(92, 'PENGGUNAAN MESIN TIK IBM', '0'),
(93, 'PENINGKATAN PENGEMUDI', '0'),
(94, 'PENYIMPANAN & PENYALURAN', '0'),
(95, 'IKMN', '0'),
(96, 'PENYUSUNAN ANGGARAN', '0'),
(97, 'PERENC DETAIL KOTA', '0'),
(98, 'PERENC SOSIAL PENGEMBANGAN AREA', '0'),
(99, 'PERENC SOSIAL PENGEMBANGAN KOTA', '0'),
(100, 'PERINTIS PERBAIKAN PERUMAHAN KOTA', '0'),
(101, 'PRATUGAS BID BINA MARGA', '0'),
(102, 'PRATUGAS BID CIPTA KARYA', '0'),
(103, 'PRATUGAS BID PENGAIRAN', '0'),
(104, 'PRATUGAS PENGAWASAN', '0'),
(105, 'PRATUGAS PERENCANAAN', '0'),
(106, 'PROFFESIONAL STAFF', '0'),
(107, 'PROG PENGAWASAN TATA PENGAIRAN', '0'),
(108, 'PROG TEKNIK MENGGAMBAR', '0'),
(109, 'QUALITY CONTROL', '0'),
(110, 'SATPAM', '0'),
(111, 'SEISMOLOGI & TEKNOLOGI GEMPA', '0'),
(112, 'SINDER BID BM', '0'),
(113, 'SISTEM AKUNTANSI', '0'),
(114, 'SURVEY & MAPPING', '0'),
(115, 'TATA KEARSIPAN', '0'),
(116, 'TEKNIS PADAT KARYA GAYA BARU', '0'),
(117, 'TEKNOLOGI BETON', '0'),
(118, 'TEKNOLOGI GEMPA', '0'),
(119, 'TENAGA INTI', '0'),
(120, 'TENAGA PELAKSANA PEMBANGUNAN PERUMAHAN RAKYAT', '0'),
(121, 'UKUR TANAH', '0'),
(122, 'VERIFIKASI', '0'),
(123, 'UKUR TANAH & PEMETAAN', '0'),
(124, 'UKUR TANAH BID KE-AIR-AN', '0'),
(125, 'UKUR TANAH BID KE-BM-AN', '0'),
(126, 'UKUR TANAH BID KE-CK-AN', '0'),
(127, 'UKUR TANAH TK A/B', '0'),
(128, 'HYDROLOGY', '0'),
(129, 'LAND CAPABILITY EVALUATION', '0'),
(130, 'PLANNING & DESIGN', '0'),
(131, 'DESIGN OF SMALL HYDRAULIC STRUCTURES', '0'),
(132, 'IRRIGATION AND DRAINAGE LAYOUT', '0'),
(133, 'OVERVIEW OF PROJECT SELECTION THROUGH TH', '0'),
(134, 'REVIEW OF SSIMP STRUCTURE DESIGNS', '0'),
(135, 'MATHEMATICAL MODEL SIMULATION', '0'),
(136, 'SITE SELECTION-GROUND WATER', '0'),
(137, 'PENGAWASAN & PELAKSANAAN KONSTRUKSI', '0'),
(138, 'CONSTRUCTION SUPERVISION', '0'),
(139, 'WELL DESIGN & WELL CONSTRUCTION', '0'),
(140, 'CONSTRUCTION SUPERVISION TRAINING', '0'),
(141, 'LAB. TECHNICIAN TRAINING', '0'),
(142, 'KERJASAMA TEKNIK ANTAR NEGARA BERKEMBANG', '0'),
(143, 'INSTITUTIONAL DEVELOPMENT', '0'),
(144, 'WOMEN IN DEVELOPMENT', '0'),
(145, 'IRIGASI TAMBAK', '0'),
(146, 'O & M - AIR TANAH', '0'),
(147, 'O & M - IRIGASI', '0'),
(148, 'OPERATION & MAINTENANCE', '0'),
(149, 'WATER OPERATION CENTRE', '0'),
(150, 'OPERATION-ADVANCED OPERATION PROJECT', '0'),
(151, 'OPERATION-BUDGETTING', '0'),
(152, 'OPERATION-INTRODUCTION & MAINTENANCE', '0'),
(153, 'OPERATION-REQUIREMENT & MAINTENANCE', '0'),
(154, 'OPERATION-WATER DISTRIBUTION', '0'),
(155, 'INFORMATION FILM', '0'),
(156, 'KEY FARMERS', '0'),
(157, 'TRAINING IN FARM MACHINERY - OPERATORS', '0'),
(158, 'TRAINING OF ACTION GROUP', '0'),
(159, 'TRAINING OF FIELD GROUPS', '0'),
(160, 'WATER USE MANAGEMENT', '0'),
(161, 'INVENTARISASI LAPANGAN', '0'),
(162, 'PENELITIAN PENGAIRAN (PTGA)', '0'),
(163, 'PENGEMBANGAN POLA SOCIO-TECHNICAL ASSOSI', '0'),
(164, 'AGRICULTURAL DEVELOPMENT', '0'),
(165, 'ENUMERATOR TRAINING', '0'),
(166, 'TRAINING OF SURVEYORS', '0'),
(167, 'AGRO-ECONOMIC ANALYSIS', '0'),
(168, 'TEKNIK PANTAI', '0'),
(169, 'COASTAL ZONE MANAGEMENT', '0'),
(170, 'O & M - RAWA', '0'),
(171, 'KEAMANAN BENDUNGAN', '0'),
(172, 'OVERVIEW OF DAM DESIGN AND CONSTRUCTION', '0'),
(173, 'PERENCANAAN & PEMBUATAN PROGRAM', '0'),
(174, 'MANAJEMEN LALU LINTAS', '0'),
(175, 'KEAMANAN JALAN', '0'),
(176, 'KEBISINGAN LALULINTAS', '0'),
(177, 'KESELAMATAN JALAN RAYA', '0'),
(178, 'PENCEMARAN UDARA', '0'),
(179, 'PARKIR', '0'),
(180, 'PENAKSIRAN CEPAT PERGERAKAN DIPERKOTAAN', '0'),
(181, 'TANAH LEMBEK', '0'),
(182, 'PENINGKATAN KEMAMPUAN TEKNISI LABORATORIUM', '0'),
(183, 'PENGENDALIAN MUTU JALAN & JEMBATAN', '0'),
(184, 'PELAKSANAAN PEKERJAAN KONSTRUKSI JALAN', '0'),
(185, 'PELAKSANAAN PERCOBAAN PENGHAMPARAN ASPAL', '0'),
(186, 'PENANGGULANGAN EROSI LERENG JALAN', '0'),
(187, 'PENGAWAS PELAKSANA KONSTRUKSI JALAN', '0'),
(188, 'OPERATOR PERALATAN JALAN', '0'),
(189, 'PENANGANAN & PERAWATAN ALAT-ALAT KONSTR.', '0'),
(190, 'DRIVING/RIDING TRAINING', '0'),
(191, 'LEGGER JALAN', '0'),
(192, 'TATA CARA PENULISAN LAPORAN', '0'),
(193, 'PEMASYARAKATAN PRODUK HASIL PUSLITBANG', '0'),
(194, 'KOMPUTERISASI INVENTARISASI BAHAN JALAN', '0'),
(195, 'INTEGRASI KOMPUTERISASI LEGER JALAN', '0'),
(196, 'MODEL PROJECT-SEMINAR', '0'),
(197, 'METODOLOGI PENELITIAN', '0'),
(198, 'PENGGUNAAN ALAT FWD', '0'),
(199, 'PENGGUNAAN X-RAY FLOURESCENE', '0'),
(200, 'DAUR ULANG KONSTRUKSI PEKERJAAN JALAN', '0'),
(201, 'PENYEMPURNAAN STANDAR SPESIFIKASI ASPAL', '0'),
(202, 'PEMELIHARAAN RUTIN DAN BERKALA', '0'),
(203, 'PENDATAAN JALAN', '0'),
(204, 'HASIL PENELITIAN ASPAL KARET DILAPANGAN', '0'),
(205, 'DESAIN JEMBATAN', '0'),
(206, 'PERENCANAAN DAN PEMROGRAMAN JEMBATAN', '0'),
(207, 'PROSEDUR UMUM', '0'),
(208, 'GENERAL HIGHWAY COURSE', '0'),
(209, 'BRIDGE PLANNING & PROGRAMMING INSTRUCTOR', '0'),
(210, 'PLANNING & PROGRAMMING WORKSHOP', '0'),
(211, 'KONSTRUKSI EKSPANSION JOINT', '0'),
(212, 'INSPEKSI KONDISI JEMBATAN', '0'),
(213, 'PENGAWASAN PEMBANGUNAN JEMBATAN', '0'),
(214, 'KONSULTAN P3KT', '0'),
(215, 'PERKUATAN JEMBATAN', '0'),
(216, 'BRIDGE ROUTINE INSPECTION', '0'),
(217, 'BRIDGE CONSTRUCTION SUPERVISION', '0'),
(218, 'PEMELIHARAAN JEMBATAN', '0'),
(219, 'PEMELIHARAAN RUTIN & BERKALA JALAN KOTA', '0'),
(220, 'PENATAAN UNTUK TROUBLE SHOOTER', '0'),
(221, 'DESIMINASI KETATABANGUNAN', '0'),
(222, 'PENGELOLAAN & PEMANFAATAN GEDUNG NEGARA', '0'),
(223, 'KEPALA SEKSI BID.PERSAMPAHAN', '0'),
(224, 'TEKNOLOGI BANGUNAN BID PEMUKIMAN', '0'),
(225, 'LAB. BIDANG PENGUJIAN', '0'),
(226, 'MANAJEMEN PEMBANGUANAN KOTA DE', '0'),
(227, 'PEMANTAPAN MATERI TEKNIS PELATIHAN', '0'),
(228, 'PENATAAN RUANG DAERAH', '0'),
(229, 'PENATAAN RUANG', '0'),
(230, 'PENATAAN RUANG KOTA METROPOLITAN', '0'),
(231, 'PENATAAN RUANG TERBUKA UMUM', '0'),
(232, 'PENGEMBANGAN PROFESI PERENCANA', '0'),
(233, 'PENYIAPAN PROGRAM P3KT', '0'),
(234, 'MANAJEMEN KAWASAN PERKOTAAN', '0'),
(235, 'PENINGKATAN KEMAMPUAN TENAGA PENATAAN', '0'),
(236, 'PENATAAN RUANG KAWASAN PARIWISATA', '0'),
(237, 'LOKAKARYA P3KT BAGI STAF PROFESIONAL', '0'),
(238, 'PENATAAN RUANG KOTA METROPOLITAN', '0'),
(239, 'PENATAAN RUANG KOTA BARU', '0'),
(240, 'PRE COURSE IUDM', '0'),
(241, 'SISTIM INFORMASI GEOGRAFI', '0'),
(242, 'DESAIN JALAN/JEMBATAN', '0'),
(243, 'TRAINING TEHNIK KOMUNIKASI', '0'),
(244, 'COMUNICATION SAMS', '0'),
(245, 'TATA KEARSIPAN DAN PERSURATAN', '0'),
(246, 'TATALAKSANA ADMINISTRASI', '0'),
(247, 'KESEKRETARIATAN', '0'),
(248, 'PENGELOLAAN ARSIP AKTIF', '0'),
(249, 'PENYEGARAN SATPAM', '0'),
(250, 'MANAJEMEN PERKANTORAN', '0'),
(251, 'INFORMASI & KOMUNIKASI', '0'),
(252, 'KEHUMASAN', '0'),
(253, 'OPERATOR TELEX', '0'),
(254, 'PENINGKATAN KEMAMPUAN BAHASA INGGRIS', '0'),
(255, 'DHARMA WANITA CONVERSATION CLASS', '0'),
(256, 'ENGLISH FOR INKINDO ENGINEERS', '0'),
(257, 'ENGLISH FOR INTERNATIONAL COOPERATION', '0'),
(258, 'ENGLISH LEVEL II', '0'),
(259, 'ENGLISH LEVEL III', '0'),
(260, 'KETERAMPILAN PEGAWAI/ BAHASA INGGRIS', '0'),
(261, 'BPBLAV', '0'),
(262, 'TRAINING OF TRAINERS', '0'),
(263, 'TEKNIK KEINSTRUKTURAN', '0'),
(264, 'INSTRUKTUR', '0'),
(265, 'TEKNIK INSTRUKSIONAL I', '0'),
(266, 'TOT FOR ENGLISH TEACHERS', '0'),
(267, 'PENGEMBANGAN KURIKULUM DAN MEDIA', '0'),
(268, 'CURRICULUM DEVELOPMENT', '0'),
(269, 'AUDIO VISUAL', '0'),
(270, 'MANAJEMEN PELATIHAN', '0'),
(271, 'INDONESIA TRAINING NETWORK (INTN)', '0'),
(272, 'PENYEGARAN PEDIKPROP', '0'),
(273, 'MONITORING DAN EVALUASI DIKLAT', '0'),
(274, 'MANAJEMEN DIKLAT', '0'),
(275, 'RENCANA DIKLAT DAERAH', '0'),
(276, 'MANAJEMEN KOMPUTER', '0'),
(277, 'PERPUSTAKAAN', '0'),
(278, 'MANAGEMENT INFORMATION SYSTEMS', '0'),
(279, 'PENGINDRAAN JAUH & SIST INFO GEOGRAFI', '0'),
(280, 'BENDAHARAWAN PENERIMA', '0'),
(281, 'MANAJEMEN KEUANGAN', '0'),
(282, 'TATA USAHA ADMINISTRASI KEUANGAN', '0'),
(283, 'PEMBUKUAN & PENYUSUNAN LAPORAN KEUANGAN', '0'),
(284, 'FINANCIAL MANAGEMENT', '0'),
(285, 'CARA PENGADAAN KONSULTAN', '0'),
(286, 'PENGADAAN JASA KONSTRUKSI', '0'),
(287, 'PENGADAAN BARANG DAN JASA KONSULTAN', '0'),
(288, 'BIMBINGAN TEKNIS IKMN', '0'),
(289, 'MANAJEMEN PERALATAN', '0'),
(290, 'PENGADAAN BARANG', '0'),
(291, 'MANAJEMEN AUDIT', '0'),
(292, 'ADMINISTRASI BANTUAN LUAR NEGERI', '0'),
(293, 'ABLN', '0'),
(294, 'PENYULUHAN ADM. PINJAMAN LUAR NEGERI', '0'),
(295, 'MANAGEMENT DEVELOPMENT', '0'),
(296, 'PERENCANAAN TENAGA KERJA', '0'),
(297, 'PSYKOLOGI TERAPAN', '0'),
(298, 'SISTEM PENILAIAN PERFORMANCE PEGAWAI', '0'),
(299, 'SIST PEMBGN. KARIER & PENGKAJIAN KINERJA', '0'),
(300, 'KESEHATAN DAN KESELAMATAN KERJA', '0'),
(301, 'MANPOWER PLANNING INFORMATION SYSTEM', '0'),
(302, 'COORDINATION OF PLANNING & PROGRAMMING', '0'),
(303, 'MANAJEMEN PROYEK', '0'),
(304, 'PEMIMPIN PROYEK FISIK/P3F', '0'),
(305, 'TECHNICAL ASPECTS OF PROJECT MANAGEMENT', '0'),
(306, 'MANAJEMEN SKILL DAN DINAMIKA KELOMPOK', '0'),
(307, 'PRAJABATAN UMUM TINGKAT I', '0'),
(308, 'PRAJABATAN UMUM TINGKAT II', '0'),
(309, 'ASPEK HUKUM', '0'),
(310, 'PRAJABATAN UMUM TINGKAT III', '0'),
(311, 'TATA CARA PEMAKAIAN STANDAR BIDANG PU', '0'),
(312, 'INFORMASI TENTANG PTUN', '0'),
(313, 'HUKUM PERBURUHAN', '0'),
(314, 'PENERAPAN HUKUM & PERUNDANG-UNDANGAN', '0'),
(315, 'KOLOKIUM HASIL PENELITIAN & PENGEMBANGAN', '0'),
(316, 'PERENCANAAN PENANGGULANGAN BENCANA ALAM', '0'),
(317, 'PREPARATION OF TENDER DOCUMENTS', '0'),
(318, 'PROSEDUR TENDER', '0'),
(319, 'GAMBAR & ANGGARAN', '0'),
(320, 'GRAFIKA', '0'),
(321, 'TEKNIK GAMBAR & ANGGARAN', '0'),
(322, 'INSTRUKTUR WORKSHOP P3KT', '0'),
(323, 'ASISTEN TEKNISI LABORATORIUM', '0'),
(324, 'TEKNISI LABORATORIUM & REKAYASA', '0'),
(325, 'PENGAWAS LAPANGAN', '0'),
(326, 'TRAINING JOB SITE (OECF)', '0'),
(327, 'VALUE CONTROL', '0'),
(328, 'QUALITY SURVEYOR', '0'),
(329, 'SUPERVISI KONSTRUKSI', '0'),
(330, 'KETERAMPILAN MEKANIK', '0'),
(331, 'KETERAMPILAN OPERATOR', '0'),
(332, 'KETERAMPILAN OPERATOR DUMP TRUCK', '0'),
(333, 'MEKANIK DASAR', '0'),
(334, 'SIMKA', '0'),
(335, 'PENINGKATAN MEKANIK OPERATOR BUMAR WHEEL', '0'),
(336, 'PENINGKATAN MEKANIK STONE CRUSHER', '0'),
(337, 'BAHAN BANGUNAN DAN LABORATORIUM', '0'),
(338, 'PENINGKATAN LABORATORIUM', '0'),
(339, 'PENGUJIAN BAHAN (LABORATORIUM)', '0'),
(340, 'PENANGGULANGAN PENDERITA GAWAT DARURAT', '0'),
(341, 'PAKET STATISTIK', '0'),
(342, 'PENCEGAHAN BAHAYA KEBAKARAN', '0'),
(343, 'ANALISA DAMPAK LINGKUNGAN', '0'),
(344, 'STONE COLOUMN SEBAGAI REDUKSI PENURUNAN', '0'),
(345, 'SIMD UNTUK MANAJER', '0'),
(346, 'SIMD UNTUK OPERATOR', '0'),
(347, 'TRAINING LABORAN', '0'),
(348, 'FUNGSI PENGT.BID.KE-PU-AN', '0'),
(349, 'PENINGK.FUNGSI.PENGAT.BID.KE-PU-AN', '0'),
(350, 'PENGEMBANGAN SISTEM PERENC & KARIER', '0'),
(351, 'BIMBINGAN TEKNIK HUKUM', '0'),
(352, 'TEKNIK PELAKS. PROG. BUDAYA KERJA', '0'),
(353, 'TEKNIK PENYUSUNAN PEDOMAN KERJA', '0'),
(354, 'PEMBINAAN TEKNIS PASCA GEMPA', '0'),
(355, 'PENANGANAN TEKNIS BID.PERSAMPAHAN', '0'),
(356, 'APPLIED ENGINEERING', '0'),
(357, 'TEKNIS PENGT. PENATAAN BANGUNAN', '0'),
(358, 'TEKNIS PENGELOLAAN ADM. LAN', '0'),
(359, 'SINKRONISASI PERENCANAAN DAN PROGRAM', '0'),
(360, 'DESIMINASI TATACARA APLK.KEU.PROYEK', '0'),
(361, 'PENGELOLAAN ADMINISTRASI PROYEK', '0'),
(362, 'MANAJEMEN KONSTRUKSI PENGAIRAN', '0'),
(363, 'INSTRUKTUR TATAGUNA AIR', '0'),
(364, 'PENGAWAS UTAMA', '0'),
(365, 'PROGRAM D.III DALAM NAGERI', '0'),
(366, 'PROGRAM D.IV', '0'),
(367, 'PROGRAM S1 DALAM NEGERI', '0'),
(368, 'PROGRAM S2 DALAM NEGERI', '0'),
(369, 'PROGRAM S3 DALAM NEGERI', '0'),
(370, 'SIM KLN', '0'),
(371, 'PEMERIKSAAN PROGRAM/KOMPREHENSHIF', '0'),
(372, 'STANDARD PENGADAAN BARANG DAN JASA', '0'),
(373, 'PENINGK.FUNGSI PEL.TUGAS BID.KE-PU-AN', '0'),
(374, 'DASAR KEARSIPAN', '0'),
(375, 'MANAJEMEN PERPUSTAKAAN', '0'),
(376, 'APRESIASI PUSDOKINFO', '0'),
(377, 'OVERSEAS TRAINING LUAR NEGERI', '0'),
(378, 'ELECTRICAL INSTALLATION & INSTRUMENT', '0'),
(379, 'WATER SUPPLY MASTER PLANNING', '0'),
(380, 'WATER SUPPLY MANAGEMENT', '0'),
(381, 'WATER TREATMENT FACILITY PLAN & DESIGN', '0'),
(382, 'DISTRIBUTION SYSTEM PLANNING & DESIGN', '0'),
(383, 'WATER PURIFICATION', '0'),
(384, 'MAINTENANCE OF PIPELINE', '0'),
(385, 'LEAKAGE CONTROL', '0'),
(386, 'PENINGKATAN KOORDINASI PERENCANAAN', '0'),
(387, 'SINKRONISASI PROGRAM', '0'),
(388, 'AIR LIMBAH', '0'),
(389, 'MECHANICAL INSTALLATION', '0'),
(390, 'BIDANG PERSAMPAHAN', '0'),
(391, 'ORGANISASI & MANAJEMEN', '0'),
(392, 'PERSYARATAN JABATAN', '0'),
(393, 'TEKNIS KEPEGAWAIAN', '0'),
(394, '-', '-'),
(395, 'TESTING', '20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_pendidikan`
--

CREATE TABLE `tbl_master_pendidikan` (
  `id` int(11) NOT NULL,
  `pendidikan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_pendidikan`
--

INSERT INTO `tbl_master_pendidikan` (`id`, `pendidikan`) VALUES
(1, 'SD/MI'),
(2, 'SMP/Mts'),
(3, 'SMA/MA/SMK'),
(4, 'D1'),
(5, 'D2'),
(6, 'D3'),
(7, 'D4'),
(8, 'S1'),
(9, 'S2'),
(10, 'S3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_penghargaan`
--

CREATE TABLE `tbl_master_penghargaan` (
  `id_penghargaan` int(50) NOT NULL,
  `nama_penghargaan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_penghargaan`
--

INSERT INTO `tbl_master_penghargaan` (`id_penghargaan`, `nama_penghargaan`) VALUES
(1, 'BINTANG BINTANG DI LANGIT'),
(2, 'BINTANG REPUBLIK INDONESIA ADIPURNA'),
(3, 'BINTANG REPUBLIK INDONESIA ADIPRADANA'),
(4, 'BINTANG REPUBLIK INDONESIA UTAMA'),
(5, 'BINTANG REPUBLIK INDONESIA PRATAMA'),
(6, 'BINTANG REPUBLIK INDONESIA NARARYA'),
(7, 'BINTANG MAHAPUTERA'),
(8, 'BINTANG MAHAPUTERA ADIPURNA'),
(9, 'BINTANG MAHAPUTERA ADIPRADANA'),
(10, 'BINTANG MAHAPUTERA UTAMA'),
(11, 'BINTANG MAHAPUTERA PRATAMA'),
(12, 'BINTANG MAHAPUTERA NARARYA'),
(13, 'BINTANG JASA'),
(14, 'BINTANG JASA UTAMA'),
(15, 'BINTANG JASA PRATAMA'),
(16, 'BINTANG JASA NARARYA'),
(17, 'BINTANG YUDHA DHARMA'),
(18, 'BINTANG YUDHA DHARMA UTAMA'),
(19, 'BINTANG YUDHA DHARMA PRATAMA'),
(20, 'BINTANG YUDHA DHARMA NARARYA'),
(21, 'BINTANG KARTIKA EKA PAKSI'),
(22, 'BINTANG KARTIKA EKA PAKSI UTAMA'),
(23, 'BINTANG KARTIKA EKA PAKSI PRATAMA'),
(24, 'BINTANG KARTIKA EKA PAKSI NARARYA'),
(25, 'BINTANG JALASENA'),
(26, 'BINTANG JALASENA UTAMA'),
(27, 'BINTANG JALASENA PRATAMA'),
(28, 'BINTANG JALASENA NARARYA'),
(29, 'BINTANG SWA BHUWANA PAKSA'),
(30, 'BINTANG SWA BHUWANA PAKSA UTAMA'),
(31, 'BINTANG SWA BHUWANA PAKSA PRATAMA'),
(32, 'BINTANG SWA BHUWANA PAKSA NARARYA'),
(33, 'BINTANG BHAYANGKARA'),
(34, 'BINTANG BHAYANGKARA UTAMA'),
(35, 'BINTANG BHAYANGKARA PRATAMA'),
(36, 'BINTANG BHAYANGKARA NARARYA'),
(37, 'BINTANG GARUDA'),
(38, 'BINTANG SEWINDU ANGKATAN PERANG RI'),
(39, 'SATYALANCANA BHAKTI'),
(40, 'SATYALANCANA TELADAN'),
(41, 'SATYALANCANA KESETIAAN'),
(42, 'SATYALANCANA KESETIAAN 8 TAHUN'),
(43, 'SATYALANCANA KESETIAAN 16 TAHUN'),
(44, 'SATYALANCANA KESETIAAN 24 TAHUN'),
(45, 'SATYALANCANA PERANG KEMERDEKAAN'),
(46, 'SATYALANCANA PERANG KEMERDEKAAN KELAS I'),
(47, 'SATYALANCANA PERANG KEMERDEKAAN KELAS II'),
(48, 'SATYALANCANA SAPTAMARGA'),
(49, 'SATYALANCANA GOM'),
(50, 'SATYALANCANA GOM KELAS I'),
(51, 'SATYALANCANA GOM KELAS II'),
(52, 'SATYALANCANA GOM KELAS III'),
(53, 'SATYALANCANA GOM KELAS IV'),
(54, 'SATYALANCANA GOM KELAS V'),
(55, 'SATYALANCANA GOM KELAS VI'),
(56, 'SATYALANCANA GOM KELAS VII'),
(57, 'SATYALANCANA GOM KELAS VIII'),
(58, 'SATYALANCANA GOM KELAS IX'),
(59, 'SATYALANCANA PERINTIS PERGERAKAN KEMERDEKAAN'),
(60, 'SATYALANCANA PERINGATAN PERJUANGAN KEMERDEKAAN'),
(61, 'SATYALANCANA PEMBANGUNAN'),
(62, 'SATYALANCANA KARYA SATYA'),
(63, 'SATYALANCANA KARYA SATYA KELAS I'),
(64, 'SATYALANCANA KARYA SATYA KELAS II'),
(65, 'SATYALANCANA KARYA SATYA KELAS III'),
(66, 'SATYALANCANA KARYA SATYA KELAS IV'),
(67, 'SATYALANCANA KARYA SATYA KELAS V'),
(68, 'SATYALANCANA KARYA SATYA XXX TAHUN'),
(69, 'SATYALANCANA KARYA SATYA XX TAHUN'),
(70, 'SATYALANCANA KARYA SATYA X TAHUN'),
(71, 'SATYALANCANA KEBAKTIAN SOSIAL'),
(72, 'SATYALANCANA KEBUDAYAAN'),
(73, 'SATYALANCANA JASA DHARMA ANGKATAN LAUT'),
(74, 'SATYALANCANA SATYA DASA WARSA POLRI'),
(75, 'SATYALANCANA JANA UTAMA'),
(76, 'SATYALANCANA KSATRYA TAMTAMA'),
(77, 'SATYALANCANA KARYA BHAKTI'),
(78, 'SATYALANCANA PRASETYA PANCA WARSA'),
(79, 'SATYALANCANA KEAMANAN'),
(80, 'SATYALANCANA WIRA KARYA'),
(81, 'SATYALANCANA SATYA DHARMA'),
(82, 'SATYALANCANA WIRA DHARMA'),
(83, 'SATYALANCANA YUDHA UTAMA KKO-AL'),
(84, 'SATYALANCANA YUDHA UTAMA KKO-AL KELAS I'),
(85, 'SATYALANCANA YUDHA UTAMA KKO-AL KELAS II'),
(86, 'SATYALANCANA DWIYA SISTHA'),
(87, 'SATYALANCANA PENEGAK'),
(88, 'SATYALANCANA PEPERA'),
(89, 'PIAGAM SATYA KARYA'),
(90, 'PIAGAM SATYA KARYA 20 TAHUN'),
(91, 'PIAGAM SATYA KARYA 30 TAHUN'),
(92, 'PIAGAM PENGHARGAAN ATAS JASA KHUSUS TEK.KEKARYAAN'),
(93, 'PIAGAM PENGHARGAAN TELADAN'),
(94, 'PIAGAM PENGHARGAAN TELADAN KEPEMIMPINAN'),
(95, 'PIAGAM PENGHARGAAN TELADAN KEPEGAWAIAN'),
(96, 'PIAGAM PENGHARGAAN TELADAN PELAK. TUGAS'),
(97, 'PIAGAM PENGHARGAAN ANUMERTA'),
(98, 'PIAGAM PENGHARGAAN KHUSUS'),
(99, 'SATYALANCANA SANTI DHARMA'),
(100, 'SATYALANCANA SEROJA'),
(101, 'SATYALANCANA PENDIDIKAN'),
(102, 'NUGRAHA SAKANTI JANA UTAMA'),
(103, 'NUGRAHA SAKANTI KSATRYA TAMTAMA'),
(104, 'NUGRAHA SAKANTI KARYA BHAKTI'),
(105, 'SAM KARYA NUGRAHA'),
(106, 'PRASAMYA PURNAKARYA NUGRAHA'),
(107, 'BINTANG SAKTI'),
(108, 'BINTANG DHARMA'),
(109, 'BINTANG GERILYA'),
(110, 'BINTANG BUDAYA PARAMA DHARMA'),
(111, 'SATYALANCANA PERISTIWA'),
(112, 'LAIN-LAIN'),
(113, '-'),
(114, 'PENGHARGAAN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_ppk`
--

CREATE TABLE `tbl_master_ppk` (
  `id_ppk` int(50) NOT NULL,
  `nama_ppk` varchar(150) NOT NULL,
  `parent_satuan_kerja` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_ppk`
--

INSERT INTO `tbl_master_ppk` (`id_ppk`, `nama_ppk`, `parent_satuan_kerja`) VALUES
(31, 'TESTING', 'TESTING'),
(32, 'PPK Pelaksanaan Jalan Bebas Hambatan Medan - Kuala Namu', 'PELAKSANAAN JALAN BEBAS HAMBATAN MEDAN - KUALANAMU'),
(33, 'PPK Perencanaan dan Pengawasan Jalan Bebas Hambatan Medan-Kuala Namu', 'PELAKSANAAN JALAN BEBAS HAMBATAN MEDAN - KUALANAMU'),
(34, 'PPK1 (Bts. Sumut - Simpang Kulim)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI RIAU'),
(35, 'PPK 2 (Simpang Batam - Dumai)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI RIAU'),
(36, 'PPK 3 (Simpang Palas - Pekanbaru)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI RIAU'),
(37, 'PPK 4 (Jalan Subrantas Pekanbaru - Rantau Berangin - Batas Sumbar)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI RIAU'),
(38, 'PPK 5 (Pekanbaru - Batas Kampar - Simpang Lago)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI RIA'),
(39, 'PPK 6 (Simpang Lago - Batas Inhu - Simpang Jayapura)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI RIA'),
(40, 'PPK 7 (Simpang Jayapura - Siberida - Batas Jambi)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI RIA'),
(41, 'PPK 8 (Pematang Reba - Rengat - Kuala Enok)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI RIA'),
(42, 'PPK 9 (Batas Kuansing - Taluk Kuantan - Batas Sumbar)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI RIA'),
(43, 'PPK Perencanaan Dan Pengawasan Jalan Nasional Prov. Riau', 'PERENCANAAN DAN PENGAWASAN JALAN NASIONAL PROVINSI'),
(44, 'PPK 1 (Pulau Bintan)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI KEPU'),
(45, 'PPK 2 (Pulau Batam dan Pulau Galang)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI KEPU'),
(46, 'PPK 3 (Pulau Karimun dan Pulau Kundur)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI KEPU'),
(47, 'PPK 4 (Pulau Natuna)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI KEPU'),
(48, 'PPK Perencanaan Dan Pengawasan Jalan Nasional Prov. Kepulauan Riau', 'PERENCANAAN DAN PENGAWASAN JALAN NASIONAL PROVINSI'),
(49, 'PPK 7 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Payakumbuh dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI SUMB'),
(50, 'PPK 8 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Lubuk Sikaping dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI SUMB'),
(51, 'PPK 9 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Ujung Gading dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI SUMB'),
(52, 'PPK 10 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Pariaman dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI SUMB'),
(53, 'PPK 11 (Pembangunan jembatan kelok)', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI SUMB'),
(54, 'PPK 6 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Padang Panjang dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI SUM'),
(55, 'PPK 12 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Solok dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI SUM'),
(56, 'PPK 13 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Dharmasraya dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI SUM'),
(57, 'PPK 14 (Pelaksanaan Preservasi dan Peningkatan Kapasitas Jalan dan Jembatan Nasional Painan dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI SUM'),
(58, 'PPK 15 (Pelaksanaan Preservasi dan Peningkatan Kualitas Kapasitas Jalan dan Jembatan Nasional Indarapura dan Sekitarnya)', 'PELAKSANAAN JALAN NASIONAL WILAYAH II PROVINSI SUM'),
(59, 'PPK Perencanaan Dana Pengawasan Jalan Nasional Provinsi Sumatera Barat', 'PERENCANAAN DAN PENGAWASAN JALAN NASIONAL PROVINSI'),
(60, 'PPK. 2 Batas Riau - Batas Kab. Tanjab', 'PELAKSANAAN JALAN NASIONAL WILAYAH I PROVINSI JAMB'),
(512, 'TESTING', 'TESTING');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_satuan_kerja`
--

CREATE TABLE `tbl_master_satuan_kerja` (
  `id_satuan_kerja` int(50) NOT NULL,
  `nama_satuan_kerja` varchar(150) NOT NULL,
  `parent_unit` varchar(50) NOT NULL,
  `alamat` varchar(114) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_satuan_kerja`
--

INSERT INTO `tbl_master_satuan_kerja` (`id_satuan_kerja`, `nama_satuan_kerja`, `parent_unit`, `alamat`) VALUES
(5, 'BAPPEDA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(4, 'SATUAN POL PP KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(3, 'INSPEKTORAT KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(2, 'SEKRETARIAT DPRD KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(1, 'SEKRETARIAT DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(6, 'BADAN PENGELOLA KEUANGAN DAN ASET DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(7, 'BADAN KEPEGAWAIAN, PENDIDIKAN DAN PELATIHAN DAERAH', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(8, 'BADAN PENGELOLA PAJAK DAN RETRIBUSI DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(9, 'BADAN PENELITIAN DAN PENGEMBANGAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(10, 'BADAN KESATUAN BANGSA DAN POLITIK KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(11, 'BADAN PENANGGULANGAN BENCANA KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(12, 'DINAS PARIWISATA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(13, 'DINAS KELAUTAN DAN PERIKANAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(14, 'DINAS PEMBERDAYAAN PEREMPUAN DAN PERLINDUNGAN ANAK KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(15, 'DINAS PENDIDIKAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(16, 'DINAS KESEHATAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(17, 'DINAS PERHUBUNGAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(18, 'DINAS PEKERJAAN UMUM DAN PENATAAN RUANG KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(19, 'DINAS KOPERASI DAN UKM KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(20, 'DINAS TRANSMIGRASI KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(21, 'DINAS PERTANIAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(22, 'DINAS PERINDUSTRIAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(23, 'DINAS KEPENDUDUKAN DAN PENCATATAN SIPIL KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(24, 'DINAS KEPEMUDAAN DAN OLAHRAGA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(25, 'DINAS SOSIAL KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(26, 'DINAS PENGENDALIAN PENDUDUKAN DAN KB KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(27, 'DINAS LINGKUNGAN HIDUP KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(28, 'DINAS KOMINFO DAN PERSANDIAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(29, 'DINAS KETAHANAN PANGAN KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(30, 'DINAS PEMBERDAYAAN DAN DESA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(31, 'DINAS PENANAMAN MODAL DAN PELAYANAN PTSP KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(32, 'DINAS KEARSIPAN DAN PERPUSTAKAAN DAERAH KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(33, 'DINAS PEMADAM KEBAKARAN KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(34, 'DINAS TENAGA KERJA KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(35, 'DINAS PERDAGANGAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(36, 'DINAS PERUMAHAN DAN KAWASAN PERMUKIMAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(37, 'DINAS KEBUDAYAAN KAB. BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(38, 'RUMAH SAKIT UMUM DAERAH KABUPATEN BUTON', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(39, 'KECAMATAN PASARWAJO', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(40, 'KECAMATAN WABULA', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(41, 'KECAMATAN WOLOWA', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(42, 'KECAMATAN SIOTAPINA', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(43, 'KECAMATAN LASALIMU', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(44, 'KECAMATAN LASALIMU SELATAN', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON'),
(45, 'KECAMATAN KAPONTORI', 'PEMERINTAH KABUPATEN BUTON', 'PASAR WAJO, KABUPATEN BUTON');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_status_dalam_keluarga`
--

CREATE TABLE `tbl_master_status_dalam_keluarga` (
  `id` int(11) NOT NULL,
  `status_keluarga` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_status_dalam_keluarga`
--

INSERT INTO `tbl_master_status_dalam_keluarga` (`id`, `status_keluarga`) VALUES
(1, 'Suami'),
(2, 'Istri'),
(3, 'Anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_status_jabatan`
--

CREATE TABLE `tbl_master_status_jabatan` (
  `id_status_jabatan` int(50) NOT NULL,
  `nama_jabatan` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_status_jabatan`
--

INSERT INTO `tbl_master_status_jabatan` (`id_status_jabatan`, `nama_jabatan`) VALUES
(2, 'REGULER'),
(3, 'REGULER PILIHAN (JABATAN STRUKTURAL)'),
(4, 'PILIHAN (JABATAN FUNGSIONAL)'),
(5, 'PILIHAN (PENYESUAIAN IJAZAH)'),
(6, 'GOLONGAN DARI PENGADAAN CPNS/PNS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_status_kawin`
--

CREATE TABLE `tbl_master_status_kawin` (
  `id` int(11) NOT NULL,
  `status_kawin` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_status_kawin`
--

INSERT INTO `tbl_master_status_kawin` (`id`, `status_kawin`) VALUES
(1, 'Belum Kawin'),
(2, 'Kawin'),
(3, 'Janda'),
(4, 'Duda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_status_pegawai`
--

CREATE TABLE `tbl_master_status_pegawai` (
  `id_status_pegawai` int(50) NOT NULL,
  `nama_status` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_status_pegawai`
--

INSERT INTO `tbl_master_status_pegawai` (`id_status_pegawai`, `nama_status`) VALUES
(1, 'PENSIUN'),
(3, 'AKTIF'),
(4, 'MENINGGAL'),
(5, 'PNS AKTIF'),
(6, 'CPNS'),
(7, 'MASA PERSIAPAN PENSIUN');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_master_unit_kerja`
--

CREATE TABLE `tbl_master_unit_kerja` (
  `id_unit_kerja` int(50) NOT NULL,
  `nama_unit_kerja` varchar(150) NOT NULL,
  `eselon` varchar(50) NOT NULL,
  `parent_unit` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_master_unit_kerja`
--

INSERT INTO `tbl_master_unit_kerja` (`id_unit_kerja`, `nama_unit_kerja`, `eselon`, `parent_unit`) VALUES
(1, 'DIREKTORAT JENDERAL BINA MARGA', 'I.a', ''),
(2, 'SEKRETARIAT DIREKTORAT JENDERAL BINA MARGA', 'II.a', 'DIREKTORAT JENDERAL BINA MARGA'),
(31, 'BALAI PELAKSANAAN JALAN NASIONAL XI, DITJEN BINA MARGA', 'III.b', 'DIREKTORAT JENDERAL BINA MARGA'),
(32, 'SUB BAGIAN TATA USAHA, BPJN XI, DITJEN BINA MARGA', 'IV.a', 'BALAI PELAKSANAAN JALAN NASIONAL XI, DITJEN BINA M'),
(33, 'SEKSI PERENCANAAN DAN PELAKSANA, BPJN XI, DITJEN BINA MARGA', 'IV.a', 'BALAI PELAKSANAAN JALAN NASIONAL XI, DITJEN BINA M'),
(34, 'SEKSI PENGENDALIAN SISTEM, PELAKSANAAN, PENGUJIAN DAN PERALATAN, BPJN XI, DITJEN BINA MARGA', 'IV.a', 'BALAI PELAKSANAAN JALAN NASIONAL XI, DITJEN BINA M');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_mhs_pt` int(11) DEFAULT NULL,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `repassword` varchar(114) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `hostname` varchar(20) DEFAULT NULL,
  `port` varchar(20) DEFAULT NULL,
  `userfeeder` varchar(114) DEFAULT NULL,
  `passfeeder` varchar(114) DEFAULT NULL,
  `jabatan` int(11) NOT NULL,
  `profile` varchar(114) NOT NULL DEFAULT 'avatar.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `id_mhs_pt`, `ip_address`, `username`, `password`, `repassword`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `hostname`, `port`, `userfeeder`, `passfeeder`, `jabatan`, `profile`) VALUES
(1, NULL, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', 'password', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1526385268, 1, 'Admin', 'istrator', 'ADMIN', '08239566666', 'localhost', '8082', '091006', 'palagimatA', 3, 'avatar.jpg'),
(15, NULL, '::1', 'ejhayoe', '$2y$08$sMK/KvMzOXPZBanMhhAggu4A6FQ2EWRNvY4hpJNoGpjgzgqhZF9xW', 'ejhayoe', NULL, 'admin@admin.com', NULL, NULL, NULL, NULL, 1519736735, NULL, 1, 'Reza', 'Rafiq', 'Sistem Informasi Kepegawaian', '123456789', NULL, NULL, NULL, NULL, 0, 'avatar.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users_groups`
--

CREATE TABLE `tbl_users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tbl_users_groups`
--

INSERT INTO `tbl_users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(48, 15, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user_login`
--

CREATE TABLE `tbl_user_login` (
  `id_user_login` int(10) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `stts` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user_login`
--

INSERT INTO `tbl_user_login` (`id_user_login`, `username`, `password`, `nama_lengkap`, `stts`) VALUES
(1, 'admin', 'ef75d152cf5d3fc1852bf5cc9dfd080f', 'Administrator', 'administrator');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_data_dp3`
--
ALTER TABLE `tbl_data_dp3`
  ADD PRIMARY KEY (`id_dp3`);

--
-- Indexes for table `tbl_data_gaji_pokok`
--
ALTER TABLE `tbl_data_gaji_pokok`
  ADD PRIMARY KEY (`id_gaji_pokok`);

--
-- Indexes for table `tbl_data_hukuman`
--
ALTER TABLE `tbl_data_hukuman`
  ADD PRIMARY KEY (`id_hukuman`);

--
-- Indexes for table `tbl_data_keluarga`
--
ALTER TABLE `tbl_data_keluarga`
  ADD PRIMARY KEY (`id_data_keluarga`);

--
-- Indexes for table `tbl_data_organisasi`
--
ALTER TABLE `tbl_data_organisasi`
  ADD PRIMARY KEY (`id_organisasi`);

--
-- Indexes for table `tbl_data_pegawai`
--
ALTER TABLE `tbl_data_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tbl_data_pelatihan`
--
ALTER TABLE `tbl_data_pelatihan`
  ADD PRIMARY KEY (`id_pelatihan`);

--
-- Indexes for table `tbl_data_pendidikan`
--
ALTER TABLE `tbl_data_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `tbl_data_penghargaan`
--
ALTER TABLE `tbl_data_penghargaan`
  ADD PRIMARY KEY (`id_penghargaan`);

--
-- Indexes for table `tbl_data_riwayat_golongan`
--
ALTER TABLE `tbl_data_riwayat_golongan`
  ADD PRIMARY KEY (`id_riwayat_golongan`);

--
-- Indexes for table `tbl_data_riwayat_jabatan`
--
ALTER TABLE `tbl_data_riwayat_jabatan`
  ADD PRIMARY KEY (`id_riwayat_jabatan`);

--
-- Indexes for table `tbl_data_riwayat_pangkat`
--
ALTER TABLE `tbl_data_riwayat_pangkat`
  ADD PRIMARY KEY (`id_riwayat_pangkat`);

--
-- Indexes for table `tbl_data_seminar`
--
ALTER TABLE `tbl_data_seminar`
  ADD PRIMARY KEY (`id_seminar`);

--
-- Indexes for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_honorer`
--
ALTER TABLE `tbl_honorer`
  ADD PRIMARY KEY (`id_honorer`);

--
-- Indexes for table `tbl_info_pt`
--
ALTER TABLE `tbl_info_pt`
  ADD PRIMARY KEY (`id_info_pt`);

--
-- Indexes for table `tbl_jk`
--
ALTER TABLE `tbl_jk`
  ADD PRIMARY KEY (`id_jk`);

--
-- Indexes for table `tbl_login_attempts`
--
ALTER TABLE `tbl_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_agama`
--
ALTER TABLE `tbl_master_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indexes for table `tbl_master_eselon`
--
ALTER TABLE `tbl_master_eselon`
  ADD PRIMARY KEY (`id_eselon`);

--
-- Indexes for table `tbl_master_golongan`
--
ALTER TABLE `tbl_master_golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indexes for table `tbl_master_hukuman`
--
ALTER TABLE `tbl_master_hukuman`
  ADD PRIMARY KEY (`id_hukuman`);

--
-- Indexes for table `tbl_master_jabatan`
--
ALTER TABLE `tbl_master_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tbl_master_jenis_jabatan`
--
ALTER TABLE `tbl_master_jenis_jabatan`
  ADD PRIMARY KEY (`id_jenis_jabatan`);

--
-- Indexes for table `tbl_master_lokasi_kerja`
--
ALTER TABLE `tbl_master_lokasi_kerja`
  ADD PRIMARY KEY (`id_lokasi_kerja`);

--
-- Indexes for table `tbl_master_lokasi_pelatihan`
--
ALTER TABLE `tbl_master_lokasi_pelatihan`
  ADD PRIMARY KEY (`id_lokasi_pelatihan`);

--
-- Indexes for table `tbl_master_pelatihan`
--
ALTER TABLE `tbl_master_pelatihan`
  ADD PRIMARY KEY (`id_pelatihan`);

--
-- Indexes for table `tbl_master_pendidikan`
--
ALTER TABLE `tbl_master_pendidikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_penghargaan`
--
ALTER TABLE `tbl_master_penghargaan`
  ADD PRIMARY KEY (`id_penghargaan`);

--
-- Indexes for table `tbl_master_ppk`
--
ALTER TABLE `tbl_master_ppk`
  ADD PRIMARY KEY (`id_ppk`);

--
-- Indexes for table `tbl_master_satuan_kerja`
--
ALTER TABLE `tbl_master_satuan_kerja`
  ADD PRIMARY KEY (`id_satuan_kerja`);

--
-- Indexes for table `tbl_master_status_dalam_keluarga`
--
ALTER TABLE `tbl_master_status_dalam_keluarga`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_status_jabatan`
--
ALTER TABLE `tbl_master_status_jabatan`
  ADD PRIMARY KEY (`id_status_jabatan`);

--
-- Indexes for table `tbl_master_status_kawin`
--
ALTER TABLE `tbl_master_status_kawin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_master_status_pegawai`
--
ALTER TABLE `tbl_master_status_pegawai`
  ADD PRIMARY KEY (`id_status_pegawai`);

--
-- Indexes for table `tbl_master_unit_kerja`
--
ALTER TABLE `tbl_master_unit_kerja`
  ADD PRIMARY KEY (`id_unit_kerja`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_users_groups`
--
ALTER TABLE `tbl_users_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_login`
--
ALTER TABLE `tbl_user_login`
  ADD PRIMARY KEY (`id_user_login`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_data_dp3`
--
ALTER TABLE `tbl_data_dp3`
  MODIFY `id_dp3` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tbl_data_gaji_pokok`
--
ALTER TABLE `tbl_data_gaji_pokok`
  MODIFY `id_gaji_pokok` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_data_hukuman`
--
ALTER TABLE `tbl_data_hukuman`
  MODIFY `id_hukuman` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_data_keluarga`
--
ALTER TABLE `tbl_data_keluarga`
  MODIFY `id_data_keluarga` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_data_organisasi`
--
ALTER TABLE `tbl_data_organisasi`
  MODIFY `id_organisasi` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_data_pegawai`
--
ALTER TABLE `tbl_data_pegawai`
  MODIFY `id_pegawai` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tbl_data_pelatihan`
--
ALTER TABLE `tbl_data_pelatihan`
  MODIFY `id_pelatihan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_data_pendidikan`
--
ALTER TABLE `tbl_data_pendidikan`
  MODIFY `id_pendidikan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tbl_data_penghargaan`
--
ALTER TABLE `tbl_data_penghargaan`
  MODIFY `id_penghargaan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_data_riwayat_golongan`
--
ALTER TABLE `tbl_data_riwayat_golongan`
  MODIFY `id_riwayat_golongan` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_data_riwayat_jabatan`
--
ALTER TABLE `tbl_data_riwayat_jabatan`
  MODIFY `id_riwayat_jabatan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_data_riwayat_pangkat`
--
ALTER TABLE `tbl_data_riwayat_pangkat`
  MODIFY `id_riwayat_pangkat` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `tbl_data_seminar`
--
ALTER TABLE `tbl_data_seminar`
  MODIFY `id_seminar` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_groups`
--
ALTER TABLE `tbl_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tbl_honorer`
--
ALTER TABLE `tbl_honorer`
  MODIFY `id_honorer` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_info_pt`
--
ALTER TABLE `tbl_info_pt`
  MODIFY `id_info_pt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_jk`
--
ALTER TABLE `tbl_jk`
  MODIFY `id_jk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_login_attempts`
--
ALTER TABLE `tbl_login_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_master_agama`
--
ALTER TABLE `tbl_master_agama`
  MODIFY `id_agama` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tbl_master_eselon`
--
ALTER TABLE `tbl_master_eselon`
  MODIFY `id_eselon` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `tbl_master_golongan`
--
ALTER TABLE `tbl_master_golongan`
  MODIFY `id_golongan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `tbl_master_hukuman`
--
ALTER TABLE `tbl_master_hukuman`
  MODIFY `id_hukuman` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_master_jabatan`
--
ALTER TABLE `tbl_master_jabatan`
  MODIFY `id_jabatan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_master_jenis_jabatan`
--
ALTER TABLE `tbl_master_jenis_jabatan`
  MODIFY `id_jenis_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_master_lokasi_kerja`
--
ALTER TABLE `tbl_master_lokasi_kerja`
  MODIFY `id_lokasi_kerja` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `tbl_master_lokasi_pelatihan`
--
ALTER TABLE `tbl_master_lokasi_pelatihan`
  MODIFY `id_lokasi_pelatihan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `tbl_master_pelatihan`
--
ALTER TABLE `tbl_master_pelatihan`
  MODIFY `id_pelatihan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=396;
--
-- AUTO_INCREMENT for table `tbl_master_pendidikan`
--
ALTER TABLE `tbl_master_pendidikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_master_penghargaan`
--
ALTER TABLE `tbl_master_penghargaan`
  MODIFY `id_penghargaan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `tbl_master_ppk`
--
ALTER TABLE `tbl_master_ppk`
  MODIFY `id_ppk` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;
--
-- AUTO_INCREMENT for table `tbl_master_satuan_kerja`
--
ALTER TABLE `tbl_master_satuan_kerja`
  MODIFY `id_satuan_kerja` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;
--
-- AUTO_INCREMENT for table `tbl_master_status_dalam_keluarga`
--
ALTER TABLE `tbl_master_status_dalam_keluarga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_master_status_jabatan`
--
ALTER TABLE `tbl_master_status_jabatan`
  MODIFY `id_status_jabatan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_master_status_kawin`
--
ALTER TABLE `tbl_master_status_kawin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_master_status_pegawai`
--
ALTER TABLE `tbl_master_status_pegawai`
  MODIFY `id_status_pegawai` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_master_unit_kerja`
--
ALTER TABLE `tbl_master_unit_kerja`
  MODIFY `id_unit_kerja` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tbl_users_groups`
--
ALTER TABLE `tbl_users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `tbl_user_login`
--
ALTER TABLE `tbl_user_login`
  MODIFY `id_user_login` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
