import 'package:valetparking_owner/features/auth/presentation/screens/login_screen.dart';
import 'package:valetparking_owner/features/auth/presentation/screens/otp_in_create_and_login_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/attendance/attendance_in_end_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/attendance/attendance_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/attendance/attendances_in_start_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/choice_attendances.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/garages/add_new_garage_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/add_wallet_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/all_drivers_and_garage_details_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_drivers/add_new_driver_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_places/all_garages_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/all_subowners_owners/all_sub_owners_screen.dart';
import 'package:valetparking_owner/features/home/presentation/screens/home_screen.dart';
import 'package:valetparking_owner/features/onboarding/screens/onboarding_screen.dart';
import 'package:valetparking_owner/features/onboarding/screens/welcome_screen.dart';
import 'package:valetparking_owner/features/splash/screens/splash_screen.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case VRoutesName.splashRoute:
        return PageTransition(
          child: const SplashScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.welcomeRoute:
        return PageTransition(
          child: const WelcomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.onBoardingRoute:
        return PageTransition(
          child: const OnBoardingScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.createAccountRoute:
      //   return PageTransition(
      //     child: const CreateAccountScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.fillYourRoute:
      //   // String phoneNumber = settings.arguments as String;
      //
      //   return PageTransition(
      //     child: const FillYourProfileScreen(),
      //     // child: FillYourProfileScreen(phoneNumber: phoneNumber),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.loginAccountRoute:
        return PageTransition(
          child: const LoginScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.forgetPasswordRoute:
      //   return PageTransition(
      //     child: const ForgetPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.enterEmailRoute:
      //   return PageTransition(
      //     child: const EnterEmailScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.enterNewPasswordRoute:
      //   return PageTransition(
      //     child: const CreateNewPasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      case VRoutesName.otpRoute:
        // String emailAddress = settings.arguments as String;
      Map data = settings.arguments as Map;

        return PageTransition(
          child: OtpInCreateAndLoginScreen(data: data),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.homeRoute:
        return PageTransition(
          child: HomeScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allDriversRoute:
        return PageTransition(
          child: AllDriversAndGarageDetailsScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.choiceAttendanceRoute:
        return PageTransition(
          child: ChoiceAttendances(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.attendancesInStartRoute:
        return PageTransition(
          child: AttendancesInStartScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.attendancesInEndRoute:
        return PageTransition(
          child: AttendancesInEndScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allSubOwnersRoute:
        return PageTransition(
          child: AllSubOwnersScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.addWalletRoute:
        return PageTransition(
          child: AddWalletScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.allGaragesRoute:
        return PageTransition(
          child: AllGaragesScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.addNewGarageRoute:
        return PageTransition(
          child: AddNewGarageScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.addNewDriverRoute:
        String screenName = settings.arguments as String;
        return PageTransition(
          child: AddNewDriverScreen(screenName: screenName),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case VRoutesName.attendancesRoute:
        return PageTransition(
          child: AttendancesScreen(),
          type: PageTransitionType.rightToLeft,
          settings: settings,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      // case VRoutesName.placeDetailsRoute:
      //   return PageTransition(
      //     child: const PlaceDetailsScreens(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.choiceYourPassenger:
      //   Map map = settings.arguments as Map;
      //
      //   return PageTransition(
      //     child: ChoicePassengersScreen(map: map),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.choiceDataAndTimeRoute:
      //   Map map = settings.arguments as Map;
      //
      //   return PageTransition(
      //     child: ChoiceDateAndTimeScreen(map: map),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.reviewSummaryRoute:
      //   return PageTransition(
      //     child: const ReviewSummaryScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.parkingTicketRoute:
      //   return PageTransition(
      //     child: const ParkingTicketScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.parkingTimerRoute:
      //   return PageTransition(
      //     child: const ParkingTimerScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.walletRoute:
      //   return PageTransition(
      //     child: const WalletScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.editProfileRoute:
      //   return PageTransition(
      //     child: const EditProfileScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.changePasswordRoute:
      //   return PageTransition(
      //     child: const ChangePasswordScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.allOrdersRoute:
      //   return PageTransition(
      //     child: const AllOrdersScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.allUsersRoute:
      //   return PageTransition(
      //     child: const AllUsersScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.allDriversRoute:
      //   return PageTransition(
      //     child: const AllDriversScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.addNewUserRoute:
      //   return PageTransition(
      //     child: const AddNewUserScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      // case VRoutesName.privacyPolicyRoute:
      //   return PageTransition(
      //     child: const PrivacyPolicyScreen(),
      //     type: PageTransitionType.rightToLeft,
      //     settings: settings,
      //     duration: const Duration(milliseconds: 500),
      //     reverseDuration: const Duration(milliseconds: 500),
      //   );
      default:
        return unDefinedRoute();
    }
  }

  /// Un Defined Route
  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '',
          ),
        ),
        body: const Center(
          child: Text(
            '',
          ),
        ),
      ),
    );
  }
}