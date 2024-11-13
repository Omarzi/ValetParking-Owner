import 'package:valetparking_owner/utils/constants/exports.dart';

class CircularTimerWidget extends StatefulWidget {
  const CircularTimerWidget({super.key});

  @override
  _CircularTimerWidgetState createState() => _CircularTimerWidgetState();
}

class _CircularTimerWidgetState extends State<CircularTimerWidget> {
  int endTime = DateTime.now().millisecondsSinceEpoch +
      1000 * 60 * 60 * 3; // 3 hours from now

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (context, time) {
        double percent = 0.0;
        if (time != null) {
          int totalSeconds = 3 * 60 * 60; /// 3 hours in seconds
          int remainingSeconds =
              time.hours! * 3600 + time.min! * 60 + time.sec!;
          percent = 1 - (remainingSeconds / totalSeconds);
        }
        return CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 12.0,
          percent: percent,
          circularStrokeCap: CircularStrokeCap.round,
          center: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${time?.hours?.toString().padLeft(2, '0') ?? '00'} : ${time?.min?.toString().padLeft(2, '0') ?? '00'} : ${time?.sec?.toString().padLeft(2, '0') ?? '00'}",
                style: VStyles.h2Bold(context),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Hours",
                    style: VStyles.bodySmallRegular(context).copyWith(
                      color: VColors.greyScale700,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Minutes",
                    style: VStyles.bodySmallRegular(context).copyWith(
                      color: VColors.greyScale700,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text(
                    "Seconds",
                    style: VStyles.bodySmallRegular(context).copyWith(
                      color: VColors.greyScale700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          progressColor: VColors.primaryColor500,
          backgroundColor: VColors.greyScale100,
        );
      },
    );
  }
}