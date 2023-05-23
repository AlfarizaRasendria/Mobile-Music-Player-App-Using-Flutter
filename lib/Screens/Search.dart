import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final String text;
  final Color color;

  const MyContainer({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 16.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Text(
            text,
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<MyContainer> myList = [
      MyContainer(text: "Trending", color: Colors.pink),
      MyContainer(text: "Pop", color: Colors.blue),
      MyContainer(text: "Rock", color: Colors.blue),
      MyContainer(text: "R&B", color: Colors.pink),
      MyContainer(text: "Electronic", color: Colors.pink),
      MyContainer(text: "Chill", color: Colors.blue),
      MyContainer(text: "Jazz", color: Colors.blue),
      MyContainer(text: "Indie", color: Colors.pink),
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Color(0xff781ECF), Colors.black],
          center: Alignment(-1.6, 0.1),
          radius: 1.2,
        ),
        color: Colors.black,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.grey),
                  borderRadius: BorderRadius.circular(7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Container(
                    height: 600,
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 5.5 / 3,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 25,
                      ),
                      children: myList,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
