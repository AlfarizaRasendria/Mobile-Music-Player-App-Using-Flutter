import 'package:flutter/material.dart';

class SongDetail extends StatefulWidget {
  const SongDetail({super.key});

  @override
  State<SongDetail> createState() => _SongDetailState();
}

class _SongDetailState extends State<SongDetail> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
       backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Title"),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // background-image: linear-gradient(to left bottom, #892fe0, #830790, #630251, #370c24, #000000);
            colors: [
              Color(0xFF892fe0),
              Color(0xFF830790),
              Color(0xFF630251),
              Color(0xFF370c24),
              Colors.black
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:150, right: 24, left: 24),
          child: Column(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      child: Image.asset(
                        "images/song_cover_1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Play Date",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w900,color: Colors.white),
                          ),
                          Text(
                            "Melanie Martinez",
                            style: TextStyle(fontSize: 16,color: Colors.white),
                          ),
                        ],
                      ),
                      Icon(Icons.favorite_border,color: Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Slider(
                    value: _currentSliderValue,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    thumbColor: Colors.white54,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('0.00', style: TextStyle(color: Colors.white),),
                      Text('3.32',style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous,color: Colors.white)),
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.deepPurple,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.skip_next,color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}