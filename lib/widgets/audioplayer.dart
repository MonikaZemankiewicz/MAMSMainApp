import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:secondlab/constants.dart';

class AudioPlayerPanel extends StatefulWidget {
  final String audioasset;
  const AudioPlayerPanel({required this.audioasset});
  @override
  @override
  _AudioPlayerPanelState createState() => _AudioPlayerPanelState();
}

class _AudioPlayerPanelState extends State<AudioPlayerPanel> {
  late VideoPlayerController controller;

  @override
  void initState() {
    loadVideoPlayer();
    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset("audios/" + widget.audioasset);
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
                    : Icons.play_arrow),
                color: kGreenColor),
            IconButton(
              onPressed: () {
                controller.seekTo(Duration(seconds: 0));

                setState(() {});
              },
              icon: Icon(Icons.stop),
              color: kGreenColor,
            )
          ],
        ),
      )
    ]);
  }
}
