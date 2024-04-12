import '/hospital_app/hospital_app_util.dart';
import 'cardiology_page_widget.dart' show CardiologyPageWidget;
import 'package:flutter/material.dart';

class CardiologyPageModel extends hospitalAppModel<CardiologyPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
