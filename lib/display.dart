import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'video_item.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  // VideoPlayerController _videoPlayerController;
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer.periodic(Duration(seconds: 10), (Timer timer) {
  //     if (_currentPage < 5) {
  //       _currentPage++;
  //     } else {
  //       _currentPage = 0;
  //     }
  //
  //     _pageController.animateToPage(
  //       _currentPage,
  //       duration: Duration(milliseconds: 350),
  //       curve: Curves.easeIn,
  //     );
  //   });
  //   // _pageController = PageController();
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Display'),
      // ),
      body: Center(
        child: PageView(
          controller: _pageController,
          children: <Widget>[
            CarouselSlider(
                items: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/img1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  VideoItems(
                    videoPlayerController:
                        VideoPlayerController.asset('assets/Humnava1.mp4'),
                    looping: true,
                    autoplay: true,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/img2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  VideoItems(
                    videoPlayerController:
                        VideoPlayerController.asset('assets/Humnava2.mp4'),
                    looping: true,
                    autoplay: true,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/img3.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  VideoItems(
                    videoPlayerController:
                        VideoPlayerController.asset('assets/video3.mp4'),
                    looping: true,
                    autoplay: true,
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 7),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                ))
          ],
        ),
      ),
    );
  }
}
