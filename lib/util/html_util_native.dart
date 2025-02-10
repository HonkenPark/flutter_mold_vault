import 'package:logger/logger.dart';

String getOriginLocation() {
  return '';
}

void setLocalStorage(String key, String value) {
}

void setSessionStorage(String key, String value) {
}

String? getLocalStorage(String key) {
  try {
    return null;
  } catch (e) {
    // Logger().e('[getLocalStorage:$key]${e.toString()}');
  }
  return null;
}

String? getSessionStorage(String key) {
  try {
    return null;
  } catch (e) {
    Logger().e('[getSessionStorage:$key]${e.toString()}');
  }
  return null;
}

void clearLocalStorage(String key) {
}

void clearSessionStorage(String key) {
}

void showAlertPopup(String message) {
}

bool showConfirmPopup(String message) {
  return false;
}
