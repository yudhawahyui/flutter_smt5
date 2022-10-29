import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_smt5/main.dart';

void main() {
  //tipe data dan variabele
  //var
  var mahasiswa = "jejen";
  var umur = 20;

  print(mahasiswa + " umur = " + umur.toString());

  //string
  String mahasiswaString;
  mahasiswaString = "aan";

  print(mahasiswaString);

  //int
  int semester;
  semester = 6;

  print(semester);

  //double
  double ipk;
  ipk = 3;

  print(ipk);

  //boolean
  bool benar = true;
  bool salah = false;
  bool tidakbenar = !true;
  bool tidaksalah = !false;

  //List
  List jurusan = [
    "Teknik Informatika",
    "Sistem Informasi",
    "DKV",
    semester.toString(),
    ipk.toString()
  ];

  print(jurusan);

  //Map
  Map<String, dynamic> kelas = {
    "nama": "beben",
    "kelas": "TI 2",
  };

  print(kelas);
  print(kelas['nama']);
  print(kelas['kelas']);

  //oprator
  int a, b;
  a = 9;
  b = 7;
  print("a = " + a.toString());
  print("b = " + b.toString());

  print({a + b});
  print({a - b});
  print({a / b});
  print({a = b});
  print({a > b});
  print({a < b});
  print({a >= b});
  print({a <= b});

  //conditional
  print("conditional");
  var nilai;
  nilai = 80;

  if (nilai >= 80) {
    print("A");
  } else if (nilai <= 80 && nilai >= 50) {
    print("B");
  } else {
    print("tidak lulus");
  }

  print("..........");
  nilai >= 80 ? print("A") : print("tidak A");

  //function
  print("function");

  hitungnilai();
  hitungnilai1(75, 90);
  var p = hitungnilai1(50, 2, 56);
  print(p);
  var n = hitungnilai2(mapel1: 50, mapel2: 2);
  print(n);
  hitungnilai3(79, 100);
  var o = hitungnilai3(79, 100);

  //final keyword +> imutable / tidak bisa dirubah
  //const final
  //const
  //const String mahasiswa = 'beben';
  //final
  final String mahasiswafk;

  mahasiswafk = 'beben';

  print(mahasiswafk);

  //null safety
  // ? ! late
  // ? digunakan dia boleh null
  late String jurusanns;

  jurusanns = "teknik informatika";
  //jurusan = "TI";
  // memaksa untuk di jelaskan / yakin ada datanya
  print(jurusanns.length);

  //perulangan looping
  // for plus
  for (int no = 1; no <= 5; no++) {
    print(no);
  }
  //while
  int no1 = 1;
  int no2 = 5;
  while (no1 <= no2) {
    print(no1);
    no1++;
  }
  // do while
  int no3 = 1;
  int no4 = 5;
  do {
    print(no3);
    no3++;
  } while (no3 <= no4);
}

//function
hitungnilai() {
  print("hitung nilai");
}

//positional argument
hitungnilai1(mapel1, mapel2, [mapel3]) {
  var nilaiakhir;
  if (mapel3 != null) {
    nilaiakhir = mapel1 / mapel2 + mapel3;
  } else {
    nilaiakhir = mapel1 / mapel2;
  }
  return nilaiakhir;
}

//name argument
hitungnilai2({mapel1, mapel2}) {
  var nilaiakhir;
  if (mapel2 != null) {
    nilaiakhir = mapel1 / mapel2;
  } else {
    nilaiakhir = mapel1;
  }
  return nilaiakhir;
}

//vold
hitungnilai3(mapel1, mapel2) {
  var nilaiakhir = mapel1 + mapel2;
  print(nilaiakhir);
}

//oop
//class

class Kendaraan {
  String? merek;
  String? nama;
  int? kecepatan;

  //construktor
  Kendaraan({this.merek, this.nama, this.kecepatan});

  //method
  maju(int tambahkecepatan) {
    kecepatan = kecepatan! + tambahkecepatan;
    // print(kecepatan  + tambahkecepatan);
  }
}

//inheritance / pewarisan
class Sedan extends Kendaraan {
  int? jumlahPintu;
  int? kecepatanMaksimal;

  Sedan({String? merek, this.jumlahPintu, this.kecepatanMaksimal})
      : super(merek: merek);
}

void main2() {
  //instansiasi
  var k1 = Kendaraan(merek: "BMW", nama: "civic", kecepatan: 20);

  k1.merek = "toyota";
  // print(k1.maju(40));
  print(k1.merek);
  print(k1.nama);
  print(k1.kecepatan);

  var k2 = Kendaraan(merek: "misubishi", nama: "colt", kecepatan: 40);
  k2.maju(80);
  // print(kecepatan);
  print(k2.merek);
  print(k2.nama);
  print(k2.kecepatan);

  var s1 = Sedan(jumlahPintu: 4, kecepatanMaksimal: 120, merek: "honda");
  print("........");
  print(s1.jumlahPintu);
  print(s1.kecepatanMaksimal);
  print(s1.merek);
}
