
import '../../../domain.dart';
import '../screens.dart';

class UserSettingsVMState extends BaseViewModelState {
  late final AppSettingsProvider appSettings;
}

abstract class UserSettingsViewContract extends BaseViewContract {}

abstract class UserSettingsVMContract extends BaseViewModelContract<
    UserSettingsVMState, UserSettingsViewContract> {
  void onAppColorChanged(AppColor color);
  void onThemeModeChanged(AppThemeMode themeMode);
}
