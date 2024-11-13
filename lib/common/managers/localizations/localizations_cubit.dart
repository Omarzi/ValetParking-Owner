import '../../../../utils/constants/exports.dart';
part 'localizations_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(SelectedLocale(Locale(VCacheHelper.getString(key: CacheKeys.lang) == '' ? 'en' : VCacheHelper.getString(key: CacheKeys.lang)!)));

  void toArabic() => emit(SelectedLocale(const Locale('ar')));

  void toEnglish() => emit(SelectedLocale(const Locale('en')));
}
