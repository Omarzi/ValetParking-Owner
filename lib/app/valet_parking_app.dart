import 'package:valetparking_owner/features/auth/managers/auth_cubit.dart';
import 'package:valetparking_owner/features/home/managers/home_cubit.dart';

import '../utils/constants/exports.dart';

class ValetParkingApp extends StatelessWidget {
  const ValetParkingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LocaleCubit()),
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: BlocBuilder<LocaleCubit, LocaleState>(
          builder: (context, localeState) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              supportedLocales: AppLocalizationsSetup.supportedLocale,
              localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
              localeListResolutionCallback:
              AppLocalizationsSetup.localeResolutionCallback,
              locale: localeState.locale,
              theme: ThemeData(
                fontFamily: localeState.locale.languageCode == 'en' ? 'Urbanist' : 'Cairo',
              ),
              onGenerateRoute: RouteGenerator.getRoute,
              // initialRoute: VRoutesName.loginAccountRoute,
              initialRoute: VRoutesName.splashRoute,
            );
          },
        ),
      ),
    );
  }
}
