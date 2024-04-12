import '/backend/backend.dart';
import '/components/bottom_navigation_component/bottom_navigation_component_widget.dart';
import '/hospital_app/hospital_app_theme.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pediatricians_model.dart';
export 'pediatricians_model.dart';

class PediatriciansWidget extends StatefulWidget {
  const PediatriciansWidget({super.key});

  @override
  State<PediatriciansWidget> createState() => _PediatriciansWidgetState();
}

class _PediatriciansWidgetState extends State<PediatriciansWidget> {
  late PediatriciansModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PediatriciansModel());

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
        backgroundColor: const Color(0xFFEFF2F7),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await _model.listViewController1?.animateTo(
                          _model.listViewController1!.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.ease,
                        );
                      },
                      child: ListView(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        controller: _model.listViewController1,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 150.0, 0.0, 0.0),
                            child: StreamBuilder<List<DoctorsRecord>>(
                              stream: queryDoctorsRecord(
                                queryBuilder: (doctorsRecord) =>
                                    doctorsRecord.where(
                                  'doc_category',
                                  isEqualTo: 'physician',
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
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
                                        listViewDoctorsRecordList[
                                            listViewIndex];
                                    return Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 0.0, 0.0, 30.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (listViewDoctorsRecord.docId ==
                                                1) {
                                              context.pushNamed(
                                                  'Doctorprofile1Copy');
                                            }
                                          },
                                          child: SizedBox(
                                            width: 350.0,
                                            height: 80.0,
                                            child: Stack(
                                              children: [
                                                Container(
                                                  width: 360.0,
                                                  height: 241.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFD0E2FF),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4.0,
                                                        color:
                                                            Color(0x33000000),
                                                        offset: Offset(
                                                          0.0,
                                                          2.0,
                                                        ),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -0.33,
                                                                    0.45),
                                                            child: Text(
                                                              listViewDoctorsRecord
                                                                  .docTitle,
                                                              style: GoogleFonts
                                                                  .getFont(
                                                                'Open Sans',
                                                              ),
                                                            ),
                                                          ),
                                                          const Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.04,
                                                                    -0.73),
                                                            child: Icon(
                                                              Icons.circle,
                                                              color: Color(
                                                                  0xFF334EAC),
                                                              size: 70.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                -0.99, -0.41),
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
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              'https://images.unsplash.com/photo-1502989642968-94fbdc9eace4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw1fHxzdGFycnklMjBuaWdodHxlbnwwfHx8fDE3MTAwOTM2OTV8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -0.28, -0.34),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    listViewDoctorsRecord
                                                        .docName,
                                                    style: GoogleFonts.getFont(
                                                      'Open Sans',
                                                      color: Colors.black,
                                                      fontSize: 16.0,
                                                    ),
                                                  )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  controller: _model.listViewController2,
                                );
                              },
                            ),
                          ),
                          Container(
                            height: 200.0,
                            decoration: const BoxDecoration(),
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 0.0, 0.0),
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
                        ].divide(const SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    height: 139.0,
                    decoration: BoxDecoration(
                      color: hospitalAppTheme.of(context).secondary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color(0xFFBAD6EB),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Icon(
                              Icons.chevron_left_rounded,
                              color: hospitalAppTheme.of(context).accent4,
                              size: 50.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Text(
                                    'Physicians',
                                    style: GoogleFonts.getFont(
                                      'Open Sans',
                                      color: hospitalAppTheme
                                          .of(context)
                                          .secondaryBackground,
                                      fontSize: 40.0,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
