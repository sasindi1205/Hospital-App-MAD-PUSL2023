import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'onboarding2_model.dart';
export 'onboarding2_model.dart';

class Onboarding2Widget extends StatefulWidget {
  const Onboarding2Widget({super.key});

  @override
  State<Onboarding2Widget> createState() => _Onboarding2WidgetState();
}

class _Onboarding2WidgetState extends State<Onboarding2Widget> {
  late Onboarding2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding2Model());

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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100.0,
                decoration: const BoxDecoration(
                  color: Color(0x741E905A),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 48.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('login');
                            },
                            child: const Text(
                              'SKIP',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 48.0),
                            child: Stack(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              children: [
                                Image.asset(
                                  'assets/images/Asset_6note.png',
                                  width: 240.0,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 1.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 48.0),
                                    child: Image.asset(
                                      'assets/images/Asset_8note.png',
                                      width: 240.0,
                                      height: 100.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 0.0),
                                    child: Image.asset(
                                      'assets/images/Asset_9note.png',
                                      width: 240.0,
                                      height: 160.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Keep EHR files',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                              height: 1.0,
                            ),
                          ),
                          const Text(
                            'in one place',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 36.0,
                              height: 1.2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                48.0, 16.0, 48.0, 0.0),
                            child: Text(
                              'We help patients manage and schedule appoinments with the doctors or plan a video call or opt for real-time chat.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF6F6F6),
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF9F0),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDF1F6),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 6.0, 0.0),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDF1F6),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 24.0),
                      child: Stack(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'onboarding3',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                  ),
                                },
                              );
                            },
                            child: CircularPercentIndicator(
                              percent: 0.5,
                              radius: 36.0,
                              lineWidth: 3.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: Colors.white,
                              backgroundColor: const Color(0x00F1F4F8),
                              center: Text(
                                '50%',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: const Color(0xFF071D58),
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
                              context.pushNamed('onboarding3');
                            },
                            child: Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: hospitalAppTheme.of(context).tertiary,
                                shape: BoxShape.circle,
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'onboarding3',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: const Icon(
                                  Icons.arrow_right_outlined,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ],
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
