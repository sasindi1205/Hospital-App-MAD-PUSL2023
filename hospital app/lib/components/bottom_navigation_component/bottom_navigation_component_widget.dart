import '/hospital_app/hospital_app_animations.dart';
import '/hospital_app/hospital_app_icon_button.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_navigation_component_model.dart';
export 'bottom_navigation_component_model.dart';

class BottomNavigationComponentWidget extends StatefulWidget {
  const BottomNavigationComponentWidget({
    super.key,
    int? selectedPageIndex,
    bool? hidden,
  })  : selectedPageIndex = selectedPageIndex ?? 1,
        hidden = hidden ?? false;

  final int selectedPageIndex;
  final bool hidden;

  @override
  State<BottomNavigationComponentWidget> createState() =>
      _BottomNavigationComponentWidgetState();
}

class _BottomNavigationComponentWidgetState
    extends State<BottomNavigationComponentWidget>
    with TickerProviderStateMixin {
  late BottomNavigationComponentModel _model;

  final animationsMap = {
    'dividerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: const Offset(0.6, 1.0),
          end: const Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: const Offset(0.6, 1.0),
          end: const Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: const Offset(0.6, 1.0),
          end: const Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'dividerOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: const Offset(0.6, 1.0),
          end: const Offset(1.0, 1.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 150.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNavigationComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
      child: Container(
        width: 360.0,
        height: 70.0,
        decoration: BoxDecoration(
          color: const Color(0xFF7096D1),
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
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                hospitalAppIconButton(
                  borderRadius: 30.0,
                  borderWidth: 0.0,
                  buttonSize: 50.0,
                  icon: const Icon(
                    Icons.home_outlined,
                    color: Color(0xFFF7F2EB),
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.goNamed(
                      'HomePage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                ),
                const SizedBox(
                  width: 30.0,
                  child: Divider(
                    height: 2.0,
                    thickness: 2.0,
                    color: Color(0xFFF7F2EB),
                  ),
                ).animateOnPageLoad(
                    animationsMap['dividerOnPageLoadAnimation1']!),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: widget.selectedPageIndex == 2 ? 1.0 : 0.5,
                  child: hospitalAppIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    icon: const FaIcon(
                      FontAwesomeIcons.stethoscope,
                      color: Color(0xFFF7F2EB),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('search_doctors');
                    },
                  ),
                ),
                if (widget.selectedPageIndex == 2)
                  const SizedBox(
                    width: 30.0,
                    child: Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: Color(0xFFF7F2EB),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['dividerOnPageLoadAnimation2']!),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: widget.selectedPageIndex == 3 ? 1.0 : 0.5,
                  child: hospitalAppIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Color(0xFFF7F2EB),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.pushNamed('appointmentbookCopy');
                    },
                  ),
                ),
                if (widget.selectedPageIndex == 3)
                  const SizedBox(
                    width: 30.0,
                    child: Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: Color(0xFFF7F2EB),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['dividerOnPageLoadAnimation3']!),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: widget.selectedPageIndex == 4 ? 1.0 : 0.5,
                  child: hospitalAppIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 0.0,
                    buttonSize: 50.0,
                    hoverColor: hospitalAppTheme.of(context).secondary,
                    icon: const Icon(
                      Icons.person_outline,
                      color: Color(0xFFF7F2EB),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.goNamed(
                        'profilepage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                  ),
                ),
                if (widget.selectedPageIndex == 4)
                  const SizedBox(
                    width: 30.0,
                    child: Divider(
                      height: 2.0,
                      thickness: 2.0,
                      color: Color(0xFFF7F2EB),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['dividerOnPageLoadAnimation4']!),
              ],
            ),
          ]
              .divide(const SizedBox(width: 16.0))
              .addToStart(const SizedBox(width: 16.0))
              .addToEnd(const SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
