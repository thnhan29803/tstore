import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:t_store/features/shop/controllers/home_controller.dart';
import 'package:t_store/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoVideoSlider extends StatefulWidget {
  const TPromoVideoSlider({
    super.key, required this.banners,
  });

  final List<String> banners; // Assume this contains asset paths like 'assets/videos/video1.mp4'

  @override
  _TPromoVideoSliderState createState() => _TPromoVideoSliderState();
}

class _TPromoVideoSliderState extends State<TPromoVideoSlider> {
  late List<VideoPlayerController> _controllers;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controllers = widget.banners.map((path) {
      final controller = VideoPlayerController.asset(path)
        ..initialize().then((_) {
          setState(() {}); // Refresh to show video
        });
      return controller;
    }).toList();

    // Start playing the first video
    if (_controllers.isNotEmpty) {
      _controllers[0].play();
    }
  }

  @override
  void dispose() {
    // Pause all videos and dispose of the controllers
    for (var controller in _controllers) {
      controller.pause();
      controller.dispose();
    }
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Pause the currently playing video
    if (_controllers.isNotEmpty) {
      _controllers[_currentIndex].play();
    }

    // Pause other videos
    for (int i = 0; i < _controllers.length; i++) {
      if (i != _currentIndex) {
        _controllers[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => _onPageChanged(index),
          ),
          items: _controllers.map((controller) {
            return AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            );
          }).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Center(
          child: Obx(
                () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < widget.banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i ? TColors.primary : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
