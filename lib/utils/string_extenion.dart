import 'package:nepali_utils/nepali_utils.dart';

extension StringX on String {
  String? get parseToNepaliDateTime {
    try {
      return NepaliDateFormat("d MMMM y, EEE")
          .format(NepaliDateTime.parse(this));
    } catch (e) {
      return null;
    }
  }
}
