import '/hospital_app/hospital_app_util.dart';
import 'onboarding2_widget.dart' show Onboarding2Widget;
import 'package:flutter/material.dart';

class Onboarding2Model extends hospitalAppModel<Onboarding2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
