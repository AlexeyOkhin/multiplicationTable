class DateMultipler {

List <String> getTable(int numDigital) {
     List <String> arrayInt = [];
  if (numDigital<11) {
    for (int i = 1; i < 11; i++) {
      int multip = (i * numDigital);
      String resultString = "$numDigital * $i = $multip";
      arrayInt.add(resultString);
    }
    return arrayInt;
  }


}
}