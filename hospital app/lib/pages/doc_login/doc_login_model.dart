import '/hospital_app/hospital_app_util.dart';
import 'doc_login_widget.dart' show DocLoginWidget;
import 'package:flutter/material.dart';

class DocLoginModel extends hospitalAppModel<DocLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for docname widget.
  FocusNode? docnameFocusNode;
  TextEditingController? docnameController;
  String? Function(BuildContext, String?)? docnameControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for ID widget.
  FocusNode? idFocusNode;
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  // State field(s) for TITLE widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for CATEGORY widget.
  FocusNode? categoryFocusNode;
  TextEditingController? categoryController;
  String? Function(BuildContext, String?)? categoryControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    docnameFocusNode?.dispose();
    docnameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    idFocusNode?.dispose();
    idController?.dispose();

    titleFocusNode?.dispose();
    titleController?.dispose();

    categoryFocusNode?.dispose();
    categoryController?.dispose();
  }
}
