import '/hospital_app/hospital_app_util.dart';
import 'enterlaborotarydetails_widget.dart' show EnterlaborotarydetailsWidget;
import 'package:flutter/material.dart';

class EnterlaborotarydetailsModel
    extends hospitalAppModel<EnterlaborotarydetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for test widget.
  FocusNode? testFocusNode;
  TextEditingController? testController;
  String? Function(BuildContext, String?)? testControllerValidator;
  // State field(s) for result widget.
  FocusNode? resultFocusNode;
  TextEditingController? resultController;
  String? Function(BuildContext, String?)? resultControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailFocusNode?.dispose();
    emailController?.dispose();

    testFocusNode?.dispose();
    testController?.dispose();

    resultFocusNode?.dispose();
    resultController?.dispose();
  }
}
