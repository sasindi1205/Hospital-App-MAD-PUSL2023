import '/hospital_app/hospital_app_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends hospitalAppModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode1;
  TextEditingController? passwordCreateController1;
  late bool passwordCreateVisibility1;
  String? Function(BuildContext, String?)? passwordCreateController1Validator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode2;
  TextEditingController? passwordCreateController2;
  late bool passwordCreateVisibility2;
  String? Function(BuildContext, String?)? passwordCreateController2Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility1 = false;
    passwordCreateVisibility2 = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();

    passwordCreateFocusNode1?.dispose();
    passwordCreateController1?.dispose();

    passwordCreateFocusNode2?.dispose();
    passwordCreateController2?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }
}
