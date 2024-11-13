import 'package:valetparking_owner/utils/constants/exports.dart';

class FloatingSnackBar extends StatefulWidget {
  final BuildContext context;
  final String message;
  final Color textColor;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Duration duration;

  const FloatingSnackBar({
    required this.context,
    required this.message,
    this.textColor = Colors.white,
    this.textStyle,
    required this.backgroundColor,
    this.duration = const Duration(seconds: 3),
    super.key,
  });

  static void show({
    required BuildContext context,
    required String message,
    Color textColor = Colors.white,
    TextStyle? textStyle,
    required Color backgroundColor,
    Duration duration = const Duration(seconds: 3),
  }) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => FloatingSnackBar(
        context: context,
        message: message,
        textColor: textColor,
        textStyle: textStyle,
        backgroundColor: backgroundColor,
        duration: duration,
      ),
    );

    // Insert the overlay entry
    overlayState.insert(overlayEntry);

    // Remove the overlay after the specified duration
    Future.delayed(duration + const Duration(milliseconds: 300), () {
      overlayEntry.remove();
    });
  }

  @override
  _FloatingSnackBarState createState() => _FloatingSnackBarState();
}

class _FloatingSnackBarState extends State<FloatingSnackBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Start above the screen
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50.h,
      width: MediaQuery.of(context).size.width,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                AppBoxShadows.buttonShadowOne,
              ],
            ),
            child: Text(
              widget.message,
              style: widget.textStyle ??
                  VStyles.bodyLargeSemiBold(context).copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
