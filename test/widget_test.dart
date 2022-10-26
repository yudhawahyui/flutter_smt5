// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_smt5/main.dart';

void main() {
  // Tipe Data Dan Variable
  var mahasiswa = 'Yudha Wahyu';
  var umur = "22";

  print(mahasiswa + "Umur = " + umur.toString());

  // String
  String nama;
  nama = 'Yudha Wahyu Iskandar';
  print(nama);

  // Integer
  int semester = 5;
  print(semester);

  // Double
  double ipk = 3.5;
  print(ipk);

  // Boolean
  bool benar = true;
  bool salah = false;
  bool tidakBenar = !true;
  bool tidakSalah = !false;
  print(benar);
  print(salah);
  print(tidakBenar);
  print(tidakSalah);

  // List
  List jurusan = [
    "Teknik Informatika",
    "Sistem Informasi",
    "Manajemen Bisnis",
    semester.toString(),
    ipk.toString(),
    true
  ];
  print(jurusan);

  // Map
  Map kelas = {
    "nama": "Yudha Wahyu Iskandar",
    "umur": 22,
    "jurusan": "Sistem Informasi",
    "semester": 5,
    "ipk": 3.5,
    "status": true
  };
  print(kelas);
  print(kelas['nama']);
  print(kelas['jurusan']);

  // Operator
  int a, b;
  a = 10;
  b = 5;

  print("A = " + a.toString());
  print("B = " + b.toString());

  print(a + b);
  print(a - b);
  print(a * b);
  print(a / b);
  print(a % b);
  print(a > b);
  print(a < b);
  print(a <= b);
  print(a >= b);

  // Conditional
  print("Conditional");
  var nilai;
  nilai = 50;

  if (nilai >= 80) {
    print("A");
  } else if (nilai <= 80 && nilai >= 50) {
    print("B");
  } else {
    print("Tidak Lulus");
  }

  print("==================");
  nilai >= 80 ? print("A") : print("Tidak Lulus");
  print("==================");

  // Function
  print("Function");
  hitungNilai();
  var p = hitungNilai1(2, 50);
  print(p);
  var n = hitungNilai2(nilai1: 50, nilai2: 2);
  print(n);
  hitungNilai3(40, 40);
}

// function
hitungNilai() {
  print("Hitung Nilai");
}

// positional argument
hitungNilai1(nilai1, nilai2, [nilai3]) {
  var nilaiAkhir;
  if (nilai3 != null) {
    nilaiAkhir = nilai1 / nilai2 + nilai3;
  } else {
    nilaiAkhir = nilai1 / nilai2;
  }
  return nilaiAkhir;
}

// name argument
hitungNilai2({nilai1, nilai2}) {
  var nilaiAkhir;
  if (nilai2 != null) {
    nilaiAkhir = nilai1 / nilai2;
  } else {
    nilaiAkhir = nilai1;
  }
  return nilaiAkhir;
}

void hitungNilai3(nilai1, nilai2) {
  var nilaiAkhir = nilai1 + nilai2;
  print(nilaiAkhir);
}
