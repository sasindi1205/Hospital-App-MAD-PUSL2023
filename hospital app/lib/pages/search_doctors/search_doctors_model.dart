import '/backend/backend.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'search_doctors_widget.dart' show SearchDoctorsWidget;
import 'package:flutter/material.dart';

class SearchDoctorsModel extends hospitalAppModel<SearchDoctorsWidget> {
  ///  Local state fields for this page.

  bool searchActive = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  List<DoctorsRecord> simpleSearchResults1 = [];
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  List<DocCategoriesRecord> simpleSearchResults2 = [];
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
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    bottomNavigationComponentModel.dispose();
  }
}
