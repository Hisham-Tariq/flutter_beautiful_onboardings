import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import '../extensions/extensions.dart';
import '../on_boarding_page.dart';

class BitcoinOnBoarding extends StatefulWidget {
  const BitcoinOnBoarding({super.key});

  @override
  State<BitcoinOnBoarding> createState() => _BitcoinOnBoardingState();
}

class _BitcoinOnBoardingState extends State<BitcoinOnBoarding> {
  final _imagePageController = PageController(initialPage: 0);
  final _headingsPageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final _pages = <OnBaordingPage>[
    OnBaordingPage(
      title: 'Manage it Anywhere',
      description: 'Finances is the one of the important prerequisite to start a bussiness.',
      image: Assets.svg.bitcoin.manageAnyWhere.path,
    ),
    OnBaordingPage(
      title: 'Always In Your Pocket!',
      description: 'Financial management is required throughout the a bussiness\'s lifetime.',
      image: Assets.svg.bitcoin.alwaysInPocket.path,
    ),
    OnBaordingPage(
      title: "Highly Blockchained",
      description: 'Any bussiness thaht manages its finances with blockchain wins.',
      image: Assets.svg.bitcoin.highlyBlockchained.path,
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
              Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Text(
                          'B',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        ' itcoin'.toUpperCase(),
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20).paddingOnly(top: 20),
              SizedBox(
                height: constraints.maxHeight.percent(65),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _imagePageController,
                            onPageChanged: onPageChange,
                            itemCount: _pages.length,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  60.vSpacer,
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
                                  Spacer(),
                                  Center(
                                    child: Text(
                                      _pages[index].title,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF030217),
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
                                        color: Colors.grey.shade600,
                                      ),
                                    ).paddingSymmetric(
                                      horizontal: 20,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                          Positioned(
                            top: constraints.maxHeight.percent(70),
                            left: 0,
                            right: 0,
                            child: Container(
                              alignment: Alignment.center,
                              child: SmoothPageIndicator(
                                controller: _imagePageController,
                                count: _pages.length,
                                onDotClicked: jumpToPage,
                                effect: ExpandingDotsEffect(
                                  dotHeight: 2,
                                  dotWidth: 16,
                                  dotColor: Colors.grey.shade600,
                                  activeDotColor: const Color(0xFF030217),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildButtons(),
              ).marginOnly(bottom: 20),
            ],
          ).marginAll(0);
        }),
      ),
    );
  }

  goToNextPage() {
    _imagePageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  jumpToPage(int index) {
    _imagePageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  _buildButtons() {
    if (isLastPage) {
      return Column(
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFe8e8e8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size.fromHeight(60),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Login'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Assets.svg.icons.login.svg(
                  color: Colors.black,
                ),
              ],
            ).paddingSymmetric(horizontal: 8),
          ).paddingSymmetric(horizontal: 20),
          20.vSpacer,
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size.fromHeight(60),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Signup'.toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Icon(
                  Icons.person_add,
                  color: Colors.black,
                ),
              ],
            ).paddingSymmetric(horizontal: 8),
          ).paddingSymmetric(horizontal: 20),
        ],
      );
    }
    return TextButton(
      onPressed: goToNextPage,
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size.fromHeight(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Next'.toUpperCase(),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
          ),
          Assets.svg.icons.trippleArrow.svg(
            color: Colors.white,
          ),
        ],
      ).paddingSymmetric(horizontal: 8),
    ).paddingSymmetric(horizontal: 20);
  }
}
