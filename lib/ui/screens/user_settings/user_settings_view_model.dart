
import '../../../domain.dart';
import '../screens.dart';

class UserSettingsViewModel
    extends BaseViewModel<UserSettingsVMState, UserSettingsViewContract>
    implements UserSettingsVMContract {
  final SettingsUseCases settingsInteractor;

  UserSettingsViewModel({required this.settingsInteractor});

  @override
  void onAppColorChanged(AppColor color) {
    settingsInteractor.saveAppColor(color);
    vmState.appSettings.switchColor(color);
    notifyListeners();
  }

  @override
  void onThemeModeChanged(AppThemeMode themeMode) {
    settingsInteractor.saveAppThemeMode(themeMode);
    vmState.appSettings.switchMode(themeMode);
    notifyListeners();
  }
}
