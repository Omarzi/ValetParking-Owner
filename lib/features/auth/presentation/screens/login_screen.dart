import 'package:valetparking_owner/features/auth/presentation/widgets/login/login_account_form_widget.dart';
import 'package:valetparking_owner/utils/constants/exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              leading: null,
              floating: true,
              pinned: true,
              // snap: false,
              flexibleSpace: Container(
                color: VColors.whiteColor,
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(height: 48.h),
                Text(
                  AppLocalizations.of(context)!.translate('loginToYourAccount')!,
                  style: VStyles.h1Bold(context),
                ),
                SizedBox(height: 48.h),

                const LoginAccountFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
