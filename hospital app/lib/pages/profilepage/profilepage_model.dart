import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'profilepage_widget.dart' show ProfilepageWidget;
import 'package:flutter/material.dart';

class ProfilepageModel extends hospitalAppModel<ProfilepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    bottomNavigationComponentModel.dispose();
  }
}
