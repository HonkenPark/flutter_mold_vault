/// To determine interval value when using pluto_grid chart
/// This function calculates the minimum value of multiples of 10 of  the digits of the maximum value.
/// argument: maxValue (int) - maximum value
/// return: double - interval value
/// example: calculateInterval(100) -> 10
double calculateInterval(int maxValue) {
  if (maxValue > 0) {
    int maxDigit = 1;
    int digitCount = maxValue.abs().toString().length;
    for (int i = 1; i < digitCount; i++) {
      maxDigit *= 10;
    }
    return maxDigit.toDouble();
  } else {
    return 0;
  }
}

/// Based on a given value, this function calculates a maximum value that matches 20% of the value.
/// argument: value (int) - input value
/// return: double - maximum value
/// example: calculateMaxY(100) -> 120
double calculateMaxY(int value) {
  if (value > 0) {
    int maxValue = (value * 1.2).floor();
    int digitCount = value.abs().toString().length;
    return (maxValue + calculateInterval(digitCount));
  } else {
    return 0;
  }
}
