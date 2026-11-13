import 'package:flutter/material.dart';

void main() {
  runApp(const TabungKuApp());
}

/// Aplikasi utama TabungKu.
///
/// Tugas Minggu 3: menyusun layout layar "Ringkasan Tabungan" hanya dengan
/// widget dasar Flutter (tanpa paket pihak ketiga).
class TabungKuApp extends StatelessWidget {
  const TabungKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Skema warna hijau dipakai konsisten di seluruh halaman.
    final ColorScheme warna = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B7F5C),
    );

    return MaterialApp(
      title: 'TabungKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: warna,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF3F7F5),
        // AppBar hijau dengan judul putih agar kontras dan mudah dibaca.
        appBarTheme: AppBarTheme(
          backgroundColor: warna.primary,
          foregroundColor: warna.onPrimary,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: warna.onPrimary,
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const RingkasanPage(),
    );
  }
}

/// Model data sederhana untuk satu transaksi.
///
/// Data masih statis (hard-coded) sesuai ketentuan tugas.
class Transaksi {
  const Transaksi({
    required this.judul,
    required this.tanggal,
    required this.nominal,
    required this.masuk,
    required this.icon,
  });

  final String judul;
  final String tanggal;
  final String nominal;
  final bool masuk;
  final IconData icon;
}

/// Halaman utama yang menampilkan ringkasan tabungan.
class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  /// Daftar transaksi contoh (statis) untuk latihan layout.
  static const List<Transaksi> _daftarTransaksi = <Transaksi>[
    Transaksi(
      judul: 'Menabung rutin',
      tanggal: '12 Nov 2026',
      nominal: '+Rp 500.000',
      masuk: true,
      icon: Icons.savings_outlined,
    ),
    Transaksi(
      judul: 'Beli buku pelajaran',
      tanggal: '10 Nov 2026',
      nominal: '-Rp 150.000',
      masuk: false,
      icon: Icons.menu_book_outlined,
    ),
    Transaksi(
      judul: 'Menabung mingguan',
      tanggal: '08 Nov 2026',
      nominal: '+Rp 250.000',
      masuk: true,
      icon: Icons.savings_outlined,
    ),
    Transaksi(
      judul: 'Tarik untuk kebutuhan',
      tanggal: '05 Nov 2026',
      nominal: '-Rp 100.000',
      masuk: false,
      icon: Icons.shopping_bag_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. AppBar: judul halaman sesuai ketentuan tugas.
      appBar: AppBar(title: const Text('Ringkasan Tabungan')),
      // 2. SafeArea menjaga konten tidak tertutup notch/status bar.
      body: SafeArea(
        // 3. LayoutBuilder dipakai untuk menyesuaikan jarak pada ponsel
        //    (lebar < 600) dan tablet (lebar >= 600).
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool layarTablet = constraints.maxWidth >= 600;
            final double paddingHorizontal = layarTablet ? 32.0 : 16.0;

            // 4. SingleChildScrollView mencegah overflow saat konten lebih
            //    tinggi dari layar (misalnya pada ponsel potret).
            return SingleChildScrollView(
              // 5. Center + ConstrainedBox membatasi lebar konten di tablet
              //    agar teks tidak melebar terlalu jauh.
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: paddingHorizontal,
                      vertical: 20,
                    ),
                    child: Column(
                      // Konten mengisi lebar yang tersedia.
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // 6. Kartu ringkasan saldo dan target tabungan.
                        const _KartuSaldo(),
                        const SizedBox(height: 16),
                        // 7. Tiga tombol kategori: Menabung, Tarik, Riwayat.
                        const _BarisAksi(),
                        const SizedBox(height: 24),
                        // 8. Judul bagian daftar transaksi.
                        _JudulBagian(
                          onLihatSemua: () =>
                              _tampilkanPesan(context, 'Lihat semua transaksi'),
                        ),
                        const SizedBox(height: 12),
                        // 9. Daftar transaksi (minimal tiga item).
                        const _DaftarTransaksi(daftar: _daftarTransaksi),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Umpan balik singkat ketika tombol kategori ditekan.
  void _tampilkanPesan(BuildContext context, String label) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$label: fitur akan dibuat pada pertemuan berikutnya.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
  }
}

/// Kartu berisi nama tabungan, saldo, dan target.
class _KartuSaldo extends StatelessWidget {
  const _KartuSaldo();

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;

    // Card membungkus Container bergradien agar sudutnya tetap membulat.
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shadowColor: warna.primary.withValues(alpha: 0.35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        // Padding memberi jarak isi kartu dari tepi.
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[warna.primary, const Color(0xFF0E5138)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Row: nama tabungan di kiri, ikon di kanan.
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Tabungan Utama',
                        style: TextStyle(
                          color: warna.onPrimary.withValues(alpha: 0.8),
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dana Pendidikan',
                        style: TextStyle(
                          color: warna.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container bulat sebagai latar ikon tabungan.
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: warna.onPrimary.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.savings_outlined,
                    color: warna.onPrimary,
                    size: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Label dan nominal saldo saat ini.
            Text(
              'Saldo saat ini',
              style: TextStyle(
                color: warna.onPrimary.withValues(alpha: 0.8),
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Rp 2.450.000',
              style: TextStyle(
                color: warna.onPrimary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 18),
            // Row: target di kiri, persentase di kanan.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Expanded membuat teks target dapat menyusut/ellipsis.
                Expanded(
                  child: Text(
                    'Target: Rp 5.000.000',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: warna.onPrimary.withValues(alpha: 0.9),
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '49%',
                  style: TextStyle(
                    color: warna.onPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Progress bar manual: Container luar + Container dalam.
            // alignment: Alignment.centerLeft membuat isian mulai dari kiri.
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints batas) {
                return Container(
                  height: 8,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: warna.onPrimary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    width: batas.maxWidth * 0.49,
                    decoration: BoxDecoration(
                      color: warna.onPrimary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Baris tiga tombol kategori dengan lebar yang sama.
class _BarisAksi extends StatelessWidget {
  const _BarisAksi();

  @override
  Widget build(BuildContext context) {
    // Row + Expanded membagi lebar secara merata; SizedBox memberi jarak.
    return const Row(
      children: <Widget>[
        Expanded(
          child: _TombolAksi(icon: Icons.add_circle_outline, label: 'Menabung'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _TombolAksi(
            icon: Icons.arrow_downward_rounded,
            label: 'Tarik',
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: _TombolAksi(icon: Icons.history_rounded, label: 'Riwayat'),
        ),
      ],
    );
  }
}

/// Satu tombol kategori berisi ikon dan label.
class _TombolAksi extends StatelessWidget {
  const _TombolAksi({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: warna.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  '$label: fitur akan dibuat pada pertemuan berikutnya.',
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
        },
        child: Padding(
          // Padding vertikal/horizontal mengatur jarak ikon dan label.
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Ikon di dalam lingkaran berwarna lembut.
              Container(
                width: 42,
                height: 42,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: warna.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: warna.onPrimaryContainer, size: 22),
              ),
              const SizedBox(height: 8),
              // maxLines + ellipsis menjaga label tetap satu baris.
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: warna.onSurface,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Judul bagian "Transaksi Terakhir" beserta tombol "Lihat semua".
class _JudulBagian extends StatelessWidget {
  const _JudulBagian({required this.onLihatSemua});

  final VoidCallback onLihatSemua;

  @override
  Widget build(BuildContext context) {
    return Row(
      // spaceBetween menaruh judul di kiri dan tombol di kanan.
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Expanded + ellipsis mencegah overflow pada layar sempit.
        Expanded(
          child: Text(
            'Transaksi Terakhir',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: onLihatSemua,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Lihat semua'),
        ),
      ],
    );
  }
}

/// Kartu berisi daftar transaksi yang dipisahkan garis tipis.
class _DaftarTransaksi extends StatelessWidget {
  const _DaftarTransaksi({required this.daftar});

  final List<Transaksi> daftar;

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: warna.outlineVariant.withValues(alpha: 0.6)),
      ),
      child: Column(
        children: <Widget>[
          // Perulangan membuat item dan pembatas antar-item.
          for (int i = 0; i < daftar.length; i++) ...<Widget>[
            if (i > 0)
              Divider(
                height: 1,
                thickness: 1,
                indent: 72,
                color: warna.outlineVariant.withValues(alpha: 0.5),
              ),
            _ItemTransaksi(transaksi: daftar[i]),
          ],
        ],
      ),
    );
  }
}

/// Satu baris transaksi: ikon, judul, tanggal, dan nominal.
class _ItemTransaksi extends StatelessWidget {
  const _ItemTransaksi({required this.transaksi});

  final Transaksi transaksi;

  @override
  Widget build(BuildContext context) {
    final ColorScheme warna = Theme.of(context).colorScheme;
    // Hijau untuk pemasukan, merah untuk pengeluaran.
    final Color warnaNominal = transaksi.masuk ? warna.primary : warna.error;

    return Padding(
      // Jarak dalam setiap baris transaksi.
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: <Widget>[
          // Ikon transaksi di dalam lingkaran berwarna lembut.
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: warnaNominal.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(transaksi.icon, color: warnaNominal, size: 22),
          ),
          const SizedBox(width: 12),
          // Expanded agar judul dan tanggal mengisi sisa lebar.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transaksi.judul,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: warna.onSurface,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  transaksi.tanggal,
                  style: TextStyle(color: warna.onSurfaceVariant, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Nominal rata kanan dengan warna sesuai jenis transaksi.
          Text(
            transaksi.nominal,
            style: TextStyle(
              color: warnaNominal,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
