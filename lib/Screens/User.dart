import 'package:flutter/material.dart';
import 'package:versyll/Screens/Search.dart';
import 'package:versyll/Screens/library.dart';
import 'package:versyll/Screens/homeBody.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(),
      body: Stack(
        children: [
          // Bg Image
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height / 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Color(0xff781ECF), Colors.black],
                        center: Alignment(-1.0, -1.5),
                        radius: 1.5,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 2,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: RadialGradient(
                        colors: [Color(0xff781ECF), Colors.black],
                        center: Alignment(1.6, 1.5),
                        radius: 1.2,
                      ),
                    ),
                  ),
                ),
                // Add other content widgets here
              ],
            ),
          ),
          // Content
          ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: IconButton(
                      icon: CustIcon(
                        iconParam: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.white,
                          size: 56,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 101, left: 32, right: 32, bottom: 24),
                child: Column(
                  children: [
                    CustIcon(
                      iconParam: Icon(
                        Icons.account_circle_rounded,
                        color: Colors.white,
                        size: 64,
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      "User",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          //
                        },
                        child: Row(
                          children: [
                            CustIcon(
                              iconParam: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: const Text("Customize",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: Colors.grey,
                    //       width: 1.0,
                    //     ),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       IconButton(
                    //         icon: CustIcon(
                    //           iconParam: Icon(
                    //             Icons.edit,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //         onPressed: () {
                    //           Navigator.pushNamed(context, '');
                    //         },
                    //       ),
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 8.0),
                    //         child: TextButton(
                    //           onPressed: () {},
                    //           child: const Text("Customize Profiles",
                    //               style: TextStyle(
                    //                   color: Colors.white, fontSize: 18)),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Row(
                          children: [
                            CustIcon(
                              iconParam: Icon(
                                Icons.logout,
                                color: Colors.red,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: const Text("Log Out",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.red)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
