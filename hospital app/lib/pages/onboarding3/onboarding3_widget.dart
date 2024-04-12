import '/hospital_app/hospital_app_animations.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'onboarding3_model.dart';
export 'onboarding3_model.dart';

class Onboarding3Widget extends StatefulWidget {
  const Onboarding3Widget({super.key});

  @override
  State<Onboarding3Widget> createState() => _Onboarding3WidgetState();
}

class _Onboarding3WidgetState extends State<Onboarding3Widget>
    with TickerProviderStateMixin {
  late Onboarding3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 0.4,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(160.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 900.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-120.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Onboarding3Model());

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
                  color: Color(0xFF8D9BD2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 48.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [],
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
                            child: Image.asset(
                              'assets/images/Asset_10note.png',
                              width: 240.0,
                              height: 240.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
                            'Emergency services ',
                            style: hospitalAppTheme
                                .of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 33.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.0,
                                ),
                          ),
                          Text(
                            'and latest news',
                            style: hospitalAppTheme
                                .of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 1.2,
                                ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                48.0, 16.0, 48.0, 0.0),
                            child: Text(
                              'We help users contact emergency services and view latest articles related to health & fitness.',
                              textAlign: TextAlign.center,
                              style: hospitalAppTheme
                                  .of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: const Color(0xFFEFEFEF),
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.w500,
                                    lineHeight: 1.5,
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
                              color: const Color(0x4DFFFFFF),
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
                              color: const Color(0x32FFFFFF),
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation1']!),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Padding(
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
                                    'login',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 180.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(36.0),
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Get Started',
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            color: const Color(0xFF585858),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.0,
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'textOnPageLoadAnimation']!),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed('login');
                                          },
                                          child: Container(
                                            width: 36.0,
                                            height: 36.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFD9D9D9),
                                              shape: BoxShape.circle,
                                            ),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'login',
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
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
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation3']!),
                                      ],
                                    ),
                                  ),
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation2']!),
                            ],
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
