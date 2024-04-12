import '/hospital_app/hospital_app_util.dart';
import 'nameimage_widget.dart' show NameimageWidget;
import 'package:flutter/material.dart';

class NameimageModel extends hospitalAppModel<NameimageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameController1;
  String? Function(BuildContext, String?)? yourNameController1Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameController2;
  String? Function(BuildContext, String?)? yourNameController2Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameController3;
  String? Function(BuildContext, String?)? yourNameController3Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode4;
  TextEditingController? yourNameController4;
  String? Function(BuildContext, String?)? yourNameController4Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode5;
  TextEditingController? yourNameController5;
  String? Function(BuildContext, String?)? yourNameController5Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode6;
  TextEditingController? yourNameController6;
  String? Function(BuildContext, String?)? yourNameController6Validator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode7;
  TextEditingController? yourNameController7;
  String? Function(BuildContext, String?)? yourNameController7Validator;

  @override
  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    columnController?.dispose();
    listViewController?.dispose();
    yourNameFocusNode1?.dispose();
    yourNameController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameController3?.dispose();

    yourNameFocusNode4?.dispose();
    yourNameController4?.dispose();

    yourNameFocusNode5?.dispose();
    yourNameController5?.dispose();

    yourNameFocusNode6?.dispose();
    yourNameController6?.dispose();

    yourNameFocusNode7?.dispose();
    yourNameController7?.dispose();
  }
}
