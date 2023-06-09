import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:versyll/Controllers/song_controller.dart';
import 'package:versyll/Screens/components/song_row.dart';

class SongBuilder extends StatefulWidget {
  const SongBuilder({super.key});

  @override
  State<SongBuilder> createState() => _SongBuilderState();
}

class _SongBuilderState extends State<SongBuilder> {
  bool isInit = true;
  var futuredata;

  @override
  void initState() {
    futuredata =
        Provider.of<SongController>(context, listen: false).dataMaster();
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
      itemBuilder: (context, index) =>
          ChangeNotifierProvider.value(value: data[index], child: SongRow()),
      itemCount: data.length,
    );
  }
}
// }
