import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Controllers/song_controller.dart';
import 'package:versyll/Screens/FormEditSong.dart';
import 'package:versyll/models/Song.dart';

class SongRowUser extends StatelessWidget {
  var index;
  SongRowUser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Song>(context);
    var dataMain = Provider.of<SongController>(context).songItem;

    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => PlayListPage()));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(16),
            //   ),
            //   child: Image.asset(
            //     img,
            //     width: 200,
            //     height: 200,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.judul,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                            color: Colors.white),
                      ),
                      Text(
                        data.penyanyi,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    FormEditSong(id: dataMain[index].id),
                              ));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Provider.of<SongController>(context, listen: false)
                              .deleteSong(dataMain[index].id);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
