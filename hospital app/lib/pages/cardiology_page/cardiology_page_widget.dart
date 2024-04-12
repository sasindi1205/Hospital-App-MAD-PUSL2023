import '/backend/backend.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardiology_page_model.dart';
export 'cardiology_page_model.dart';

class CardiologyPageWidget extends StatefulWidget {
  const CardiologyPageWidget({super.key});

  @override
  State<CardiologyPageWidget> createState() => _CardiologyPageWidgetState();
}

class _CardiologyPageWidgetState extends State<CardiologyPageWidget> {
  late CardiologyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardiologyPageModel());

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: const Color(0xFF7096D1),
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-0.99, -0.53),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          5.0, 65.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('search_doctors');
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Color(0xFFF6F5F3),
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'Cardiologists',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: const Color(0xFFFFF9F0),
                          fontSize: 40.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: false,
              expandedTitleScale: 1.0,
              titlePadding:
                  const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
            ),
            elevation: 4.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(-1.0, 1.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: StreamBuilder<List<DoctorsRecord>>(
                    stream: queryDoctorsRecord(
                      queryBuilder: (doctorsRecord) => doctorsRecord.where(
                        'doc_category',
                        isEqualTo: 'Cardiologist',
                      ),
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
                      List<DoctorsRecord> listViewDoctorsRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDoctorsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewDoctorsRecord =
                              listViewDoctorsRecordList[listViewIndex];
                          return Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 10.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  if (listViewDoctorsRecord.docId == 2) {
                                    context
                                        .pushNamed('Doctorprofile1CopyCopy2');
                                  } else {
                                    if (listViewDoctorsRecord.docId == 3) {
                                      context
                                          .pushNamed('Doctorprofile1CopyCopy');
                                    }
                                  }
                                },
                                child: SizedBox(
                                  width: 350.0,
                                  height: 80.0,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.0),
                                        child: Container(
                                          width: 360.0,
                                          height: 200.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFD0E2FF),
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
                                                BorderRadius.circular(12.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color: const Color(0xFFBAD6EB),
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 3.0, 0.0, 0.0),
                                                child: Stack(
                                                  children: [
                                                    const Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.04, -0.5),
                                                      child: Icon(
                                                        Icons.circle,
                                                        color:
                                                            Color(0xFF334EAC),
                                                        size: 70.0,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              -1.0, -0.2),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Container(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://images.unsplash.com/photo-1502989642968-94fbdc9eace4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MTAwOTM2OTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.41, -0.26),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                0.0,
                                                                30.0,
                                                                130.0,
                                                                0.0),
                                                        child: Text(
                                                          listViewDoctorsRecord
                                                              .docTitle,
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Open Sans',
                                                            color: Colors.black,
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
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.46, 0.01),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 0.0, 130.0, 20.0),
                                          child: SelectionArea(
                                              child: Text(
                                            listViewDoctorsRecord.docName,
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.black,
                                              fontSize: 16.0,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].addToStart(const SizedBox(height: 0.0)),
            ),
          ),
        ),
      ),
    );
  }
}
