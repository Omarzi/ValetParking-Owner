import 'dart:async';
import 'package:valetparking_owner/utils/constants/exports.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      context.pushNamedAndRemoveUntil(VRoutesName.onBoardingRoute, predicate: (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(VImages.welcomeImage), fit: BoxFit.fill)
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: 32.w,
            left: 32.w,
            bottom: 48.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.translate('welcome')!,
                style: VStyles.h1Bold(context).copyWith(color: Colors.white),
              ),
              // SizedBox(height: 12.h),
              Text(
                AppLocalizations.of(context)!.translate('valet')!,
                style: VStyles.h1Bold(context).copyWith(color: Colors.white, fontSize: 96.sp),
              ),
              // SizedBox(height: 24.h),
              Text(
                AppLocalizations.of(context)!.translate('welcomeToValet')!,
                style: VStyles.bodyXLargeSemiBold(context).copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
