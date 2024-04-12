import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'doctorprofile1_copy_copy2_model.dart';
export 'doctorprofile1_copy_copy2_model.dart';

class Doctorprofile1CopyCopy2Widget extends StatefulWidget {
  const Doctorprofile1CopyCopy2Widget({super.key});

  @override
  State<Doctorprofile1CopyCopy2Widget> createState() =>
      _Doctorprofile1CopyCopy2WidgetState();
}

class _Doctorprofile1CopyCopy2WidgetState
    extends State<Doctorprofile1CopyCopy2Widget> {
  late Doctorprofile1CopyCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Doctorprofile1CopyCopy2Model());

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
        backgroundColor: const Color(0xFFF6F6F6),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: const Color(0xFF7096DF),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.safePop();
              },
              child: const Icon(
                Icons.chevron_left,
                color: Color(0xFFF7F4F0),
                size: 24.0,
              ),
            ),
            title: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: Text(
                'Details',
                style: GoogleFonts.getFont(
                  'Open Sans',
                  color: Colors.white,
                ),
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                        child: Text(
                          'ID : 2     Dr. Hannibal Lecter',
                          style: TextStyle(
                            color: Color(0xFF12151C),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                15.0, 8.0, 8.0, 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.asset(
                                'assets/images/IMG_5212-1712246624851.webp',
                                width: MediaQuery.sizeOf(context).width * 0.5,
                                height: MediaQuery.sizeOf(context).height * 0.2,
                                fit: BoxFit.cover,
                                alignment: const Alignment(-1.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Text(
                          'Cardiologist',
                          style: TextStyle(
                            color: Color(0xFF090909),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Primary Care, Intentional Medicine',
                          style: TextStyle(
                            color: Color(0xFF12151C),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: RatingBar.builder(
                            onRatingUpdate: (newValue) => setState(
                                () => _model.ratingBarValue = newValue),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star_rounded,
                              color: Color(0xFF334EAC),
                            ),
                            direction: Axis.horizontal,
                            initialRating: _model.ratingBarValue ??= 0.5,
                            unratedColor: const Color(0x4C8AC7FF),
                            itemCount: 5,
                            itemSize: 24.0,
                            glowColor: const Color(0xFF334EAC),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            8.0, 0.0, 8.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          height: 274.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF9F0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    'Doctor Bio',
                                    style: TextStyle(
                                      color: Color(0xFF12151C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 12.0),
                                    child: Text(
                                      'Dr. Hannibal Lecter, a renowned psychiatrist, possesses a chilling intellect honed through decades of clinical practice. His enigmatic charm and profound insights captivate those who seek his counsel, while his unwavering commitment to pushing the boundaries of forensic psychology leaves an indelible mark on the field.',
                                      style: TextStyle(
                                        color: Color(0xFF090909),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 12.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('appointmentbookCopy');
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 48.0,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF081F5C),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        child: Text(
                                          'Book Appointment ',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 17.0,
                                            fontStyle: FontStyle.normal,
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
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.bottomNavigationComponentModel,
                    updateCallback: () => setState(() {}),
                    child: const BottomNavigationComponentWidget(
                      hidden: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
