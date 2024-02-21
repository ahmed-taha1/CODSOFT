bool validateDate(DateTime date) {
  if (date.isAfter(DateTime.now())) {
    return true;
  }
  return false;

}