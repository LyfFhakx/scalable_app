import '../models/models.dart';

abstract class SettingsUseCases {
  void saveAppThemeMode(AppThemeMode mode);
  void saveAppColor(AppColor appColor);
  AppThemeMode get currentAppThemeMode;
  AppColor get currentAppColor;
}
