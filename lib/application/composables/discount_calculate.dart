

String discountCalculate(
    {required double originalPrice, required double discountPercentage}) {
  var discountAmount = (originalPrice * discountPercentage) / 100;
  double discountedPrice = originalPrice - discountAmount;
  return discountedPrice.toStringAsFixed(1);
}
