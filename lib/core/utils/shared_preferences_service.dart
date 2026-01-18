import 'package:plant_app/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _prefs;

  SharedPreferencesService(this._prefs);

  Future<bool> isOnboardingCompleted() async {
    return _prefs.getBool(AppConstants.onboardingCompletedKey) ?? false;
  }

  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool(AppConstants.onboardingCompletedKey, value);
  }
}
