import 'dart:math';

/// Personal information (unique identification information, name, password, address, phone number, account number, credit card number, sensitive information, etc.)
/// that needs to be restricted from display must be designated and some of the designated personal information items must be masked.
/// If the name is at least the first letter of the first name, or if the last name is two characters,
/// the rest of the name except the first and last names are replaced with *, regardless of the last name.
/// Guide to the Application of Personal Information Protection Measures (개인정보 보호조치 적용 안내서 - 개인정보보호위원회, 한국인터넷진흥원)
String maskingName(String name) {
  if (name.length == 1) {
    return name;
  } else if (name.length == 2) {
    return '${name[0]}*';
  } else {
    return '${name[0]}${'*' * (name.length - 2)}${name[name.length - 1]}';
  }
}

/// Function of auto dash for phone number specialized in Korean system
String convertFormatPhoneNumber(String input) {
  // 82로 시작하고 핸드폰 번호(010) 또는 지역번호에서 0을 뺀 번호로만 허용
  final countryMobilePattern = RegExp(r'^82(10)(\d{3,4})(\d{4})$');
  final countryLandlinePattern = RegExp(r'^82(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])(\d{3,4})(\d{4})$');
  // 010으로 시작하는 핸드폰 번호
  final mobilePhonePattern = RegExp(r'^010(\d{3,4})(\d{4})$');
  // 한국 지역번호로 시작하는 일반 전화번호
  final landlinePhonePattern = RegExp(r'^0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4])(\d{3,4})(\d{4})$');
  // ARS 번호 (1588, 1577 등)
  final arsPhonePattern = RegExp(r'^1(5|6|8)(\d{2})(\d{4})$');
  // 070, 080 번호
  final internetPhonePattern = RegExp(r'^0(70|80)(\d{3,4})(\d{4})$');

  if (mobilePhonePattern.hasMatch(input)) {
    return input.replaceAllMapped(mobilePhonePattern, (match) {
      return '010-${match.group(1)}-${match.group(2)}';
    });
  } else if (countryMobilePattern.hasMatch(input)) {
    return input.replaceAllMapped(countryMobilePattern, (match) {
      return '+82-10-${match.group(2)}-${match.group(3)}';
    });
  } else if (countryLandlinePattern.hasMatch(input)) {
    return input.replaceAllMapped(countryLandlinePattern, (match) {
      return '+82-${match.group(1)}-${match.group(2)}-${match.group(3)}';
    });
  } else if (landlinePhonePattern.hasMatch(input)) {
    return input.replaceAllMapped(landlinePhonePattern, (match) {
      return '0${match.group(1)}-${match.group(2)}-${match.group(3)}';
    });
  } else if (arsPhonePattern.hasMatch(input)) {
    return input.replaceAllMapped(arsPhonePattern, (match) {
      return '1${match.group(1)}${match.group(2)}-${match.group(3)}';
    });
  } else if (internetPhonePattern.hasMatch(input)) {
    return input.replaceAllMapped(internetPhonePattern, (match) {
      return '0${match.group(1)}-${match.group(2)}-${match.group(3)}';
    });
  } else {
    // 형식에 맞지 않는 경우 그대로 반환
    return input;
  }
}

/// Filtered only number
String removeNonNumeric(String? input) {
  if (input == null) {
    return '';
  }
  String onlyNumbers = input.replaceAll(RegExp(r'[^0-9]'), '');
  if (onlyNumbers.isEmpty) {
    return '';
  }
  return onlyNumbers;
}

/// Key generate Algorithm
String generateCryptoKey(String input) {
  if (input.isNotEmpty) {
    try {
      Random randomXor = Random(DateTime.parse(input).millisecondsSinceEpoch ^ DateTime.parse(input).second.hashCode);
      Random randomAddXor = Random((DateTime.parse(input).second.hashCode + DateTime.parse(input).millisecondsSinceEpoch) ^ (DateTime.parse(input).millisecondsSinceEpoch << 3));
      return "${List.generate(8, (_) => randomXor.nextInt(256)).map((b) => b.toRadixString(16).padLeft(2, '0')).join()}${List.generate(8, (_) => randomAddXor.nextInt(256)).map((b) => b.toRadixString(16).padLeft(2, '0')).join()}";
    } catch (e) {
      return '';
    }
  }
  return '';
}
