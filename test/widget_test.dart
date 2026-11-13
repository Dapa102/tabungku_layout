// Pengujian dasar untuk memastikan seluruh bagian layout tampil dan tidak
// mengalami overflow pada dua ukuran layar yang diminta tugas.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabungku_layout/main.dart';

void main() {
  testWidgets('menampilkan seluruh bagian Ringkasan Tabungan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TabungKuApp());

    // Judul halaman dan isi kartu saldo.
    expect(find.text('Ringkasan Tabungan'), findsOneWidget);
    expect(find.text('Dana Pendidikan'), findsOneWidget);
    expect(find.text('Rp 2.450.000'), findsOneWidget);
    expect(find.text('Target: Rp 5.000.000'), findsOneWidget);

    // Tiga tombol kategori.
    expect(find.text('Menabung'), findsOneWidget);
    expect(find.text('Tarik'), findsOneWidget);
    expect(find.text('Riwayat'), findsOneWidget);

    // Daftar transaksi statis.
    expect(find.text('Transaksi Terakhir'), findsOneWidget);
    expect(find.text('Menabung rutin'), findsOneWidget);
    expect(find.text('Beli buku pelajaran'), findsOneWidget);
    expect(find.text('Menabung mingguan'), findsOneWidget);
    expect(find.text('+Rp 500.000'), findsOneWidget);
    expect(find.text('-Rp 150.000'), findsOneWidget);
  });

  testWidgets('tidak overflow pada layar ponsel potret', (
    WidgetTester tester,
  ) async {
    // Ukuran umum ponsel: 390 x 844 (logical pixel).
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TabungKuApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('tidak overflow pada layar tablet', (WidgetTester tester) async {
    // Ukuran umum tablet potret: 800 x 1280 (logical pixel).
    tester.view.physicalSize = const Size(800, 1280);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TabungKuApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
