// import 'exports.dart';
//
// abstract class VStyles {
//
//   static String getFontFamily(BuildContext context) {
//     return Localizations.localeOf(context).languageCode == 'ar' ? 'Cairo' : 'Urbanist';
//   }
//
//   /// Heading
//   static TextStyle h1Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 48.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h2Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 40.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h3Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 32.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h4Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h5Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h6Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//
//   /// Body
//   /// XLarge
//   static TextStyle bodyXLargeRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Large
//   static TextStyle bodyLargeRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Medium
//   static TextStyle bodyMediumRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Small
//   static TextStyle bodySmallRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// XSmall
//   static TextStyle bodyXSmallRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
// }
import 'exports.dart';

abstract class VStyles {
  static String getFontFamily(BuildContext context) {
    return Localizations.localeOf(context).languageCode == 'ar' ? 'Cairo' : 'Urbanist';
  }

  /// Heading
  static TextStyle h1Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 48.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );
  static TextStyle h2Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 40.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );
  static TextStyle h3Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );
  static TextStyle h4Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );
  static TextStyle h5Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );
  static TextStyle h6Bold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
  );

  /// Body
  /// XLarge
  static TextStyle bodyXLargeRegular(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXLargeSemiBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXLargeBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXLargeMedium(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );

  /// Large
  static TextStyle bodyLargeRegular(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyLargeSemiBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyLargeBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyLargeMedium(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );

  /// Medium
  static TextStyle bodyMediumRegular(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyMediumSemiBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyMediumBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyMediumMedium(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );

  /// Small
  static TextStyle bodySmallRegular(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodySmallSemiBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodySmallBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodySmallMedium(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );

  /// XSmall
  static TextStyle bodyXSmallRegular(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXSmallSemiBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXSmallBold(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.bold,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
  static TextStyle bodyXSmallMedium(BuildContext context) => TextStyle(
    color: VColors.greyScale900,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    fontFamily: getFontFamily(context),
    letterSpacing: .2.w,
  );
}


// import 'exports.dart';
//
// abstract class VStyles {
//   /// Heading
//   static TextStyle h1Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 48.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h2Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 40.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h3Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 32.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h4Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 24.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h5Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 20.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//   static TextStyle h6Bold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//   );
//
//   /// Body
//   /// XLarge
//   static TextStyle bodyXLargeRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXLargeMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 18.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Large
//   static TextStyle bodyLargeRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyLargeMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 16.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Medium
//   static TextStyle bodyMediumRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyMediumMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 14.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// Small
//   static TextStyle bodySmallRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodySmallMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//
//   /// XSmall
//   static TextStyle bodyXSmallRegular = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w400,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallSemiBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallBold = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
//   static TextStyle bodyXSmallMedium = TextStyle(
//     color: VColors.greyScale900,
//     fontSize: 12.sp,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Urbanist',
//     letterSpacing: .2.w,
//   );
// }