import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import '../extensions/extensions.dart';
import '../on_boarding_page.dart';

class TaskManagementOnBoarding extends StatefulWidget {
  const TaskManagementOnBoarding({super.key});

  @override
  State<TaskManagementOnBoarding> createState() => _TaskManagementOnBoardingState();
}

class _TaskManagementOnBoardingState extends State<TaskManagementOnBoarding> {
  final _controller = PageController(initialPage: 0);
  int _currentPage = 0;

  final _pages = <OnBaordingPage>[
    OnBaordingPage(
      title: 'Create Your Schedule',
      description: 'Make your important schedule well organized at work to make your work easier for later.',
      image: Assets.svg.taskManagement.createSchedule.path,
    ),
    OnBaordingPage(
      title: 'Easily Manage Task',
      description: 'You can easily organize your work and schedule properly so that you are more comfertable while doing work.',
      image: Assets.svg.taskManagement.manageTask.path,
    ),
    OnBaordingPage(
      title: "Ready Start Your Day",
      description:
          "And after all your schedule has been arranged properly and neatly, Now you are ready to start your day with find. Enjoy your day.",
      image: Assets.svg.taskManagement.startDay.path,
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
      color: const Color(0xFFe7d4c1),
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
                              50.vSpacer,
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
                                    color: const Color(0xFF030217),
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
                ),
              ),
              // 20.vSpacer,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: _pages.length,
                    onDotClicked: jumpToPage,
                    effect: const ExpandingDotsEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                      dotColor: Color(0xFFCB4F2E),
                      activeDotColor: Color(0xFF030217),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (!isLastPage)
                        TextButton(
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
                      8.hSpacer,
                      TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: _currentPage / (_pages.length + 1), end: (_currentPage + 1) / (_pages.length + 1)),
                          duration: const Duration(milliseconds: 500),
                          builder: (context, progress, widget) {
                            return SquarePercentIndicator(
                              width: 70,
                              height: 70,
                              startAngle: StartAngle.topRight,
                              // reverse: true,
                              borderRadius: 4,
                              shadowWidth: 1.5,
                              progressWidth: 2,
                              shadowColor: Colors.transparent,
                              progressColor: Colors.black,
                              progress: progress,
                              child: TextButton(
                                onPressed: () {
                                  if (isLastPage) {
                                    // do something for getting started
                                    return;
                                  }
                                  goToNextPage();
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  minimumSize: const Size.square(50),
                                ),
                                child: const Icon(
                                  Icons.chevron_right,
                                ),
                              ).paddingAll(4),
                            );
                          }),
                    ],
                  )
                ],
              ).paddingSymmetric(horizontal: 20),
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
