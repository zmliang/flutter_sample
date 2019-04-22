import 'dart:io';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/song_data.dart';
import 'package:flutter_app/pages/now_playing.dart';
import 'package:flutter_app/widgets/mp_circle_avatar.dart';
import 'package:flutter_app/widgets/mp_inherited.dart';

class MPListView extends StatelessWidget {
  final List<MaterialColor> _colors = Colors.primaries;

  @override
  Widget build(BuildContext context) {
    final rootIW = MPInheritedWidget.of(context);
    SongData songData = rootIW.songData;

    return new ListView.builder(
        itemCount: songData.length,
        itemBuilder: (context, int index) {
          var s = songData.songs[index];
          final MaterialColor color = _colors[index % _colors.length];
          var artFile = s.albumArt == null
              ? null
              : new File.fromUri(Uri.parse(s.albumArt));

          return new Container(
            child: new Column(
              children: <Widget>[
                buildItemData(color, artFile, s, context, songData, index),
                new Divider(),
              ],
            ),
          );
        });
  }

  Widget buildItemData(MaterialColor color, File artFile, Song s,
      BuildContext context, SongData songData, int index) {
    return new ListTile(
      dense: false,
      leading: new Hero(child: avatar(artFile, s.title, color), tag: s.title),
      title: new Text(s.title),
      subtitle: Text(
        "By ${s.artist}",
        style: Theme.of(context).textTheme.caption,
      ),
      onTap: () {
        songData.setCurrentIndex(index);
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new NowPlaying(songData, s)));
      },
    );
  }
}
