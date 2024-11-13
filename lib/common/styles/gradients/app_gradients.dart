import '../../../utils/constants/exports.dart';

class AppGradients {
  /// Gradient Ultramarine Blue
  static final LinearGradient gradientUltramarineBlue = LinearGradient(
    colors: [
      VColors.gradientPrimary100,
      VColors.gradientPrimary01,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
  );
  /// Purple Gradient
  static final LinearGradient purpleGradient = LinearGradient(
    colors: [
      VColors.gradientPurple2,
      VColors.gradientPurple1,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
  );
  /// Green Gradient
  static final LinearGradient greenGradient = LinearGradient(
    colors: [
      VColors.gradientGreen101,
      VColors.gradientGreen2100,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
  );
  /// Red Gradient
  static final LinearGradient redGradient = LinearGradient(
    colors: [
      VColors.gradientRed101,
      VColors.gradientRed2100,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
  );
  /// White Gradient
  static final LinearGradient whiteGradient = LinearGradient(
    colors: [
      VColors.whiteColor,
      VColors.whiteColor,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: const [0, 1],
  );
}
