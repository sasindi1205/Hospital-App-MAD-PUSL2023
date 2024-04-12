import '/hospital_app/hospital_app_util.dart';
import 'onboarding3_widget.dart' show Onboarding3Widget;
import 'package:flutter/material.dart';

class Onboarding3Model extends hospitalAppModel<Onboarding3Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
