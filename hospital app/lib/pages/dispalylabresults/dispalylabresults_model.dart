import '/hospital_app/hospital_app_util.dart';
import 'dispalylabresults_widget.dart' show DispalylabresultsWidget;
import 'package:flutter/material.dart';

class DispalylabresultsModel extends hospitalAppModel<DispalylabresultsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
