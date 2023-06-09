import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Controllers/song_controller.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/library.dart';
import 'package:versyll/Screens/homeBody.dart';
import 'package:versyll/Components/colors.dart';
import 'package:versyll/services/auth_service.dart';

class FormAddSong extends StatelessWidget {
  const FormAddSong({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController judulController = TextEditingController();
    final TextEditingController penyanyiController = TextEditingController();
    final TextEditingController imgController = TextEditingController();
    final TextEditingController durasiController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 50,
        title: const Text('Add Song',
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat")),
      ),
      body: Container(
        decoration: warnaBackground,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: judulController,
                    maxLines: null,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      height: 1.5,
                    ),
                    // controller: titleController,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white60)),
                      /*  border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )), */
                      labelText: 'Judul',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: penyanyiController,
                    maxLines: null,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      height: 1.5,
                    ),
                    // controller: descriptionController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      labelText: 'Penyanyi',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: imgController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      height: 1.5,
                    ),
                    // controller: imageController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      labelText: 'Image URL',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: descController,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      height: 1.5,
                    ),
                    // controller: tagController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      labelText: 'Deskripsi',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: durasiController,
                    maxLines: null,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      height: 1.5,
                    ),
                    // controller: contentController,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white70)),
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      labelText: 'Durasi',
                      labelStyle: TextStyle(color: Colors.white),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      elevation: 2,
                      onPressed: () {
                        Provider.of<SongController>(context, listen: false)
                            .addSong(
                          judulController.text,
                          imgController.text,
                          penyanyiController.text,
                          durasiController.text,
                          descController.text,
                        );
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.add_box_rounded)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
