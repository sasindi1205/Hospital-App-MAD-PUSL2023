import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import '/hospital_app/upload_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nameimage_model.dart';
export 'nameimage_model.dart';

class NameimageWidget extends StatefulWidget {
  const NameimageWidget({super.key});

  @override
  State<NameimageWidget> createState() => _NameimageWidgetState();
}

class _NameimageWidgetState extends State<NameimageWidget> {
  late NameimageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NameimageModel());

    _model.yourNameController1 ??= TextEditingController();
    _model.yourNameFocusNode1 ??= FocusNode();

    _model.yourNameController2 ??= TextEditingController();
    _model.yourNameFocusNode2 ??= FocusNode();

    _model.yourNameController3 ??= TextEditingController();
    _model.yourNameFocusNode3 ??= FocusNode();

    _model.yourNameController4 ??= TextEditingController();
    _model.yourNameFocusNode4 ??= FocusNode();

    _model.yourNameController5 ??= TextEditingController();
    _model.yourNameFocusNode5 ??= FocusNode();

    _model.yourNameController6 ??= TextEditingController();
    _model.yourNameFocusNode6 ??= FocusNode();

    _model.yourNameController7 ??= TextEditingController();
    _model.yourNameFocusNode7 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFF7096DF),
          automaticallyImplyLeading: false,
          actions: const [],
          flexibleSpace: FlexibleSpaceBar(
            title: SingleChildScrollView(
              controller: _model.columnController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 30.0),
                      child: Text(
                        'Complete Your Profile',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await _model.listViewController?.animateTo(
                    _model.listViewController!.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.ease,
                  );
                },
                child: ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  controller: _model.listViewController,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 19.0, 0.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                imageQuality: 80,
                                allowPhoto: true,
                                backgroundColor: hospitalAppTheme
                                    .of(context)
                                    .primaryBackground,
                                textColor:
                                    hospitalAppTheme.of(context).primaryText,
                                pickerFontFamily: 'Outfit',
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading1 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl1 =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 90.0,
                                  height: 90.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CachedNetworkImage(
                                    fadeInDuration:
                                        const Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        const Duration(milliseconds: 500),
                                    imageUrl: _model.uploadedFileUrl1,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final selectedMedia = await selectMedia(
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isDataUploading2 = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];

                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                            blurHash: m.blurHash,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading2 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile2 =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl2 =
                                        downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload data');
                                  return;
                                }
                              }
                            },
                            child: const Icon(
                              Icons.add_circle,
                              color: Color(0xFF081F5C),
                              size: 45.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController1,
                        focusNode: _model.yourNameFocusNode1,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Your Name',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Roboto',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF425CB4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        minLines: null,
                        validator: _model.yourNameController1Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController2,
                        focusNode: _model.yourNameFocusNode2,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'User Address',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF334EAC),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: hospitalAppTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: Colors.black,
                              letterSpacing: 0.0,
                            ),
                        minLines: null,
                        validator: _model.yourNameController2Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        child: TextFormField(
                          controller: _model.yourNameController3,
                          focusNode: _model.yourNameFocusNode3,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Users BloodType',
                            labelStyle: GoogleFonts.getFont(
                              'Open Sans',
                              color: Colors.black,
                            ),
                            hintStyle: GoogleFonts.getFont(
                              'Open Sans',
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFBAD6EB),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFF425CB4),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFB86767),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFB86767),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 24.0, 0.0, 24.0),
                          ),
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          minLines: null,
                          validator: _model.yourNameController3Validator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController4,
                        focusNode: _model.yourNameFocusNode4,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'User Allergies',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF425CB4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        minLines: null,
                        validator: _model.yourNameController4Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController5,
                        focusNode: _model.yourNameFocusNode5,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Users Life Long Conditions',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF425CB4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        minLines: null,
                        validator: _model.yourNameController5Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController6,
                        focusNode: _model.yourNameFocusNode6,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Users contact Number',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF425CB4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        minLines: null,
                        validator: _model.yourNameController6Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 16.0),
                      child: TextFormField(
                        controller: _model.yourNameController7,
                        focusNode: _model.yourNameFocusNode7,
                        textCapitalization: TextCapitalization.words,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Guardian/Emergency Number',
                          labelStyle: GoogleFonts.getFont(
                            'Open Sans',
                            color: Colors.black,
                          ),
                          hintStyle: GoogleFonts.getFont(
                            'Open Sans',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFBAD6EB),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFF425CB4),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFB86767),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 0.0, 24.0),
                        ),
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        minLines: null,
                        validator: _model.yourNameController7Validator
                            .asValidator(context),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.07, 1.05),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 15.0, 0.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await currentUserReference!
                                .update(createUsersRecordData(
                              displayName: _model.yourNameController1.text,
                              photoUrl: _model.uploadedFileUrl1,
                              address: _model.yourNameController2.text,
                              bloodtype: _model.yourNameController3.text,
                              allergies: _model.yourNameController4.text,
                              lifelongConditions:
                                  _model.yourNameController5.text,
                              contactNumber: _model.yourNameController6.text,
                              guardianNumber: _model.yourNameController7.text,
                            ));
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'profile updated',
                                  style: TextStyle(
                                    color: hospitalAppTheme
                                        .of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor:
                                    hospitalAppTheme.of(context).secondary,
                              ),
                            );

                            context.pushNamed('HomePage');
                          },
                          child: Container(
                            width: 164.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFF081F5C),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Submit',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
