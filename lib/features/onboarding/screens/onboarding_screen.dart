import 'package:valetparking_owner/utils/constants/exports.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  PageController? controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> onBoardingMainTexts = VConstants.onBoardingMainTexts;
    List<String> onBoardingDetailsTexts = VConstants.onBoardingDetailsTexts;

    return Scaffold(
      backgroundColor: VColors.whiteColor,
      body: Column(
        children: [
          /// OnBoarding Body
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: VConstants.onBoardingImage.length,
              onPageChanged: (int index) => setState(() => currentIndex = index),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    /// OnBoarding Logos
                    Padding(
                      padding: EdgeInsets.only(left: 60.w, right: 60.w, top: index == 0 ? 169.h : index == 1 ? 160.h : 200.h, bottom: 60.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            VConstants.onBoardingImage[index],
                            width: index == 0 ? 309.w : index == 1 ? 261.w : 330.w,
                            height: index == 0 ? 250.h : index == 1 ? 250.h : 200.h,
                          ),
                        ],
                      ),
                    ),

                    /// OnBoarding Texts
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              onBoardingMainTexts[index],
                              style: VStyles.h3Bold(context),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 20.h),

                            Text(
                              onBoardingDetailsTexts[index],
                              style: VStyles.bodyLargeRegular(context).copyWith(color: VColors.greyScale700),
                              textAlign: TextAlign.center,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          /// Make Space
          SizedBox(height: 40.h),

          /// Dot Generator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onBoardingMainTexts.length,
                  (index) => VDeviceUtils.buildDotWidget(
                  index,
                  currentIndex,
                  context,
                  BoxDecoration(
                      gradient: currentIndex == index ? AppGradients.gradientUltramarineBlue : null,
                      color: currentIndex == index ? null : VColors.greyScale300,
                      borderRadius: BorderRadius.circular(100.r))),
            ),
          ),

          /// Make Space
          SizedBox(height: 40.h),

          SizedBox(
            width: double.infinity,
            height: 128.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainButtonWidget(
                  centerWidgetInButton: Text(currentIndex == VConstants.onBoardingImage.length-1 ? AppLocalizations.of(context)!.translate('continue')! : AppLocalizations.of(context)!.translate('next')!, style: VStyles.bodyLargeBold(context).copyWith(color: VColors.whiteColor)),
                  onTap: () {
                    if(currentIndex == VConstants.onBoardingImage.length - 1) {
                      /// Navigate to Check Screen
                      context.pushNamed(VRoutesName.loginAccountRoute);
                    }
                    controller!.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  margin: EdgeInsets.zero,
                  // margin: EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w),
                  buttonColor: VColors.primaryColor500,
                  boxShadow: const [],
                ),
                MainButtonWidget(
                  centerWidgetInButton: Text('Skip', style: VStyles.bodyLargeBold(context).copyWith(color: VColors.primaryColor500)),
                  onTap: () {
                    context.pushNamed(VRoutesName.loginAccountRoute);
                  },
                  margin: EdgeInsets.zero,
                  // margin: EdgeInsets.only(bottom: 48.h, left: 24.w, right: 24.w),
                  buttonColor: VColors.primaryColor100,
                  boxShadow: const [],
                ),
              ],
            ),
          ),

          /// Make Space
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
