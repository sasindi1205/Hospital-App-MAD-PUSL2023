import '/hospital_app/hospital_app_util.dart';
import 'onboarding1_widget.dart' show Onboarding1Widget;
import 'package:flutter/material.dart';

class Onboarding1Model extends hospitalAppModel<Onboarding1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
