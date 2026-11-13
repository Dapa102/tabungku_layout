import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabungku_layout/main.dart';

void main() {
  testWidgets('menampilkan seluruh bagian Ringkasan Tabungan', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TabungKuApp());

    expect(find.text('Ringkasan Tabungan'), findsOneWidget);
    expect(find.text('Dana Pendidikan'), findsOneWidget);
    expect(find.text('Rp 2.450.000'), findsOneWidget);
    expect(find.text('Target: Rp 5.000.000'), findsOneWidget);

    expect(find.text('Menabung'), findsOneWidget);
    expect(find.text('Tarik'), findsOneWidget);
    expect(find.text('Riwayat'), findsOneWidget);

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
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TabungKuApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });

  testWidgets('tidak overflow pada layar tablet', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1280);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const TabungKuApp());
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
  });
}
