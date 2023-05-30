import 'package:flutter/foundation.dart';

class Song {
    final String judul;
    final String img;
    final String penyanyi;
    final Duration durasi;
    final String desc;

  Song({
    required this.judul,
    required this.img,
    required this.penyanyi,
    required this.durasi,
    required this.desc,
  });
}
