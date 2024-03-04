import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YT_Player extends StatefulWidget {
  String ytUrl;

  YT_Player({super.key, required this.ytUrl});

  @override
  State<YT_Player> createState() => _YT_PlayerState();
}

class _YT_PlayerState extends State<YT_Player> {
  YoutubePlayerController? _ytController;
  String? videoId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.ytUrl);
    _ytController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'E-Learning for Safety Awareness',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _ytController!,
        ),
      ),
    );
  }
}
