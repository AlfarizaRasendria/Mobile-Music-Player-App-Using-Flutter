import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Controllers/song_controller.dart';
import 'package:versyll/Screens/components/song_row_user.dart';

class SongBuilderUser extends StatefulWidget {
  const SongBuilderUser({super.key});

  @override
  State<SongBuilderUser> createState() => _SongBuilderUserState();
}

class _SongBuilderUserState extends State<SongBuilderUser> {
  bool isInit = true;
  var futuredata;

  @override
  void initState() {
    futuredata =
        Provider.of<SongController>(context, listen: false).profileData();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SongController>(context, listen: false).songItem;

    // return FutureBuilder(
    //     future: futuredata,
    //     builder: (context, snapshot) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: data[index], child: SongRowUser(index: index)),
      itemCount: data.length,
    );
  }
}
// }
