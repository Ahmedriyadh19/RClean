import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  final String path;
  const MyScreen({
    Key? key,
    required this.path,
  }) : super(key: key);
  @override
  State<MyScreen> createState() => MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  late VideoPlayerController _videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.path)..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: _videoPlayerController,
        customVideoPlayerSettings: const CustomVideoPlayerSettings(showDurationPlayed: true, showPlayButton: true, showDurationRemaining: true));
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayer(customVideoPlayerController: _customVideoPlayerController);
  }
}
