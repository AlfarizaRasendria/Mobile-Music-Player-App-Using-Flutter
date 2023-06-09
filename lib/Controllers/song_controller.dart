import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/Song.dart';
import 'package:http/http.dart' as http;

class SongController with ChangeNotifier {
  String? token;
  String? uid;

  void updateToken(String newToken, String newUid) {
    token = newToken;
    uid = newUid;
    notifyListeners();
  }

  // String tokenAccess() {
  //   token = saveToken;
  //   return token!;
  // }
  List<Song> _songItem = [];

  List<Song>? _userSong = [];

  List<Song> get userSong {
    return [..._userSong!];
  }

  List<Song> get songItem {
    return [..._songItem];
  }

  Future<void> profileData() async {
    //String tokent = tokenAccess();
    print(token);
    Uri url = Uri.parse(
        "https://db-versyll-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json");

    // print(url);

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
            durasi: value["durasi"],
            desc: value["desc"],
          ),
        );
      },
    );
    notifyListeners();

    // print("Data Profile Berhasil Diambil");
  }

  Future<void> dataMaster() async {
    //String tokent = tokenAccess();
    print(token);
    Uri url = Uri.parse(
        "https://db-versyll-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json");

    print(url);

    var hasilGetData = await http.get(url);

    var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>?;
    //print(dataResponse);

    _songItem.clear();
    dataResponse?.forEach(
      (key, value) {
        _songItem.add(
          Song(
            id: key,
            uid: value["uid"],
            judul: value["judul"],
            img: value["img"],
            penyanyi: value["penyanyi"],
            durasi: value["durasi"],
            desc: value["desc"],
          ),
        );
      },
    );
    notifyListeners();

    print("Data Master Berhasil Diambil");
  }

  Future<void> addSong(
      String judul, String img, String penyanyi, String durasi, String desc) {
    //String tokent = tokenAccess();
    Uri url = Uri.parse(
        "https://db-versyll-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json");

    //print(_userSong);
    return http
        .post(url,
            body: json.encode({
              'uid': "uid",
              'judul': judul,
              'img': img,
              'penyanyi': penyanyi,
              'durasi': durasi,
              'desc': desc,
            }))
        .then((response) {
      _songItem.add(Song(
        id: json.decode(response.body)["name"].toString(),
        uid: "uid",
        judul: judul,
        img: img,
        penyanyi: penyanyi,
        durasi: durasi,
        desc: desc,
      ));
      notifyListeners();
      print("iso cok");
    });
  }

  Future<void> editSong(String id, String judul, String img, String penyanyi,
      String durasi, String desc) {
    //String tokent = tokenAccess();
    Uri url = Uri.parse(
        'https://db-versyll-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json');

    return http
        .patch(url,
            body: json.encode({
              'id': id,
              'judul': judul,
              'img': img,
              'penyanyi': penyanyi,
              'durasi': durasi,
              'desc': desc,
            }))
        .then((response) {
      Song selectSong = _userSong!.firstWhere((element) => element.id == id);
      selectSong.judul = judul;
      selectSong.img = img;
      selectSong.penyanyi = penyanyi;
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
        'https://db-versyll-default-rtdb.asia-southeast1.firebasedatabase.app/songs.json');

    // print(_userSong);

    return http.delete(url).then(
      (response) {
        _userSong!.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }
}
