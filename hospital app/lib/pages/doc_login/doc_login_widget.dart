import '/backend/backend.dart';
import '/hospital_app/hospital_app_animations.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'doc_login_model.dart';
export 'doc_login_model.dart';

class DocLoginWidget extends StatefulWidget {
  const DocLoginWidget({super.key});

  @override
  State<DocLoginWidget> createState() => _DocLoginWidgetState();
}

class _DocLoginWidgetState extends State<DocLoginWidget>
    with TickerProviderStateMixin {
  late DocLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 80.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 400.ms,
          begin: const Offset(0.8, 0.8),
          end: const Offset(1.0, 1.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 20.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DocLoginModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 1,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.docnameController ??= TextEditingController();
    _model.docnameFocusNode ??= FocusNode();

    _model.emailController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.idController ??= TextEditingController();
    _model.idFocusNode ??= FocusNode();

    _model.titleController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.categoryController ??= TextEditingController();
    _model.categoryFocusNode ??= FocusNode();

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
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 170.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width >= 768.0
                                ? 530.0
                                : 630.0,
                            constraints: const BoxConstraints(
                              maxWidth: 570.0,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9F0),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    2.0,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: const Color(0xFFEDF1F6),
                                width: 2.0,
                              ),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      0.0, 200.0, 0.0, 0.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: const Alignment(0.0, 0),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: const Color(0xFF12151C),
                          unselectedLabelColor: const Color(0xFF5A5C60),
                          labelPadding: const EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          labelStyle: GoogleFonts.getFont(
                            'Roboto',
                          ),
                          unselectedLabelStyle: GoogleFonts.getFont(
                            'Roboto',
                          ),
                          indicatorColor: const Color(0xFF334EAC),
                          indicatorWeight: 3.0,
                          tabs: const [
                            Tab(
                              text: 'Add doctor',
                            ),
                          ],
                          controller: _model.tabBarController,
                          onTap: (i) async {
                            [() async {}][i]();
                          },
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _model.tabBarController,
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 16.0, 24.0, 0.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                            Container(
                                              width: 230.0,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: hospitalAppTheme
                                                    .of(context)
                                                    .secondaryBackground,
                                              ),
                                            ),
                                          Text(
                                            'Enter details of doctor',
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.getFont(
                                              'Noto Sans JP',
                                              color: const Color(0xFF12151C),
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 10.0, 0.0, 0.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.docnameController,
                                                focusNode:
                                                    _model.docnameFocusNode,
                                                autofocus: true,
                                                autofillHints: const [
                                                  AutofillHints.email
                                                ],
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Name',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color:
                                                        const Color(0xFF090909),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFBAD6EB),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x4C8AC7FF),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0xB3FFFFFF),
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Colors.black,
                                                ),
                                                minLines: null,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                validator: _model
                                                    .docnameControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 10.0, 0.0, 10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.emailController,
                                                focusNode:
                                                    _model.emailFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Email',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFBAD6EB),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x4C8AC7FF),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0xB3FFFFFF),
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Colors.black,
                                                ),
                                                minLines: null,
                                                validator: _model
                                                    .emailControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller: _model.idController,
                                                focusNode: _model.idFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Doctors ID',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFBAD6EB),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x4C8AC7FF),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFE65454),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      const Color(0xB3FFFFFF),
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Colors.black,
                                                ),
                                                minLines: null,
                                                validator: _model
                                                    .idControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.titleController,
                                                focusNode:
                                                    _model.titleFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Title',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color:
                                                        const Color(0xFF090909),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFB8D1CC),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFDF6767),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFDF6767),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF090909),
                                                ),
                                                minLines: null,
                                                validator: _model
                                                    .titleControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 10.0),
                                            child: SizedBox(
                                              width: double.infinity,
                                              child: TextFormField(
                                                controller:
                                                    _model.categoryController,
                                                focusNode:
                                                    _model.categoryFocusNode,
                                                autofocus: false,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Category',
                                                  labelStyle:
                                                      GoogleFonts.getFont(
                                                    'Open Sans',
                                                    color: Colors.black,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFC5D3E7),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFF2C6589),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFF19C77),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Color(0xFFF19C77),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      const EdgeInsets.all(
                                                          24.0),
                                                ),
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Colors.black,
                                                ),
                                                minLines: null,
                                                validator: _model
                                                    .categoryControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 6.0)),
                                      ),
                                    ).animateOnPageLoad(animationsMap[
                                        'columnOnPageLoadAnimation']!),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.06, 0.95),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await DoctorsRecord.collection
                                          .doc()
                                          .set(createDoctorsRecordData(
                                            docName:
                                                _model.docnameController.text,
                                            docCategory:
                                                _model.categoryController.text,
                                            docEmail:
                                                _model.emailController.text,
                                            docTitle:
                                                _model.emailController.text,
                                            docId: int.tryParse(
                                                _model.idController.text),
                                          ));

                                      context.pushNamed('StaffHomePage');
                                    },
                                    child: Container(
                                      width: 184.0,
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
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      child: const Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.01, -0.9),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://picsum.photos/seed/555/600',
                    width: 172.0,
                    height: 140.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-0.93, -0.98),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: const Icon(
                    Icons.chevron_left_outlined,
                    color: Color(0xFF182F69),
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
