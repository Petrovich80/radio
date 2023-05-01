import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:radio_baska/widgets/playback_view.dart';
import 'package:radio_baska/widgets/radio_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Color(0xff0099cc),
                title: Text(
                  'Любимые радиостанции',
                  style: TextStyle(
                    fontFamily: "mr_HamiltoneG",
                    fontWeight: FontWeight.w400,
                    fontSize: 40.2,
                  ),
                ),
                centerTitle: true,
              ),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: "Сделано https://mobinobi.ru",
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
                linkStyle: TextStyle(color: Colors.blueAccent),
              ),
              Expanded(
                child: RadioList(),
              ),
            ],
          ),
          PlaybackView()
        ],
      ),
    );
  }
}
