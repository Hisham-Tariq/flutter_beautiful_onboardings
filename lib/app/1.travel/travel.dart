import 'package:flutter/material.dart';
import 'package:flutter_beautiful_onboardings/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../extensions/extensions.dart';

class OnBaordingPage {
  final String title;
  final String description;
  final String image;
  OnBaordingPage({required this.title, required this.description, required this.image});
}

class TravelingOnBoarding extends StatefulWidget {
  const TravelingOnBoarding({super.key});

  @override
  State<TravelingOnBoarding> createState() => _TravelingOnBoardingState();
}

class _TravelingOnBoardingState extends State<TravelingOnBoarding> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  final _pages = <OnBaordingPage>[
    OnBaordingPage(
      title: 'Select your destiny',
      description: 'Choose your destination, plan your tour. Select the fabulous place for your holiday.',
      image: Assets.svg.travel.selectDestination.path,
    ),
    OnBaordingPage(
      title: 'Schedule your trip',
      description: 'Chose the date and get your ticket. We give you the best price.',
      image: Assets.svg.travel.schedule.path,
    ),
    OnBaordingPage(
      title: "Lets's Enjoy!",
      description: "Enjoy your holiday! don't forget to take awesome pictures and share with your friends.",
      image: Assets.svg.travel.enjoy.path,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  onPageChange(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      child: Material(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    '0${_currentPage + 1}',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    ' /0${_pages.length}',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      // fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: onPageChange,
                      itemCount: _pages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _pages[index].title,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              _pages[index].description,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (_pages[index].image.isSvg)
                              SizedBox(
                                child: SvgPicture.asset(
                                  _pages[index].image,
                                  fit: BoxFit.scaleDown,
                                ),
                              ).expanded()
                            else if (_pages[index].image.isPng)
                              Image.asset(_pages[index].image)
                          ],
                        );
                      },
                    ),
                  );
                },
              )
                  .paddingOnly(
                    top: 20,
                    bottom: 20,
                  )
                  .expanded(),
              SmoothPageIndicator(
                controller: _controller,
                count: _pages.length,
                onDotClicked: jumpToPage,
                effect: const ScaleEffect(
                  radius: 2,
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.black,
                ),
              ),
              20.vSpacer,
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey.shade500,
                    ),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).expanded(),
                  20.hSpacer,
                  TextButton(
                    onPressed: goToNextPage,
                    child: const Text('Next'),
                  ).expanded(),
                ],
              ),
            ],
          ).marginAll(20),
        ),
      ),
    );
  }

  goToNextPage() {
    _controller.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  jumpToPage(int index) {
    _controller.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}
