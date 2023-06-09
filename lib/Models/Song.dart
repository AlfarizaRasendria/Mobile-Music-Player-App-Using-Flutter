import 'package:flutter/foundation.dart';

class Song with ChangeNotifier {
  String id;
  String uid;
  String judul;
  String img;
  String penyanyi;
  String durasi;
  String desc;

  Song({
    required this.id,
    required this.uid,
    required this.judul,
    required this.img,
    required this.penyanyi,
    required this.durasi,
    required this.desc,
  });
}
