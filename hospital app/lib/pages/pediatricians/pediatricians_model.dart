import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'pediatricians_widget.dart' show PediatriciansWidget;
import 'package:flutter/material.dart';

class PediatriciansModel extends hospitalAppModel<PediatriciansWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // Model for BottomNavigationComponent component.
  late BottomNavigationComponentModel bottomNavigationComponentModel;

  @override
  void initState(BuildContext context) {
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    bottomNavigationComponentModel =
        createModel(context, () => BottomNavigationComponentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    bottomNavigationComponentModel.dispose();
  }
}
