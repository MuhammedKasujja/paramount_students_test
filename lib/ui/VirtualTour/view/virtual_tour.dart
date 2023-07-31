import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:panorama/panorama.dart';
import 'package:paramount_students/app_utils/styles/colors.dart';
import 'package:paramount_students/app_utils/styles/texts.dart';
import 'package:paramount_students/app_utils/widgets/buttons/ps_card_button.dart';
import 'package:video_player/video_player.dart';

class VirtualTour extends StatefulWidget {
  const VirtualTour({Key? key}) : super(key: key);

  @override
  State<VirtualTour> createState() => _VirtualTourState();
}

class _VirtualTourState extends State<VirtualTour> {
  VideoPlayerController? videoController;
  ChewieController? chewieController;
  bool isVideoPlaying = false;

  String panoramaImage = 'assets/images/virtual/virtual5.jpg';
  String selectedContainerText = 'Medow Lecture Hall';

  void changePanoramaImage(String assetPath, String containerText) async {
    if (assetPath.endsWith('.mp4')) {
      // Load and play the video
      videoController = VideoPlayerController.asset(assetPath);
      await videoController!.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoController!,
        autoPlay: true,
        looping: true,
      );
      isVideoPlaying = true;
    } else {
      // Load the image
      await videoController?.dispose();
      chewieController?.dispose();
      isVideoPlaying = false;
    }

    setState(() {
      panoramaImage = assetPath;
      selectedContainerText = containerText;
    });
  }

  void changePanoramaImageToVideo(String assetPath) {
    if (assetPath.endsWith('.mp4')) {
      // Load and play the video
      videoController = VideoPlayerController.asset(assetPath);
      chewieController = ChewieController(
        videoPlayerController: videoController!,
        autoPlay: true,
        looping: true,
      );
      isVideoPlaying = true;
    } else {
      // Load the image
      videoController?.dispose();
      chewieController?.dispose();
      isVideoPlaying = false;
    }

    setState(() {});
  }

  @override
  void dispose() {
    videoController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (!isVideoPlaying)
            Panorama(
              child: Image.asset(panoramaImage),
            )
          else
            // SizedBox(
            //     height: deviceHeight,
            //     width: deviceWidth,
            //     child: FullScreenPlayer(controller: chewieController!)),
            FittedBox(
              // fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: deviceHeight, // videoController!.value.size.height,
                width: videoController!.value.size.width,
                child: AspectRatio(
                  aspectRatio: videoController!
                      .value.aspectRatio, //deviceWidth / deviceHeight,

                  child: Chewie(
                    controller: chewieController!,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 50,
            left: 40,
            child: Text(
              'See tips',
              style: PSTextStyle.virtualtourtexts.copyWith(
                decoration: TextDecoration.underline,
                color: psColorPrimary1000,
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.black.withOpacity(0.6),
              ),
              child: const Icon(
                Icons.close,
                color: psWhite,
              ),
            ),
          ),
          Positioned(
            top: 140,
            right: 1,
            child: GestureDetector(
              onTap: () {
                changePanoramaImage(
                    'assets/images/virtual/virtual2.jpg', 'Medow Corridor');
              },
              child: Container(
                height: 48,
                width: 128,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    'Medow Corridor',
                    style: PSTextStyle.virtualtourtexts,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            right: 1,
            child: GestureDetector(
              onTap: () {
                changePanoramaImage(
                    'assets/images/virtual/virtual6.jpg', 'Tasha Cobbs Statue');
              },
              child: Container(
                height: 48,
                width: 153,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    'Tasha Cobbs Statue',
                    style: PSTextStyle.virtualtourtexts,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 260,
            right: 1,
            child: GestureDetector(
              onTap: () {
                changePanoramaImage('assets/images/virtual/virtual7.jpg',
                    'Gerald Pique Fountain');
              },
              child: Container(
                height: 48,
                width: 165,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    'Gerald Pique Fountain',
                    style: PSTextStyle.virtualtourtexts,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 400,
            left: 1,
            child: Container(
              height: 128,
              width: 53,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                border: Border.all(color: Colors.white),
                color: Colors.white.withOpacity(0.3),
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: psWhite,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 5,
            child: Text(
              selectedContainerText,
              style: PSTextStyle.universityName.copyWith(color: psWhite),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 6,
            child: SizedBox(
              height: 45,
              width: 160,
              child: PsCardButton(
                onPressed: () {
                  changePanoramaImageToVideo(
                      'assets/images/virtual/virtual_video1.mp4');
                },
                textColor: psBlack1,
                buttonText: 'Automatic Tour',
                buttonColor: psColorPrimary1000,
              ),
            ),
          ),
          const Positioned(
            bottom: 30,
            right: 5,
            child: Icon(
              Icons.volume_off,
              size: 40,
              color: psWhite,
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenPlayer extends StatefulWidget {
  final ChewieController controller;

  const FullScreenPlayer({super.key, required this.controller});

  @override
  _FullScreenPlayerState createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Chewie(
        controller: widget.controller,
      ),
    );
  }
}
