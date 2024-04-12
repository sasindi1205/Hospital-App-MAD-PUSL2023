import '/hospital_app/hospital_app_util.dart';
import 'usersprofile_widget.dart' show UsersprofileWidget;
import 'package:flutter/material.dart';

class UsersprofileModel extends hospitalAppModel<UsersprofileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
