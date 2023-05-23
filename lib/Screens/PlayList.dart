import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';

class PlayListPage extends StatelessWidget {
  // const PlayListPage({super.key});

  // Format Durasi
  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes.$twoDigitSeconds";
  }

  // List lagu
  final List<Map<String, dynamic>> songs = [
    {
      "judul": "Señorita",
      "img": "images/album_cover.png",
      "penyanyi": "Shawn Mendes, Camilla Cabello",
      "durasi": const Duration(minutes: 3, seconds: 10),
    },
    {
      "judul": "Play Date",
      "img": "images/Square.png",
      "penyanyi": "Melanie Martinez",
      "durasi": const Duration(minutes: 2, seconds: 59),
    },
    {
      "judul": "Beggin'",
      "img": "images/album_cover.png",
      "penyanyi": "Måneskin",
      "durasi": const Duration(minutes: 3, seconds: 31),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('PlayList'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Color(0xff781ECF), Colors.black],
            center: Alignment(0.7, 1.3),
            radius: 1.2,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Playlist",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Life is sucks",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 0.5,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.deepPurple,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GFAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("images/song_cover_1.jpg"),
                    shape: GFAvatarShape.standard,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            Container(
              height: 500,
              child: ListView(
                children: songs.map((song) {
                  return ListTile(
                    leading: GFAvatar(
                      backgroundImage: AssetImage("${song['img']}"),
                      shape: GFAvatarShape.standard,
                    ),
                    title: Text("${song['judul']}", style: TextStyle(color: Colors.white),),
                    subtitle: Text("${song['penyanyi']}",style: TextStyle(color: Colors.white)),
                    trailing: Text(_printDuration(song['durasi']),style: TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}