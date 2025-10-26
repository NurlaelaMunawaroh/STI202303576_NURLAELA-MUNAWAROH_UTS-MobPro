import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aplikasi_pertamaku/main.dart';

void main() {
  testWidgets('App memuat halaman utama dengan benar', (
    WidgetTester tester,
  ) async {
    // Bangun widget utama aplikasi
    await tester.pumpWidget(const MyEventPlannerApp());

    // Pastikan judul aplikasi tampil di AppBar
    expect(find.text('My Event Planner'), findsOneWidget);

    // Pastikan ada tombol tambah event (ikon '+')
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
