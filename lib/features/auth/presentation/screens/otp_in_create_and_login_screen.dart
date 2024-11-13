import 'package:valetparking_owner/common/widgets/texts_rich/text_rich2_widget.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class OtpInCreateAndLoginScreen extends StatefulWidget {
  // const OtpInCreateAndLoginScreen({super.key, required this.emailAddress, required this.screenName});
  const OtpInCreateAndLoginScreen({super.key, required this.data});
  // final String emailAddress, screenName;
  final Map data;

  @override
  State<OtpInCreateAndLoginScreen> createState() =>
      _OtpInCreateAndLoginScreenState();
}

class _OtpInCreateAndLoginScreenState extends State<OtpInCreateAndLoginScreen> {
  TextEditingController pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VColors.whiteColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              backgroundColor: VColors.whiteColor,
              title: Text(
                AppLocalizations.of(context)!.translate('forgotThePassword')!,
                style: VStyles.h4Bold(context).copyWith(fontSize: 21.sp),
              ),
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w)
                    .copyWith(top: 75.h, bottom: 48.h),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: Text(
                          '${AppLocalizations.of(context)!.translate('resendCodeIn')!} ',
                          style: VStyles.bodyXLargeRegular(context),
                          textAlign: TextAlign.center),
                    ),

                    /// Make Space
                    SizedBox(height: 80.h),

                    /// OTP
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: SizedBox(
                        width: double.infinity,
                        child: Pinput(
                          // androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                          controller: pinputController,
                          length: 4,
                          obscureText: true,
                          obscuringCharacter: '⚫',
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          focusedPinTheme: PinTheme(
                            height: 61.h,
                            width: 83.w,
                            textStyle: VStyles.h4Bold(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              border: Border.all(
                                  width: 1.w, color: VColors.primaryColor500),
                              color: VColors.purpleTransparent.withOpacity(.08),
                            ),
                          ),
                          defaultPinTheme: PinTheme(
                            height: 61.h,
                            width: 83.w,
                            textStyle: VStyles.h4Bold(context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.sp),
                              color: VColors.greyScale50,
                              border: Border.all(
                                  width: 1.w, color: VColors.greyScale200),
                            ),
                          ),
                          pinputAutovalidateMode:
                              PinputAutovalidateMode.onSubmit,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          // onCompleted: (value) async => verifyOTPCubit.verifyOTPFunction(otp: pinputController.text, phoneNumber: widget.phoneNumber),
                        ),
                      ),
                    ),

                    /// Make Space
                    SizedBox(height: 50.h),

                    /// Counter Text
                    TextRich2Widget(
                      text1:
                          '${AppLocalizations.of(context)!.translate('resendCodeIn')!} ',
                      style: VStyles.bodyXLargeMedium
                          (context).copyWith(color: VColors.primaryColor500),
                    ),

                    /// Make Space
                    SizedBox(height: 50.h),

                    /// Continue Button
                    MainButtonWidget(
                      centerWidgetInButton: Text(
                        AppLocalizations.of(context)!.translate('verify').toString(),
                        style: VStyles.bodyLargeBold
                            (context).copyWith(color: VColors.whiteColor),
                      ),
                      onTap: () {
                        if(widget.data['screenName'] == 'loginScreen') {
                          context.pushNamedAndRemoveUntil(VRoutesName.homeRoute, predicate: (route) => false);
                        } else {
                          context.pushNamedAndRemoveUntil(VRoutesName.enterNewPasswordRoute, predicate: (route) => false);
                        }
                      },
                      margin: EdgeInsets.zero,
                      buttonColor: VColors.primaryColor500,
                      boxShadow: [AppBoxShadows.buttonShadowOne],
                    ),

                    /// Make Space
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
