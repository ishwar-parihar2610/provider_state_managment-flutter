import 'package:flutter/cupertino.dart';

class EligibilityScreenProvider extends ChangeNotifier {
  String _eligibiltitymessage = "";
  late bool _isEligible=true;

  void checkEligibilty(int age) {
    if (age > 18) {
      eligibileForLicense();
    } else {
      notEligibleForLicense();
    }
  }

  void eligibileForLicense() {
    _eligibiltitymessage = "You are  able to apply for Driving Lincense";
    _isEligible = true;
    notifyListeners();
  }

  void notEligibleForLicense() {
    _eligibiltitymessage = "You are not  able to apply for Driving Lincense";
    _isEligible = false;
    notifyListeners();
  }

  String get eligibilityMessage => _eligibiltitymessage;
  bool get isEligible => _isEligible;
}
