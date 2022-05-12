import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPanel extends StatefulWidget {
  final String videoasset;
  const VideoPlayerPanel({required this.videoasset});
  @override
  @override
  _VideoPlayerPanelState createState() => _VideoPlayerPanelState();
}

class _VideoPlayerPanelState extends State<VideoPlayerPanel> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset("videos/" + widget.videoasset);
    controller.addListener(() {
      setState(() {});
    });
    controller.initialize().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
      Container(
          child: VideoProgressIndicator(controller,
              allowScrubbing: true,
              colors: VideoProgressColors(
                backgroundColor: Colors.redAccent,
                playedColor: Colors.green,
                bufferedColor: Colors.purple,
              ))),
      Container(
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  if (controller.value.isPlaying) {
                    controller.pause();
                  } else {
                    controller.play();
                  }

                  setState(() {});
                },
                icon: Icon(controller.value.isPlaying
                    ? Icons.pause
                    : Icons.play_arrow)),
            IconButton(
                onPressed: () {
                  controller.seekTo(Duration(seconds: 0));

                  setState(() {});
                },
                icon: Icon(Icons.stop))
          ],
        ),
      )
    ]);
  }
}
