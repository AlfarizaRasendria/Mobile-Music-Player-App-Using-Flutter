import 'package:flutter/material.dart';

import 'PlayList.dart';

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
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return PlayList();
        },
      ),
    );
  }
}

class PlayList extends StatelessWidget {
  PlayList({Key? key}) : super(key: key);

  final List<Map<String, String>> _playlists = [
    {
      'imagePath': 'images/Square.png',
      'name': 'Counting Star',
      'description': 'One Republic',
    },
    {
      'imagePath': 'images/song_cover_1.jpg',
      'name': 'Stiches',
      'description': 'Shawn Mendes',
    },
    {
      'imagePath': 'images/ambyar-cover-album.jpg',
      'name': 'Night Changes',
      'description': 'One Direction',
    },
  ];

  Widget _buildPlaylistItem(
      Map<String, String> playlist, double width, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: width * 0.02,
        horizontal: width * 0.04,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PlayListPage()));
        },
        child: Row(
          children: [
            SquareImage(imagePath: playlist['imagePath']!),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlist['name']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.04,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  playlist['description']!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.03,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = constraints.maxWidth;

        return Column(
          children: _playlists
              .map((playlist) => _buildPlaylistItem(playlist, width, context))
              .toList(),
        );
      },
    );
  }
}

class SquareImage extends StatelessWidget {
  final String imagePath;

  const SquareImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.circular(width * 0.05),
      child: Image.asset(
        imagePath,
        width: width * 0.25,
        height: width * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }
}
