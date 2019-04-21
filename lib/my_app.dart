import 'package:flutter/material.dart';
import 'package:flutter_app/data/song_data.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_app/pages/root_page.dart';
import 'package:flutter_app/widgets/mp_inherited.dart';


class MyApp extends StatefulWidget{
  @override
  _MyAppState createState()=> new _MyAppState();
}

class _MyAppState extends State<MyApp>{
  SongData songData;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    initPlatformState();
  }

  @override
  void dispose(){
    super.dispose();
    songData.audioPlayer.stop();
  }

  initPlatformState() async{
    _isLoading = true;

    var songs;
    try{
      songs = await MusicFinder.allSongs();
    }catch(e){
      print("Failed to get songs : '${e.message}'.");
    }
    print(songs);
    if(!mounted){
      return;
    }
    setState(() {
      songData = new SongData(songs);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context){
    return new MPInheritedWidget(songData,_isLoading,new RootPage());
  }

}