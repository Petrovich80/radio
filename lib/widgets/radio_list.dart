import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_baska/constants/stations.dart';
import 'package:radio_baska/widgets/radio_list_item.dart';

class RadioList extends StatelessWidget {
  final MediaLibrary _mediaLibrary = MediaLibrary();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return GridView.count(
          padding: EdgeInsets.zero,
          crossAxisCount: orientation == Orientation.portrait ? 3 : 7,
          children: [
            ..._mediaLibrary.stations
                .map((station) => RadioListItem(station))
                .toList()
          ],
        );
      },
    );
  }
}
