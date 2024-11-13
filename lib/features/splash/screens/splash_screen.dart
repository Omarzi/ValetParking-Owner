import 'package:valetparking_owner/utils/constants/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigationToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: AppGradients.gradientUltramarineBlue),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [
                      SvgPicture.asset(VImages.appLogo,  width: 150.w, height: 200.h),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: VDeviceUtils.getScreenWidth(context) / 5,
              right: VDeviceUtils.getScreenWidth(context) / 5,
              bottom: 25.h,
              child: Lottie.asset(VImages.loadingLottie, height: VDeviceUtils.getScreenHeight(context) / 6),
              ),
          ],
        ),
      ),
    );
  }

  void navigationToHome() {
    Future.delayed(
      const Duration(seconds: 4),
          () {
        if (VCacheHelper.getString(key: CacheKeys.token) == '') {
          context.pushNamedAndRemoveUntil(VRoutesName.welcomeRoute, predicate: (route) => false);
        } else {
          context.pushReplacementNamed(VRoutesName.homeRoute);
        }
      },
    );
  }
}
