import 'package:provider/provider.dart';
import '../Models/Song.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Songs with ChangeNotifier {
  String? token;
  String? uid;

  void updateToken(String newToken, String newUid) {
    token = newToken;
    uid = newUid;
    notifyListeners();
  }

  List<Song> _SongItem = [];

  List<Song>? _userSong = [];

  List<Song> get userSong {
    return [..._userSong!];
  }

  List<Song> get SongItem {
    return [..._SongItem];
  }

  Future<void> profileData() async {
    //String tokent = tokenAccess();
    print(token);
    Uri url = Uri.parse(
        'https://versyll-3818e-default-rtdb.asia-southeast1.firebasedatabase.app');

    print(url);

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>?;
    //print(dataResponse);

    _userSong!.clear();
    dataResponse?.forEach(
      (key, value) {
        _userSong?.add(
          Song(
              id: key,
              uid: value["uid"],
              judul: value["judul"],
              img: value["img"],
              penyanyi: value["penyanyi"],
              desc: value["desc:"],
              durasi: value["durasi"]),
        );
      },
    );
    notifyListeners();

    print("Data Profile Berhasil Diambil");
  }

  Future<void> dataMaster() async {
    //String tokent = tokenAccess();
    print(token);
    Uri url = Uri.parse(
        'https://versyll-3818e-default-rtdb.asia-southeast1.firebasedatabase.app');

    print(url);

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>?;
    //print(dataResponse);

    _SongItem.clear();
    dataResponse?.forEach(
      (key, value) {
        _SongItem.add(
          Song(
              id: key,
              uid: value["uid"],
              judul: value["judul"],
              img: value["img"],
              penyanyi: value["penyanyi"],
              desc: value["desc:"],
              durasi: value["durasi"]),
        );
      },
    );
    notifyListeners();

    print("Data Master Berhasil Diambil");
  }

  Future<void> addSong(
      String judul, String penyanyi, String img, String desc, Duration durasi) {
    if (uid == null) {
      return Future.error('User ID is null');
    }
    Uri url = Uri.parse(
        'https://versyll-3818e-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json');
    return http
        .post(url,
            body: json.encode({
              'uid': uid,
              'judul': judul,
              'penyanyi': penyanyi,
              'img': img,
              'desc': desc,
              'durasi': durasi.toString(),
            }))
        .then((response) {
      _SongItem.add(Song(
        id: json.decode(response.body)["name"].toString(),
        uid: uid!,
        judul: judul,
        img: img,
        penyanyi: penyanyi,
        desc: desc,
        durasi: durasi,
      ));
      notifyListeners();
    });
  }

  Future<void> editArtic(String id, String judul, String penyanyi, String img,
      String desc, Duration durasi) {
    //String tokent = tokenAccess();
    Uri url = Uri.parse(
        'https://versyll-3818e-default-rtdb.asia-southeast1.firebasedatabase.app');

    return http
        .patch(url,
            body: json.encode({
              'id': id,
              'judu;': judul,
              'penyanyi': penyanyi,
              'img': img,
              'desc': desc,
              'durasi': durasi,
            }))
        .then((response) {
      Song selectSong = _userSong!.firstWhere((element) => element.id == id);
      selectSong.judul = judul;
      selectSong.penyanyi = penyanyi;
      selectSong.img = img;
      selectSong.desc = desc;
      selectSong.durasi = durasi;
      notifyListeners();
    });
  }

  // void checkArt() {
  //   _userSong.forEach(print);
  // }

  Future<void> deleteArt(String id) {
    //String tokent = tokenAccess();
    Uri url = Uri.parse(
        'https://versyll-3818e-default-rtdb.asia-southeast1.firebasedatabase.app');

    print(_userSong);

    return http.delete(url).then(
      (response) {
        _userSong!.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }
}
