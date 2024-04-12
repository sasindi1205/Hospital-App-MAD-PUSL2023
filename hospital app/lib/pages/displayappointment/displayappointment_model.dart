import '/hospital_app/hospital_app_util.dart';
import 'displayappointment_widget.dart' show DisplayappointmentWidget;
import 'package:flutter/material.dart';

class DisplayappointmentModel
    extends hospitalAppModel<DisplayappointmentWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
