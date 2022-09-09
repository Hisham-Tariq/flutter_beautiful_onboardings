import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import '../extensions/extensions.dart';
import '../on_boarding_page.dart';

class FoodDeliveryOnBoardingPage extends OnBaordingPage {
  final String subTitle;
  FoodDeliveryOnBoardingPage({required super.title, required this.subTitle, required super.description, required super.image});
}

class FoodDeliveryOnBoarding extends StatefulWidget {
  const FoodDeliveryOnBoarding({super.key});

  @override
  State<FoodDeliveryOnBoarding> createState() => _FoodDeliveryOnBoardingState();
}

class _FoodDeliveryOnBoardingState extends State<FoodDeliveryOnBoarding> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  final _pages = <FoodDeliveryOnBoardingPage>[
    FoodDeliveryOnBoardingPage(
      title: 'Eat Healthy Food',
      subTitle: 'Create an Account',
      description: 'Food is any substance consumed to provide nutritional support for an organism.',
      image: Assets.svg.foodDelivery.lunchTime.path,
    ),
    FoodDeliveryOnBoardingPage(
      title: '30 Mint Delivery',
      subTitle: 'Log Into Account',
      description: 'Food is any substance consumed to provide nutritional support for an organism.',
      image: Assets.svg.foodDelivery.takeAway.path,
    ),
    FoodDeliveryOnBoardingPage(
      title: "Enjoy our Services",
      subTitle: 'Easy Payment',
      description: 'Food is any substance consumed to provide nutritional support for an organism.',
      image: Assets.svg.foodDelivery.orderFood.path,
    ),
  ];

  bool get isLastPage => _currentPage == _pages.length - 1;

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
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              SizedBox(
                height: constraints.maxHeight.percent(80),
                child: LayoutBuilder(
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
                              20.vSpacer,
                              Text(
                                _pages[index].subTitle,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xFFfd6d27),
                                ),
                              ).paddingSymmetric(horizontal: 20),
                              Text(
                                _pages[index].title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xFF030217),
                                ),
                              ).paddingSymmetric(horizontal: 20),
                              50.vSpacer,
                              if (_pages[index].image.isSvg)
                                Center(
                                  child: SizedBox(
                                    height: constraints.maxHeight.percent(50),
                                    child: SvgPicture.asset(
                                      _pages[index].image,
                                      width: constraints.maxWidth.percent(80),
                                    ),
                                  ),
                                )
                              else if (_pages[index].image.isPng)
                                Image.asset(
                                  _pages[index].image,
                                  width: constraints.maxWidth.percent(80),
                                ),
                              20.vSpacer,
                              Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  _pages[index].description,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: const Color(0xFF030217),
                                  ),
                                ).paddingSymmetric(
                                  horizontal: 20,
                                ),
                              ),
                              50.vSpacer,
                            ],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // 20.vSpacer,

              SizedBox(
                height: 80,
                child: Stack(
                  children: [
                    if (!isLastPage)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                          ),
                          child: Text(
                            'Skip',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: Alignment.center,
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: _pages.length,
                        onDotClicked: jumpToPage,
                        effect: WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: const Color(0xFFfd6d27).withOpacity(0.3),
                          activeDotColor: const Color(0xFFfd6d27),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: goToNextPage,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Text(
                          isLastPage ? 'Get Started' : 'Next',
                          style: GoogleFonts.poppins(
                            color: isLastPage ? Color(0xFFfd6d27) : Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20),
              ),
            ],
          ).marginAll(0);
        }),
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
