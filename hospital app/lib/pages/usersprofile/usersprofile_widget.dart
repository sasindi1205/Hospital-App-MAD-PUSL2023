import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'usersprofile_model.dart';
export 'usersprofile_model.dart';

class UsersprofileWidget extends StatefulWidget {
  const UsersprofileWidget({super.key});

  @override
  State<UsersprofileWidget> createState() => _UsersprofileWidgetState();
}

class _UsersprofileWidgetState extends State<UsersprofileWidget> {
  late UsersprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UsersprofileModel());

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
        backgroundColor: const Color(0xFFFCFDFF),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFF7096D1),
            automaticallyImplyLeading: true,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('profilepage');
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFFF6F5F3),
                size: 24.0,
              ),
            ),
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 1.0),
                    child: StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return const Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xFF42A1C3),
                                ),
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> stackUsersRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final stackUsersRecord = stackUsersRecordList.isNotEmpty
                            ? stackUsersRecordList.first
                            : null;
                        return Stack(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 30.0, 0.0, 0.0),
                                child: Container(
                                  width: 70.0,
                                  height: 70.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    stackUsersRecord!.photoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.01, 0.24),
                              child: AuthUserStreamWidget(
                                builder: (context) => Text(
                                  currentUserDisplayName,
                                  style: GoogleFonts.getFont(
                                    'Roboto',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.0,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment:
                                  const AlignmentDirectional(-0.02, 1.14),
                              child: Text(
                                valueOrDefault<String>(
                                  stackUsersRecord.email,
                                  'email',
                                ),
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
            ),
            elevation: 4.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 40.0, 0.0, 5.0),
                child: Text(
                  'Users Full Name',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            currentUserDisplayName,
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Users Address',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.address, ''),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Users Bloodtype',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.bloodtype, ''),
                            style: GoogleFonts.getFont(
                              'Open Sans',
                              color: hospitalAppTheme.of(context).primaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Users Allergies',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(currentUserDocument?.allergies, ''),
                            style: hospitalAppTheme
                                .of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      hospitalAppTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Users Life Long Conditions',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(
                                currentUserDocument?.lifelongConditions, ''),
                            style: hospitalAppTheme
                                .of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      hospitalAppTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Users Contact Number',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(
                                currentUserDocument?.contactNumber, ''),
                            style: hospitalAppTheme
                                .of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color:
                                      hospitalAppTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(25.0, 15.0, 0.0, 5.0),
                child: Text(
                  'Guardian/Emergency Number',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 370.0,
                    height: 52.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF1F6),
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
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            valueOrDefault(
                                currentUserDocument?.guardianNumber, ''),
                            style: hospitalAppTheme
                                .of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
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
    );
  }
}
