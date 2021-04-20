import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoItems extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool looping;
  final bool autoplay;


  VideoItems({
    @required this.videoPlayerController,
    this.looping, this.autoplay,
    Key key,
  }) : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  ChewieController _chewieController;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 20/ 10  ,
      // aspectRatio: widget.videoPlayerController.value.aspectRatio,
      autoInitialize: false,
      autoPlay: widget.autoplay,
      showControlsOnInitialize: true,
      // deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
      showControls: false,
      looping: widget.looping,
      startAt: Duration(seconds: 0),
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    // widget.videoPlayerController.dispose();
    _chewieController.dispose();
    _chewieController.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
    // return Container(
    //   width: MediaQuery.of(context).size.width,
    //   height: MediaQuery.of(context).size.height,
    //   child: Stack(
    //     children: <Widget>[
    //       Chewie(
    //         controller: _chewieController,
    //       ),
    //       Container(
    //         alignment: Alignment.center,
    //         child: GestureDetector(
    //           onTap: () {
    //             if (isPlaying) {
    //               _chewieController.pause();
    //               setState(() {
    //                 isPlaying = false;
    //               });
    //             } else {
    //               _chewieController.play();
    //               setState(() {
    //                 isPlaying = true;
    //               });
    //             }
    //           },
    //           child: Icon(
    //             isPlaying ? Icons.pause : Icons.play_arrow,
    //             size: 80,
    //             // color: Color(colorProxiWall).withOpacity(0.3),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

}