import 'package:valetparking_owner/utils/constants/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  VDeviceUtils.initCacheHelper();
  VDeviceUtils.setStatusBarColor(Colors.white);
  VDeviceUtils.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await LocationHelper.getMyCurrentLocation();
  runApp(const ValetParkingApp());
}