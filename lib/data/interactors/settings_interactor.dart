
import '../../data.dart';
import '../../domain.dart';

class SettingsInteractor implements SettingsUseCases {
  final SharedPrefsService sharedPrefsService;

  SettingsInteractor({required this.sharedPrefsService});

  @override
  void saveAppColor(AppColor appColor) =>
      sharedPrefsService.setAppColor(appColor);

  @override
  void saveAppThemeMode(AppThemeMode mode) =>
      sharedPrefsService.setAppThemeMode(mode);

  @override
  AppColor get currentAppColor => sharedPrefsService.getAppColor();

  @override
  AppThemeMode get currentAppThemeMode => sharedPrefsService.getAppThemeMode();
}
