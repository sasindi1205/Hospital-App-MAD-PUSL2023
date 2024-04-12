import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'doctorprofile1_copy_copy2_widget.dart'
    show Doctorprofile1CopyCopy2Widget;
import 'package:flutter/material.dart';

class Doctorprofile1CopyCopy2Model
    extends hospitalAppModel<Doctorprofile1CopyCopy2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
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
