enum WaterType {
  Fresh,
  Brackish,
  Salt,
}

String waterTypeToString(WaterType waterType) {
  if (waterType == WaterType.Fresh) {
    return "Fresh Water";
  }
  if (waterType == WaterType.Brackish) {
    return "Brackish Water";
  }
  if (waterType == WaterType.Salt) {
    return "Salt Water";
  }
  return "";
}
