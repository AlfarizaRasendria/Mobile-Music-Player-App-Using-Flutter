import 'package:flutter/material.dart';
import 'package:versyll/Screens/SongDetail.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:versyll/Screens/components/song_builder_user.dart';

import 'components/song_builder.dart';

class MySong extends StatelessWidget {
  final img;
  final title;
  final singer;
  final duration;
  const MySong({
    super.key,
    this.img,
    this.title,
    this.singer,
    this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SongDetail()));
        },
        leading: GFAvatar(
          backgroundImage: AssetImage(this.img),
          shape: GFAvatarShape.standard,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        subtitle: Text(
          singer,
          style: TextStyle(letterSpacing: 0.5, color: Colors.white),
        ),
        trailing: Text(
          duration,
          style: TextStyle(letterSpacing: 0.5, color: Colors.white),
        ),
      ),
    );
  }
}

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xff781ECF), Colors.black],
          center: Alignment(-1.6, 0.1),
          radius: 1.2,
        ),
      ),
      child: ListView(
        children: [
          // Content
          Padding(
            padding: const EdgeInsets.only(left: 32),
          ),
          SongBuilderUser(),
        ],
      ),
    );
  }
}



/* class SquareImage extends StatelessWidget {
  final String img;

  const SquareImage({
    Key? key,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.05),
      child: Image.asset(
        img,
        width: width * 0.25,
        height: width * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }
} */
