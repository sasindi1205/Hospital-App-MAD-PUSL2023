import '/backend/backend.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'enterlaborotarydetails_model.dart';
export 'enterlaborotarydetails_model.dart';

class EnterlaborotarydetailsWidget extends StatefulWidget {
  const EnterlaborotarydetailsWidget({super.key});

  @override
  State<EnterlaborotarydetailsWidget> createState() =>
      _EnterlaborotarydetailsWidgetState();
}

class _EnterlaborotarydetailsWidgetState
    extends State<EnterlaborotarydetailsWidget> {
  late EnterlaborotarydetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnterlaborotarydetailsModel());

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.testController ??= TextEditingController();
    _model.testFocusNode ??= FocusNode();

    _model.resultController ??= TextEditingController();
    _model.resultFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFEDF1F6),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 30.0, 0.0, 0.0),
                      child: Text(
                        'Enter Laboratory Details',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: const Color(0xFF081F5C),
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 30.0, 8.0, 10.0),
                    child: TextFormField(
                      controller: _model.emailController,
                      focusNode: _model.emailFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'enter users email',
                        labelStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        hintStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
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
                      ),
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        color: Colors.black,
                      ),
                      minLines: null,
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 0.0, 8.0, 10.0),
                    child: TextFormField(
                      controller: _model.testController,
                      focusNode: _model.testFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'enter the test',
                        labelStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        hintStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
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
                      ),
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        color: Colors.black,
                      ),
                      minLines: null,
                      validator:
                          _model.testControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 0.0, 8.0, 10.0),
                    child: TextFormField(
                      controller: _model.resultController,
                      focusNode: _model.resultFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'enter the results',
                        labelStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
                        ),
                        hintStyle: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.black,
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
                      ),
                      style: GoogleFonts.getFont(
                        'Open Sans',
                        color: Colors.black,
                      ),
                      minLines: null,
                      validator:
                          _model.resultControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 30.0, 0.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await LabresultRecord.collection
                            .doc()
                            .set(createLabresultRecordData(
                              test: _model.testController.text,
                              email: _model.emailController.text,
                              result: _model.resultController.text,
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'upload successful',
                              style: TextStyle(
                                color: Color(0xFF0B0D12),
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0xFF425CB4),
                          ),
                        );
                      },
                      child: Container(
                        width: 231.0,
                        height: 54.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFF334EAC),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'submit details',
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
                ],
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.safePop();
                },
                child: const Icon(
                  Icons.chevron_left_sharp,
                  color: Color(0xFF182F69),
                  size: 24.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
