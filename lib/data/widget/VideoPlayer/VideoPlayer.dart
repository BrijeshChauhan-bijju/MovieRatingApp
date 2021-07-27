import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String? videoUrl;
  final String? thumbNail;
  final double? height;
  final double? width;

  VideoPlayerWidget({
    this.videoUrl,
   this.thumbNail,
    this.height,
    this.width,
  });

  @override
  VideoPlayerState createState() => VideoPlayerState(this.videoUrl!);
}

class VideoPlayerState extends State<VideoPlayerWidget>{
late YoutubePlayerController _controller;
  VideoPlayerState(String videourl) {
    _controller = YoutubePlayerController(
      initialVideoId: videourl,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      body: YoutubePlayer(
        controller: _controller,
        aspectRatio: 16/9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: AppColors.primaryColor,
        progressColors: ProgressBarColors(
          playedColor: AppColors.primaryColor,
          handleColor: AppColors.primaryColor,
        ),
        onReady: () {
          // _controller.addListener(listener);
        },
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
