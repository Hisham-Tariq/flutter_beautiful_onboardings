import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_beautiful_onboardings/gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../extensions/extensions.dart';
import '../on_boarding_page.dart';

class OnlineShoppingOnBoarding extends StatefulWidget {
  const OnlineShoppingOnBoarding({super.key});

  @override
  State<OnlineShoppingOnBoarding> createState() => _OnlineShoppingOnBoardingState();
}

class _OnlineShoppingOnBoardingState extends State<OnlineShoppingOnBoarding> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  final _pages = <OnBaordingPage>[
    OnBaordingPage(
      title: 'Online Shopping',
      description: 'Everything you need. Choose your favorite product and order now.',
      image: Assets.svg.onlineShopping.onlineShopping.path,
    ),
    OnBaordingPage(
      title: 'Easy & Secure Payment',
      description: 'Simple and reliable. Keeping your transaction secured.',
      image: Assets.svg.onlineShopping.safePayment.path,
    ),
    OnBaordingPage(
      title: "Fast Delivery",
      description: "Fast, free and convenient delivery choices on millions of items.",
      image: Assets.svg.onlineShopping.fastDelivery.path,
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
                                if (_pages[index].image.isSvg)
                                  SizedBox(
                                    child: SvgPicture.asset(
                                      _pages[index].image,
                                      height: constraints.maxHeight.percent(80),
                                    ),
                                  )
                                else if (_pages[index].image.isPng)
                                  Image.asset(_pages[index].image),
                                Center(
                                  child: Text(
                                    _pages[index].title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                12.vSpacer,
                                Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    _pages[index].description,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Colors.grey.shade500,
                                    ),
                                  ).paddingSymmetric(
                                    horizontal: 20,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ).paddingOnly(
                    top: 20,
                    bottom: 20,
                  ),
                ),
                // 20.vSpacer,
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: _pages.length,
                      onDotClicked: jumpToPage,
                      effect: const WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        activeDotColor: Colors.amber,
                      ),
                    ),
                    HorizontalSlidableButton(
                      width: MediaQuery.of(context).size.width.percent(60),
                      buttonWidth: isLastPage ? 120.0 : 80,
                      height: 50,
                      // color: Colors.amber.withOpacity(0.5),
                      border: Border.all(
                        color: Colors.grey.shade400,
                        width: 1,
                      ),
                      buttonColor: Colors.amber,
                      dismissible: false,
                      label: Center(
                        child: Text(
                          isLastPage ? 'Get Started' : 'Next',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      isRestart: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Text('Left'),
                          Assets.svg.icons.trippleArrow.svg()
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      onChanged: (position) {
                        if (isLastPage) {
                          // do something else
                          return;
                        }
                        goToNextPage();
                      },
                    ),
                  ],
                ),
              ],
            ).marginAll(20);
          }),
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
