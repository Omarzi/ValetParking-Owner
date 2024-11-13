import 'package:valetparking_owner/features/auth/managers/auth_cubit.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class LoginAccountFormWidget extends StatefulWidget {
  const LoginAccountFormWidget({super.key});

  @override
  State<LoginAccountFormWidget> createState() => _LoginAccountFormWidgetState();
}

class _LoginAccountFormWidgetState extends State<LoginAccountFormWidget> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  bool isEmailFieldFocused = false;
  bool isPasswordFieldFocused = false;
  bool isChecked = false;
  bool isShown = false;
  bool isPass = true;

  @override
  void initState() {
    super.initState();
    /// Add listener to focus node
    emailFocusNode.addListener(
            () => setState(() => isEmailFieldFocused = emailFocusNode.hasFocus));
    passwordFocusNode.addListener(
            () => setState(() => isPasswordFieldFocused = passwordFocusNode.hasFocus));
  }

  @override
  void dispose() {
    /// Clean up the focus node and controller when the widget is disposed.
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // void validateAndNavigate(BuildContext context) {
  //   String email = emailController.text;
  //   String password = passwordController.text;
  //
  //   if (email.isEmpty) {
  //     FloatingSnackBar.show(
  //       context: context,
  //       message: 'You must fill out this field',
  //       textColor: Colors.white,
  //       duration: const Duration(milliseconds: 4000),
  //       backgroundColor: VColors.error,
  //     );
  //   }
  //   else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$").hasMatch(email)) {
  //     FloatingSnackBar.show(
  //       context: context,
  //       message: 'You must fill this field in valid ex: example@gmail.com',
  //       textColor: Colors.white,
  //       duration: const Duration(milliseconds: 4000),
  //       backgroundColor: VColors.error,
  //     );
  //   }
  //   else if (password.isEmpty) {
  //     FloatingSnackBar.show(
  //       context: context,
  //       message: 'Password cannot be empty',
  //       textColor: Colors.white,
  //       duration: const Duration(milliseconds: 4000),
  //       backgroundColor: VColors.error,
  //     );
  //   }
  //   else {
  //     context.pushNamed(VRoutesName.otpRoute, arguments: {
  //       'emailAddress': emailController.text,
  //       'screenName': 'loginScreen',
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.pushNamed(VRoutesName.homeRoute);
              // \arguments: {
            // 'currentIndex': 0,
          // });

          FloatingSnackBar.show(
            context: context,
            message: AppLocalizations.of(context)!.translate('loginSuccessfully')!,
            textColor: Colors.white,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: VColors.success,
          );
        } else if (state is LoginErrorState) {
          FloatingSnackBar.show(
            context: context,
            message: state.message!,
            textColor: Colors.white,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: VColors.error,
          );
        }
      },
      builder: (context, state) {
      var loginCubit = AuthCubit.get(context);

        return Form(
          key: formKey,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                /// Email
                TextFormFieldWidget(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  focusNode: emailFocusNode,
                  hintText: AppLocalizations.of(context)!.translate('email')!,
                  hintColor: isEmailFieldFocused
                      ? VColors.primaryColor500
                      : VColors.greyScale500,
                  prefixIcon: SvgPicture.asset(VImages.email2Icon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          isEmailFieldFocused
                              ? VColors.primaryColor500
                              : emailController.text.isNotEmpty
                              ? VColors.greyScale900
                              : VColors.greyScale500,
                          BlendMode.srcIn)),
                  fillColor: isEmailFieldFocused
                      ? VColors.purpleTransparent.withOpacity(.08)
                      : VColors.greyScale50,
                  borderSide: isEmailFieldFocused
                      ? BorderSide(color: VColors.primaryColor500)
                      : BorderSide.none,
                  obscureText: false,
                ),

                /// Make Space
                SizedBox(height: 24.h),

                /// Password
                TextFormFieldWidget(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  focusNode: passwordFocusNode,
                  hintText: AppLocalizations.of(context)!.translate('password')!,
                  hintColor: isPasswordFieldFocused
                      ? VColors.primaryColor500
                      : VColors.greyScale500,
                  prefixIcon: SvgPicture.asset(VImages.passwordIcon,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                          isPasswordFieldFocused
                              ? VColors.primaryColor500
                              : passwordController.text.isNotEmpty
                              ? VColors.greyScale900
                              : VColors.greyScale500,
                          BlendMode.srcIn)),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => isPass = !isPass);
                    },
                    child: SvgPicture.asset(
                        isPass ? VImages.eyeHideIcon : VImages.eyeShowIcon,
                        fit: BoxFit.scaleDown,
                        colorFilter: ColorFilter.mode(
                            isPasswordFieldFocused
                                ? VColors.primaryColor500
                                : passwordController.text.isNotEmpty
                                ? VColors.greyScale900
                                : VColors.greyScale500,
                            BlendMode.srcIn)),
                  ),
                  fillColor: isPasswordFieldFocused
                      ? VColors.purpleTransparent.withOpacity(.08)
                      : VColors.greyScale50,
                  borderSide: isPasswordFieldFocused
                      ? BorderSide(color: VColors.primaryColor500)
                      : BorderSide.none,
                  obscureText: isPass,
                  obscureCharacter: '●',
                  maxLines: 1,
                ),

                /// Make Space
                SizedBox(height: 48.h),

                /// Sign in Button
                MainButtonWidget(
                  centerWidgetInButton: state is LoginLoadingState
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(AppLocalizations.of(context)!.translate('continue')!,
                      style: VStyles.bodyLargeBold(context)
                          .copyWith(color: VColors.whiteColor)),
                  onTap: () {
                    // if (formKey.currentState!.validate() && passwordController.text.isNotEmpty && passwordController.text.length == 8) {
                    //   logSuccess('Success');
                    //   context.pushNamedAndRemoveUntil(VRoutesName.navigationMenuRoute, predicate: (route) => false, arguments: 0);
                    // }
                    String email = emailController.text;
                    String password = passwordController.text;

                    if (email.isEmpty) {
                      FloatingSnackBar.show(
                        context: context,
                        message: AppLocalizations.of(context)!.translate('youMustFillOutThisField')!,
                        textColor: Colors.white,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: VColors.error,
                      );
                    }
                    else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$").hasMatch(email)) {
                      FloatingSnackBar.show(
                        context: context,
                        message: AppLocalizations.of(context)!.translate('youMustFillThisFieldInValid')!,
                        textColor: Colors.white,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: VColors.error,
                      );
                    }
                    else if (password.isEmpty) {
                      FloatingSnackBar.show(
                        context: context,
                        message: AppLocalizations.of(context)!.translate('passwordCannotBeEmpty')!,
                        textColor: Colors.white,
                        duration: const Duration(milliseconds: 4000),
                        backgroundColor: VColors.error,
                      );
                    }
                    else {
                      // context.pushNamed(VRoutesName.otpRoute, arguments: {
                      //   'emailAddress': emailController.text,
                      //   'screenName': 'loginScreen',
                      // });
                      logSuccess(email);
                      logSuccess(password);
                      loginCubit.loginFunction(
                          email: email, password: password);
                    }
                    // validateAndNavigate(context);
                  },
                  margin: EdgeInsets.zero,
                  buttonColor: emailController.text.isEmpty || passwordController.text.isEmpty
                      ? VColors.disabledButton
                      : VColors.primaryColor500,
                  boxShadow: emailController.text.isEmpty || passwordController.text.isEmpty
                      ? []
                      : [AppBoxShadows.buttonShadowOne],
                ),

                /// Make Space
                SizedBox(height: 24.h),
              ],
            ),
          ),
        );
    }
    );
  }
}