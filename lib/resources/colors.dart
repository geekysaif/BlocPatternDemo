class AppColors {

  get yellow => getColorHexFromStr('#F19700');
  get yellow_D07908 => getColorHexFromStr('#D07908');
  get black => getColorHexFromStr('#000000');
  get black_272727 => getColorHexFromStr('#272727');
  get black_333333 => getColorHexFromStr('##333333');
  get white => getColorHexFromStr('#FFFFFF');
  get inputborder => getColorHexFromStr('#DDDDDD');
  get walkthroughdot => getColorHexFromStr('#1A407D');
  get txtgray => getColorHexFromStr('#333333');
  get gray_7D7D7D => getColorHexFromStr('#7D7D7D');
  get gray_DDDDDD => getColorHexFromStr('#DDDDDD');
  get gray_F5F5F5 => getColorHexFromStr('#F5F5F5');
  get gray_F9F9F9=> getColorHexFromStr('#F9F9F9');
  get gray_999999=> getColorHexFromStr('#999999');
  get bg_F8F8F8 => getColorHexFromStr('#F8F8F8');
  get blue_1C4587 => getColorHexFromStr('#1C4587');
  get blue_1A407D=> getColorHexFromStr('#1A407D');
  get line_DDDDDD=> getColorHexFromStr('#DDDDDD');
  get eye_CCCCCC=> getColorHexFromStr('#CCCCCC');
  get red=> getColorHexFromStr('#FF0000');
  get skyblue_79A7F1=> getColorHexFromStr('#79A7F1');
  get pink_FF5CA8=> getColorHexFromStr('#FF5CA8');
  get blue_50ABF2=> getColorHexFromStr('#50ABF2');
  get blue_90BAFF=> getColorHexFromStr('#90BAFF');
  get blue_3B55B5=> getColorHexFromStr('#3B55B5');
  get blue_27CEEF=> getColorHexFromStr('#27CEEF');
  get blue_0F487F=> getColorHexFromStr('#0F487F');
  get yellow_F19100=> getColorHexFromStr('#F19100');
  get yellow_DF6D20=> getColorHexFromStr('#DF6D20');
  get brown_967641=> getColorHexFromStr('#967641');
  get brown_9B633D=> getColorHexFromStr('#9B633D');
  get brown_C66E29=> getColorHexFromStr('#C66E29');
  get brown_6C3D10=> getColorHexFromStr('#6C3D10');
  get grey_F6F8FA=> getColorHexFromStr('#F6F8FA');
  get white_FAFEFF=> getColorHexFromStr('#FAFEFF');
  get grey_0000000F=> getColorHexFromStr('#0000000F');
  get white_FFFDF5=> getColorHexFromStr('#FFFDF5');
  get grey_E5E5E5=> getColorHexFromStr('#E5E5E5');
  get black_181818=> getColorHexFromStr('#181818');
  get blue_A1A8FF=> getColorHexFromStr('#A1A8FF');
  get blue_003C50=> getColorHexFromStr('#003C50');
  get yellow_FFC241=> getColorHexFromStr('#FFC241');
  get blue_6378B0=> getColorHexFromStr('#6378B0');
  get pink_D757F6=> getColorHexFromStr('#D757F6');
  get blue_3D8AF7=> getColorHexFromStr('#3D8AF7');
  get grey_EBF3FE=> getColorHexFromStr('#EBF3FE');



  int getColorHexFromStr(String colorStr) {
    colorStr = "FF$colorStr";
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  static final AppColors _appColors = AppColors._internal();
  factory AppColors()  {
    return _appColors;
  }
  AppColors._internal();
}
AppColors appColors =  AppColors();

