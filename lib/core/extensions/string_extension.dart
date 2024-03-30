extension CutString on String {
  String cut(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) {
      return this;
    } else {
      return substring(0, maxLength) + (ellipsis);
    }
  }
}
