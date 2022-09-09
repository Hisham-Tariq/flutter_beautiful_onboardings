import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_onboardings/app/extensions/extensions.dart';
import 'package:flutter_beautiful_onboardings/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app/1.travel/travel.dart';
import 'app/2.online_shopping/online_shopping.dart';
import 'app/3.task_management/task_management.dart';
import 'app/4.bitcoin/bitcoin.dart';
import 'app/5.food_delivery/food_delivery.dart';

void main() {
  runApp(FlutterBeautifulOnBoardingsApp());
}

const _repoUrl = 'https://github.com/Hisham-Tariq/flutter_beautiful_onboardings';

class OnBoardingScreens {
  final Widget screen;
  final String title;
  final String thumbnail;
  final String fileUrl;

  const OnBoardingScreens(this.screen, this.title, this.thumbnail, this.fileUrl);
}

class FlutterBeautifulOnBoardingsApp extends StatefulWidget {
  const FlutterBeautifulOnBoardingsApp({super.key});

  @override
  State<FlutterBeautifulOnBoardingsApp> createState() => _FlutterBeautifulOnBoardingsAppState();
}

class _FlutterBeautifulOnBoardingsAppState extends State<FlutterBeautifulOnBoardingsApp> {
  final _carouselController = CarouselController();

  final List<OnBoardingScreens> onBoardings = [
    OnBoardingScreens(
      const TravelingOnBoarding(),
      'Traveling',
      Assets.svg.travel.enjoy.path,
      '$_repoUrl/blob/master/lib/app/1.travel/travel.dart',
    ),
    OnBoardingScreens(
      const OnlineShoppingOnBoarding(),
      'Online Shopping',
      Assets.svg.onlineShopping.onlineShopping.path,
      '$_repoUrl/blob/master/lib/app/2.online_shopping/online_shopping.dart',
    ),
    OnBoardingScreens(
      const TaskManagementOnBoarding(),
      'Task Management',
      Assets.svg.taskManagement.startDay.path,
      '$_repoUrl/blob/master/lib/app/3.task_management/task_management.dart',
    ),
    OnBoardingScreens(
      const BitcoinOnBoarding(),
      'Bitcoin',
      Assets.svg.bitcoin.highlyBlockchained.path,
      '$_repoUrl/blob/master/lib/app/4.bitcoin/bitcoin.dart',
    ),
    OnBoardingScreens(
      const FoodDeliveryOnBoarding(),
      'Food Delivery',
      Assets.svg.foodDelivery.lunchTime.path,
      '$_repoUrl/blob/master/lib/app/5.food_delivery/food_delivery.dart',
    ),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              20.vSpacer,
              Text(
                'Beautiful OnBoardings',
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
              CarouselSlider.builder(
                carouselController: _carouselController,
                options: CarouselOptions(
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  aspectRatio: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  clipBehavior: Clip.antiAlias,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                itemCount: onBoardings.length,
                itemBuilder: (context, index, realIndex) {
                  return GestureDetector(
                    onTap: () => goToOnBoarding(context, index),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      // random Color
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 4,
                            color: Colors.black,
                          )),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: SvgPicture.asset(
                              onBoardings[index].thumbnail,
                              // width: MediaQuery.of(context).size.width.percent(80),
                              // height: 250,
                            ).paddingAll(20),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 50,
                              color: Colors.black,
                              alignment: Alignment.center,
                              child: Text(
                                onBoardings[index].title,
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context).textTheme.headline6,
                                  color: Colors.white,
                                ),
                              ).paddingSymmetric(horizontal: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).marginOnly(top: 20),
              // show on github page Outlined Button
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(onBoardings[currentIndex].fileUrl),
                    mode: LaunchMode.externalApplication,
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  minimumSize: const Size(20000, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Open Code',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Assets.svg.icons.code.svg(
                      width: 24,
                      height: 24,
                      color: Colors.black,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20),
              ).paddingSymmetric(horizontal: 20).marginOnly(top: 20),
              TextButton(
                onPressed: () {
                  launchUrl(
                    Uri.parse(_repoUrl),
                    mode: LaunchMode.externalApplication,
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(20000, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Repository on Github',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Assets.images.icons.github.image(
                      width: 24,
                      height: 24,
                      color: Colors.white,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20),
              ).paddingSymmetric(horizontal: 20).marginOnly(top: 8),
              20.vSpacer,
              // Made with love and all that and like on the github page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Made with',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    size: 24,
                    color: Colors.red,
                  ),
                  Text(
                    'by',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' Hisham-Tariq',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ).marginOnly(top: 20),
              20.vSpacer,
            ],
          ),
        ),
      ),
    );
  }

  goToOnBoarding(context, index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PagesWrapper(onBoarding: onBoardings[index]),
      ),
    );
  }
}

class PagesWrapper extends StatelessWidget {
  const PagesWrapper({super.key, required this.onBoarding});
  final OnBoardingScreens onBoarding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: onBoarding.screen.marginOnly(top: 50)),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                )),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        onBoarding.title,
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline6,
                        ),
                      ).paddingSymmetric(horizontal: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
