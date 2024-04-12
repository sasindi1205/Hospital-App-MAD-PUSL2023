import '/hospital_app/hospital_app_animations.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'onboarding1_model.dart';
export 'onboarding1_model.dart';

class Onboarding1Widget extends StatefulWidget {
  const Onboarding1Widget({super.key});

  @override
  State<Onboarding1Widget> createState() => _Onboarding1WidgetState();
}

class _Onboarding1WidgetState extends State<Onboarding1Widget>
    with TickerProviderStateMixin {
  late Onboarding1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 10.0),
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
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 100.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 10.0),
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
    'textOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0.0, 10.0),
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
    _model = createModel(context, () => Onboarding1Model());

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
                  color: Color(0xFFD28DBB),
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
                                color: Colors.black,
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
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/Asset_2injection.png',
                                    width: 240.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(0.0, 0.0),
                                  child: Image.asset(
                                    'assets/images/Asset_4note.png',
                                    width: 240.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(-0.75, 0.0),
                                  child: Image.asset(
                                    'assets/images/Asset_3stethoscop.png',
                                    width: 240.0,
                                    height: 200.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Appointments',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 36.0,
                              height: 1.0,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                          const Text(
                            'with a doctor',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 36.0,
                              height: 1.2,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation2']!),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                48.0, 16.0, 48.0, 0.0),
                            child: const Text(
                              'We help patients manage and schedule appoinments with the doctors.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF6F6F6),
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation3']!),
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
                              color: const Color(0xFFF2F0DE),
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
                          0.0, 0.0, 0.0, 48.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('onboarding2');
                        },
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
                                  'onboarding2',
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
                                progressColor: const Color(0xFF5A5C60),
                                backgroundColor: const Color(0x00F1F4F8),
                                center: const Text(
                                  '50%',
                                  style: TextStyle(
                                    color: Color(0xFF071D58),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: const BoxDecoration(
                                color: Color(0xFFD0E3FF),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_right_outlined,
                                color: Colors.white,
                                size: 24.0,
                              ),
                            ),
                          ],
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
