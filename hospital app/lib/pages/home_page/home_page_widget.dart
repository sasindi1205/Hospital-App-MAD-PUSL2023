import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_animations.dart';
import '/hospital_app/hospital_app_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? homepage,
  }) : homepage = homepage ?? 1;

  final int homepage;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 10.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UsersdetailsRecord>>(
      stream: queryUsersdetailsRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Color(0xFFEDF1F6),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF42A1C3),
                  ),
                ),
              ),
            ),
          );
        }
        List<UsersdetailsRecord> homePageUsersdetailsRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final homePageUsersdetailsRecord =
            homePageUsersdetailsRecordList.isNotEmpty
                ? homePageUsersdetailsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: const Color(0xFFEDF1F6),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 16.0, 20.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Have a nice day!',
                          style: TextStyle(
                            color: Color(0xFF12151C),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
                                    currentUserDisplayName,
                                    style: GoogleFonts.getFont(
                                      'Roboto',
                                      color: const Color(0xFF12151C),
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    130.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 80.0,
                                  height: 80.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1531736275454-adc48d079ce9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMHx8bGlnaHQlMjBibHVlJTIweWVsbG93fGVufDB8fHx8MTcxMjE0NjgxNXww&ixlib=rb-4.0.3&q=80&w=1080',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 16.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.goNamed(
                                        'search_doctors',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey:
                                              const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F0DE),
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 3.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              1.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.heartbeat,
                                              color: Color(0xFF5A5C60),
                                              size: 30.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Text(
                                                'Doctors',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('displayappointment');
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFBAD6EB),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.date_range_outlined,
                                              color: Color(0xFF5A5C60),
                                              size: 30.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 0.0),
                                              child: Text(
                                                'Appointments',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      unawaited(
                                        () async {
                                          await launchUrl(Uri(
                                            scheme: 'tel',
                                            path: '0760940938',
                                          ));
                                        }(),
                                      );
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFBAD6EB),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.call_outlined,
                                              color: Color(0xFF5A5C60),
                                              size: 35.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Text(
                                                'Contact',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('dispalylabresults');
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F0DE),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.health_and_safety_outlined,
                                              color: Color(0xFF5A5C60),
                                              size: 30.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Text(
                                                'Labs',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      unawaited(
                                        () async {
                                          await launchUrl(Uri(
                                            scheme: 'tel',
                                            path: '119',
                                          ));
                                        }(),
                                      );
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF2F0DE),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.emergency_outlined,
                                              color: Color(0xFFD35757),
                                              size: 30.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Text(
                                                'Emergency',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 9.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      unawaited(
                                        () async {
                                          await launchURL(
                                              'https://www.who.int/publications');
                                        }(),
                                      );
                                    },
                                    child: Container(
                                      width: 144.0,
                                      height: 125.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFBAD6EB),
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
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const FaIcon(
                                              FontAwesomeIcons.newspaper,
                                              color: Color(0xFF5A5C60),
                                              size: 30.0,
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0.0, 1.0),
                                              child: Text(
                                                'Articles',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color:
                                                      const Color(0xFF12151C),
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 20.0)),
                            ),
                          ),
                        ].divide(const SizedBox(height: 25.0)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        50.0, 0.0, 0.0, 0.0),
                    child: Container(
                      width: 105.0,
                      height: 46.0,
                      decoration: const BoxDecoration(),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
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
        );
      },
    );
  }
}
