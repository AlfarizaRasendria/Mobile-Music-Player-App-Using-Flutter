import 'package:flutter/material.dart';
import 'package:versyll/Screens/PlayList.dart';
import 'package:versyll/Screens/SongDetail.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:versyll/Screens/components/song_builder.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

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
            child: Text(
              "Song",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          SongBuilder(),
        ],
      ),
    );
  }
}

// class SongList extends StatelessWidget {
//   final img;
//   final title;
//   final singer;
//   final duration;
//   const SongList({
//     super.key,
//     this.img,
//     this.title,
//     this.singer,
//     this.duration,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListTile(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => SongDetail()),
//           );
//         },
//         leading: GFAvatar(
//           backgroundImage: AssetImage(this.img),
//           shape: GFAvatarShape.standard,
//         ),
//         title: Text(
//           title,
//           style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
//         ),
//         subtitle: Text(
//           singer,
//           style: TextStyle(letterSpacing: 0.5, color: Colors.white),
//         ),
//         trailing: Text(
//           duration,
//           style: TextStyle(letterSpacing: 0.5, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }

// class PlayList extends StatelessWidget {
//   final img;
//   final title;
//   final subtitle;
//   const PlayList({super.key, this.img, this.title, this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => PlayListPage()));
//       },
//       child: Container(
//         margin: EdgeInsets.only(left: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.all(
//                 Radius.circular(16),
//               ),
//               child: Image.asset(
//                 img,
//                 width: 200,
//                 height: 200,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8, top: 8),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w800,
//                         letterSpacing: 0.8,
//                         color: Colors.white),
//                   ),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w100,
//                       letterSpacing: 0.8,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustIcon extends StatelessWidget {
  final Icon iconParam;

  const CustIcon({super.key, required this.iconParam});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16),
      child: iconParam,
    );
  }
}
