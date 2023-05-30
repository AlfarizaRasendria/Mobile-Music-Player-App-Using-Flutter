import 'package:flutter/material.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/library.dart';
import 'package:versyll/Screens/homeBody.dart';
import 'package:versyll/Components/colors.dart';

class FormAddSong extends StatelessWidget {
  const FormAddSong({super.key});

  @override
  Widget build(BuildContext context) {
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
                        /* Provider.of<Articles>(context, listen: false)
                                .addArticle(
                                    titleController.text,
                                    descriptionController.text,
                                    imageController.text,
                                    Provider.of<Authentication>(context,
                                            listen: false)
                                        .dispName,
                                    tagController.text,
                                    contentController.text); */
                        /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              /// need to set following properties for best effect of awesome_snackbar_content
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              /* content: AwesomeSnackbarContent(
                                title: 'Great!',
                                message:
                                    'Yay your article has been created and uploaded!',
          
                                /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                contentType: ContentType.success,
                                inMaterialBanner: true,
                              ), */
                            ));
                            // StatusAlert.show(
                            //   context,
                            //   duration: const Duration(seconds: 3),
                            //   title: 'Article Created',
                            //   subtitle:
                            //       'Yay your article has been created and uploaded!',
                            //   configuration:
                            //       const IconConfiguration(icon: Icons.done),
                            //   maxWidth: 260,
                            // );
                            Navigator.pop(context); */
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
