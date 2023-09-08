import 'package:firebase_chat_app/common/store/storage.dart';
import 'package:get/get.dart';

const String STORAGE_DEVICE_FIRST_OPEN_KEY = 'device_first_open';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  // bool isFirstOpen = false;
  // PackageInfo? _platform;
  // String get verssion => _platform?.version ?? '-';
  // bool get isRelease => bool.fromEnvironment("dart.vm.product");
  // Locale locale = Locale('en', 'US');
  // List<locale> languages = [
  //   Locale('en', 'US'),
  //   Locale('zh', 'CN'),
  // ];

  // @override
  // void onInit() {
  //   super.onInit();
  //   isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
  // }

  // Future<void> GetPlatform() async {
  //   _platform = await PackageInfo.fromPlatform();
  // }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }
}
