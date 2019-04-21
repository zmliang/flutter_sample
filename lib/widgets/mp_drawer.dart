import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_app/widgets/mp_inherited.dart';

class MPDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new MPDrawerState();
  }
}

class MPDrawerState extends State<MPDrawer>{
  bool dark;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var rootIW = MPInheritedWidget.of(context).songData;
    var cI = rootIW.currentIndex;
    Song song = rootIW.songs[((cI!=null)||(cI<0)) ? 0 : rootIW.currentIndex];
    var f = song.albumArt == null
          ? null 
          : new File.fromUri(Uri.parse(song.albumArt));

    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            padding: EdgeInsets.zero,
            child: f !=null
                       ? new Image.file(f,fit: BoxFit.fill,gaplessPlayback: true,)
                       : new Image.asset("assets/music_record.jpeg",fit: BoxFit.fill,gaplessPlayback: true,)
          )
        ],
      ),
    );
  }

}