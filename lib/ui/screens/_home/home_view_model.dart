import '../screens.dart';

class HomeViewModel extends BaseViewModel<HomeVMState, HomeViewContract>
    implements HomeVMContract {
  @override
  void onSelectedIndexChange(int index) {
    if (vmState.selectedTab == index) return;
    vmState.selectedTab = index;
    notifyListeners();
    viewContract.goToTab(index);
  }
}