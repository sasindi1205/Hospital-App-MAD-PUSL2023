import '/backend/backend.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appointmentbook_copy_model.dart';
export 'appointmentbook_copy_model.dart';

class AppointmentbookCopyWidget extends StatefulWidget {
  const AppointmentbookCopyWidget({super.key});

  @override
  State<AppointmentbookCopyWidget> createState() =>
      _AppointmentbookCopyWidgetState();
}

class _AppointmentbookCopyWidgetState extends State<AppointmentbookCopyWidget> {
  late AppointmentbookCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentbookCopyModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.docidController1 ??= TextEditingController();
    _model.docidFocusNode1 ??= FocusNode();

    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.docidController2 ??= TextEditingController();
    _model.docidFocusNode2 ??= FocusNode();

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
          preferredSize: const Size.fromHeight(80.0),
          child: AppBar(
            backgroundColor: const Color(0xFF425CB4),
            automaticallyImplyLeading: true,
            leading: InkWell(
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
            title: Text(
              'Book an Appointment',
              style: GoogleFonts.getFont(
                'Open Sans',
                color: const Color(0xFFF6F5F3),
                fontWeight: FontWeight.w600,
                fontSize: 22.0,
              ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 4.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        StreamBuilder<List<Appoint2Record>>(
                          stream: queryAppoint2Record(
                            queryBuilder: (appoint2Record) =>
                                appoint2Record.where(
                              'did',
                              isEqualTo: 2,
                            ),
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
                            List<Appoint2Record> listViewAppoint2RecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final listViewAppoint2Record =
                                listViewAppoint2RecordList.isNotEmpty
                                    ? listViewAppoint2RecordList.first
                                    : null;
                            return ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 30.0, 0.0, 0.0),
                                  child: Container(
                                    width: 34.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFBAD6EB),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewAppoint2Record?.d1
                                              ?.toString(),
                                          '1',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        StreamBuilder<List<Appoint2Record>>(
                          stream: queryAppoint2Record(
                            queryBuilder: (appoint2Record) =>
                                appoint2Record.where(
                              'did',
                              isEqualTo: 2,
                            ),
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
                            List<Appoint2Record> listViewAppoint2RecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final listViewAppoint2Record =
                                listViewAppoint2RecordList.isNotEmpty
                                    ? listViewAppoint2RecordList.first
                                    : null;
                            return ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 409.0,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEDF1F6),
                                  ),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, -0.89),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8.0, 10.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Enter Email',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFBAD6EB),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF425CB4),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              minLines: null,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.01, 0.81),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await AppointmentbookRecord
                                                  .collection
                                                  .doc()
                                                  .set({
                                                ...createAppointmentbookRecordData(
                                                  uEmail: _model
                                                      .textController1.text,
                                                  uName: _model
                                                      .textController2.text,
                                                  uSymptoms: _model
                                                      .textController3.text,
                                                  docid: int.tryParse(_model
                                                      .docidController1.text),
                                                  docName:
                                                      listViewAppoint2Record
                                                          ?.dname,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'day': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'appointment successful',
                                                    style: TextStyle(
                                                      color: Color(0xFF12151C),
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF7096D1),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 255.0,
                                              height: 52.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFF688ECA),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              -0.04, 0.75),
                                          child: Text(
                                            'Book This Appointment',
                                            style: GoogleFonts.getFont(
                                              'Roboto',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, -0.5),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8.0, 10.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Enter Name',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFBAD6EB),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF425CB4),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              minLines: null,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.28),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8.0, 30.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode3,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Symptoms',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFBAD6EB),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF425CB4),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xC5BE8082),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              minLines: null,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, -0.06),
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                            child: TextFormField(
                                              controller:
                                                  _model.docidController1,
                                              focusNode: _model.docidFocusNode1,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Enter doctor ID',
                                                labelStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                hintStyle: GoogleFonts.getFont(
                                                  'Open Sans',
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFBAD6EB),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFF425CB4),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFB86767),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFB86767),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              minLines: null,
                                              validator: _model
                                                  .docidController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 115.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFBAD6EB),
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Align(
                                    alignment:
                                        const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        listViewAppoint2Record?.d2?.toString(),
                                        '2',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Open Sans',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        StreamBuilder<List<Appoint2Record>>(
                          stream: queryAppoint2Record(
                            queryBuilder: (appoint2Record) =>
                                appoint2Record.where(
                              'did',
                              isEqualTo: 2,
                            ),
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
                            List<Appoint2Record> listViewAppoint2RecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final listViewAppoint2Record =
                                listViewAppoint2RecordList.isNotEmpty
                                    ? listViewAppoint2RecordList.first
                                    : null;
                            return ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: [
                                Container(
                                  height: 398.0,
                                  decoration: const BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, -0.83),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 10.0, 8.0, 10.0),
                                          child: TextFormField(
                                            controller: _model.textController5,
                                            focusNode:
                                                _model.textFieldFocusNode4,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Enter Email',
                                              labelStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFBAD6EB),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF425CB4),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                            ),
                                            minLines: null,
                                            validator: _model
                                                .textController5Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.01, 0.91),
                                        child: Container(
                                          width: 255.0,
                                          height: 52.0,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF6990CC),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            -0.06, 0.83),
                                        child: Text(
                                          'Book This Appointment',
                                          style: GoogleFonts.getFont(
                                            'Roboto',
                                            color: const Color(0xFFF7F2EB),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, -0.35),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController6,
                                            focusNode:
                                                _model.textFieldFocusNode5,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Enter Name',
                                              labelStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFBAD6EB),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF334EAC),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                            ),
                                            minLines: null,
                                            validator: _model
                                                .textController6Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.45),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 10.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.textController7,
                                            focusNode:
                                                _model.textFieldFocusNode6,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Symptoms',
                                              labelStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFBAD6EB),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF334EAC),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                            ),
                                            minLines: null,
                                            validator: _model
                                                .textController7Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: const AlignmentDirectional(
                                            0.0, 0.06),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                          child: TextFormField(
                                            controller: _model.docidController2,
                                            focusNode: _model.docidFocusNode2,
                                            autofocus: true,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Enter doctor ID',
                                              labelStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              hintStyle: GoogleFonts.getFont(
                                                'Open Sans',
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFBAD6EB),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFF425CB4),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFB86767),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                            ),
                                            minLines: null,
                                            validator: _model
                                                .docidController2Validator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Container(
                                    width: 115.0,
                                    height: 70.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFBAD6EB),
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          listViewAppoint2Record?.d3
                                              ?.toString(),
                                          '3',
                                        ),
                                        style: GoogleFonts.getFont(
                                          'Open Sans',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
