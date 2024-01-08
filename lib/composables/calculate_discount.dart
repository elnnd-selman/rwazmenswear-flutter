double calculateDiscount(double originalPrice, double discountPercentage) {
  if (originalPrice < 0 || discountPercentage < 0 || discountPercentage > 100) {
    throw ArgumentError("Invalid price or discount percentage");
  }
  double discountAmount = originalPrice * (discountPercentage / 100);
  double discountedPrice = originalPrice - discountAmount;
  return discountedPrice;
}
