bool nullValidation(String? value) {
  if (value == null || value.trim().isEmpty) {
    return true;
  }
  return false;
}
