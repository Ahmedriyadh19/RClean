import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class VideoScreenDisplay extends StatefulWidget {
  final String path;
  const VideoScreenDisplay({
    Key? key,
    required this.path,
  }) : super(key: key);
  @override
  State<VideoScreenDisplay> createState() => VideoScreenDisplayState();
}

class VideoScreenDisplayState extends State<VideoScreenDisplay> {
  late CustomVideoPlayerWebController _customVideoPlayerWebController;
  late final CustomVideoPlayerWebSettings _customVideoPlayerWebSettings = CustomVideoPlayerWebSettings(
    src: widget.path,
    enableControls: true,
  );
  @override
  void initState() {
    super.initState();

    _customVideoPlayerWebController = CustomVideoPlayerWebController(
      webVideoPlayerSettings: _customVideoPlayerWebSettings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomVideoPlayerWeb(
      customVideoPlayerWebController: _customVideoPlayerWebController,
    );
  }
}
