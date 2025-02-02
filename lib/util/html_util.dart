import 'dart:html' as html;
import 'package:logger/logger.dart';

String getOriginLocation() {
  return html.window.location.origin;
}

void setLocalStorage(String key, String value) {
  html.window.localStorage[key] = value;
}

void setSessionStorage(String key, String value) {
  html.window.sessionStorage[key] = value;
}

String? getLocalStorage(String key) {
  try {
    return html.window.localStorage[key]!;
  } catch (e) {
    // Logger().e('[getLocalStorage:$key]${e.toString()}');
  }
  return null;
}

String? getSessionStorage(String key) {
  try {
    return html.window.sessionStorage[key]!;
  } catch (e) {
    Logger().e('[getSessionStorage:$key]${e.toString()}');
  }
  return null;
}

void clearLocalStorage(String key) {
  html.window.localStorage.remove(key);
}

void clearSessionStorage(String key) {
  html.window.sessionStorage.remove(key);
}

void showAlertPopup(String message) {
  html.window.alert(message);
}

bool showConfirmPopup(String message) {
  return html.window.confirm(message);
}
