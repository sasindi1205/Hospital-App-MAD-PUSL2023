import '/auth/firebase_auth/auth_util.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profilepage_model.dart';
export 'profilepage_model.dart';

class ProfilepageWidget extends StatefulWidget {
  const ProfilepageWidget({super.key});

  @override
  State<ProfilepageWidget> createState() => _ProfilepageWidgetState();
}

class _ProfilepageWidgetState extends State<ProfilepageWidget> {
  late ProfilepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilepageModel());

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
        backgroundColor: const Color(0xFFF2F6FC),
        appBar: AppBar(
          backgroundColor: const Color(0xFFB8D3E8),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              'Profile',
              style: GoogleFonts.getFont(
                'Open Sans',
                color: const Color(0xFF071D58),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('onboarding1', context.mounted);
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      color: const Color(0xFF12151C),
                    ),
                  ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF3F8FF),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3.0,
                        color: Color(0x33000000),
                        offset: Offset(
                          0.0,
                          1.0,
                        ),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFF071D58),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF6C94D2),
                              width: 2.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: CachedNetworkImage(
                                fadeInDuration:
                                    const Duration(milliseconds: 500),
                                fadeOutDuration:
                                    const Duration(milliseconds: 500),
                                imageUrl:
                                    'https://images.unsplash.com/photo-1664575602554-2087b04935a5?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx3b21hbnxlbnwwfHx8fDE3MTA1MTU3Njh8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDisplayName,
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  currentUserEmail,
                                  style: GoogleFonts.getFont(
                                    'Open Sans',
                                    color: const Color(0xFF090909),
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
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Account',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('usersprofile');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDF8EF),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x3416202A),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.person_outline,
                            color: Color(0xFF525457),
                            size: 24.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'User Details',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  color: const Color(0xFF090909),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                            alignment: AlignmentDirectional(0.9, 0.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFF525457),
                              size: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF8EF),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3416202A),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.rate_review_outlined,
                          color: Color(0xFF525457),
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Reviews',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF090909),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF525457),
                            size: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                child: Text(
                  'General',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF8EF),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3416202A),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.help_outline_rounded,
                          color: Color(0xFF525457),
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'FAQ',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF090909),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF525457),
                            size: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF8EF),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3416202A),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.privacy_tip_rounded,
                          color: Color(0xFF525457),
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Terms of Service',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF090909),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFF525457),
                            size: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFDF8EF),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color(0x3416202A),
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Icon(
                          Icons.ios_share,
                          color: Color(0xFF525457),
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Invite Friends',
                              style: GoogleFonts.getFont(
                                'Open Sans',
                                color: const Color(0xFF090909),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF525457),
                          size: 18.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        20.0, 15.0, 20.0, 0.0),
                    child: wrapWithModel(
                      model: _model.bottomNavigationComponentModel,
                      updateCallback: () => setState(() {}),
                      child: const BottomNavigationComponentWidget(
                        hidden: false,
                      ),
                    ),
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
