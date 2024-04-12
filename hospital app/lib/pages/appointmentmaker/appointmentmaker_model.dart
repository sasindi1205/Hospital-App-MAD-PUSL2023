import '/hospital_app/hospital_app_util.dart';
import 'appointmentmaker_widget.dart' show AppointmentmakerWidget;
import 'package:flutter/material.dart';

class AppointmentmakerModel extends hospitalAppModel<AppointmentmakerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for docID widget.
  FocusNode? docIDFocusNode;
  TextEditingController? docIDController;
  String? Function(BuildContext, String?)? docIDControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    docIDFocusNode?.dispose();
    docIDController?.dispose();
  }
}
