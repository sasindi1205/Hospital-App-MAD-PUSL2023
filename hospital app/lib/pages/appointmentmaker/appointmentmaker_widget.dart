import '/backend/backend.dart';
import '/hospital_app/hospital_app_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appointmentmaker_model.dart';
export 'appointmentmaker_model.dart';

class AppointmentmakerWidget extends StatefulWidget {
  const AppointmentmakerWidget({super.key});

  @override
  State<AppointmentmakerWidget> createState() => _AppointmentmakerWidgetState();
}

class _AppointmentmakerWidgetState extends State<AppointmentmakerWidget> {
  late AppointmentmakerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentmakerModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.docIDController ??= TextEditingController();
    _model.docIDFocusNode ??= FocusNode();

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
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: const Color(0xFFBAD6EB),
            automaticallyImplyLeading: true,
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
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
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                child: Container(
                  width: 100.0,
                  height: 93.0,
                  decoration: const BoxDecoration(
                    color: Color(0xFFBAD6EB),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          'Create Appointment Slot',
                          style: GoogleFonts.getFont(
                            'Roboto',
                            color: const Color(0xFF081F5C),
                            fontWeight: FontWeight.w600,
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.safePop();
                        },
                        child: const Icon(
                          Icons.chevron_left,
                          color: Color(0xFF182F69),
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 20.0),
                child: TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Enter Doctor Name',
                    labelStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                    ),
                    hintStyle: GoogleFonts.getFont(
                      'Open Sans',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFBAD6EB),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF081F5C),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE65454),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE65454),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                  ),
                  minLines: null,
                  validator:
                      _model.textController1Validator.asValidator(context),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(8.0, 10.0, 8.0, 20.0),
                child: TextFormField(
                  controller: _model.docIDController,
                  focusNode: _model.docIDFocusNode,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Enter doctor ID',
                    labelStyle: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                    ),
                    hintStyle: GoogleFonts.getFont(
                      'Open Sans',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFBAD6EB),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF081F5C),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE65454),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFE65454),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: Colors.black,
                  ),
                  minLines: null,
                  validator:
                      _model.docIDControllerValidator.asValidator(context),
                ),
              ),
              Container(
                width: 6.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0E3FF),
                  borderRadius: BorderRadius.circular(0.0),
                  border: Border.all(
                    color: const Color(0xFFBAD6EB),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Day 1',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked1Date = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor: const Color(0xFF061B52),
                          headerForegroundColor: Colors.white,
                          headerTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 32.0,
                          ),
                          pickerBackgroundColor: const Color(0xFFF7F4F0),
                          pickerForegroundColor: const Color(0xFF0C0E13),
                          selectedDateTimeBackgroundColor:
                              const Color(0xFF425CB4),
                          selectedDateTimeForegroundColor: Colors.white,
                          actionButtonForegroundColor: const Color(0xFF12151C),
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? datePicked1Time;
                    if (datePicked1Date != null) {
                      datePicked1Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor: const Color(0xFF061B52),
                            headerForegroundColor: Colors.white,
                            headerTextStyle: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 32.0,
                            ),
                            pickerBackgroundColor: const Color(0xFFF7F4F0),
                            pickerForegroundColor: const Color(0xFF0C0E13),
                            selectedDateTimeBackgroundColor:
                                const Color(0xFF425CB4),
                            selectedDateTimeForegroundColor: Colors.white,
                            actionButtonForegroundColor:
                                const Color(0xFF12151C),
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (datePicked1Date != null && datePicked1Time != null) {
                      safeSetState(() {
                        _model.datePicked1 = DateTime(
                          datePicked1Date.year,
                          datePicked1Date.month,
                          datePicked1Date.day,
                          datePicked1Time!.hour,
                          datePicked1Time.minute,
                        );
                      });
                    }
                  },
                  child: Container(
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7096D1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat('MMMMEEEEd', _model.datePicked1),
                          'day 1',
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0E3FF),
                  border: Border.all(
                    color: const Color(0xFFBAD6EB),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Day 2',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked2Date = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor: const Color(0xFF061B52),
                          headerForegroundColor: Colors.white,
                          headerTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 32.0,
                          ),
                          pickerBackgroundColor: const Color(0xFFFAF8F5),
                          pickerForegroundColor: const Color(0xFF151922),
                          selectedDateTimeBackgroundColor:
                              const Color(0xFF425CB4),
                          selectedDateTimeForegroundColor: Colors.white,
                          actionButtonForegroundColor: const Color(0xFF12151C),
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? datePicked2Time;
                    if (datePicked2Date != null) {
                      datePicked2Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor: const Color(0xFF061B52),
                            headerForegroundColor: Colors.white,
                            headerTextStyle: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 32.0,
                            ),
                            pickerBackgroundColor: const Color(0xFFFAF8F5),
                            pickerForegroundColor: const Color(0xFF151922),
                            selectedDateTimeBackgroundColor:
                                const Color(0xFF425CB4),
                            selectedDateTimeForegroundColor: Colors.white,
                            actionButtonForegroundColor:
                                const Color(0xFF12151C),
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (datePicked2Date != null && datePicked2Time != null) {
                      safeSetState(() {
                        _model.datePicked2 = DateTime(
                          datePicked2Date.year,
                          datePicked2Date.month,
                          datePicked2Date.day,
                          datePicked2Time!.hour,
                          datePicked2Time.minute,
                        );
                      });
                    }
                  },
                  child: Container(
                    width: 202.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7096D1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat('MMMMEEEEd', _model.datePicked2),
                          'day 2',
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFD0E3FF),
                  border: Border.all(
                    color: const Color(0xFFBAD6EB),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Day 3',
                    style: GoogleFonts.getFont(
                      'Open Sans',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    final datePicked3Date = await showDatePicker(
                      context: context,
                      initialDate: getCurrentTimestamp,
                      firstDate: getCurrentTimestamp,
                      lastDate: DateTime(2050),
                      builder: (context, child) {
                        return wrapInMaterialDatePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor: const Color(0xFF061B52),
                          headerForegroundColor: Colors.white,
                          headerTextStyle: GoogleFonts.getFont(
                            'Open Sans',
                            fontWeight: FontWeight.w600,
                            fontSize: 32.0,
                          ),
                          pickerBackgroundColor: const Color(0xFFFCF9F5),
                          pickerForegroundColor: const Color(0xFF0B0D12),
                          selectedDateTimeBackgroundColor:
                              const Color(0xFF425CB4),
                          selectedDateTimeForegroundColor: Colors.white,
                          actionButtonForegroundColor: const Color(0xFF12151C),
                          iconSize: 24.0,
                        );
                      },
                    );

                    TimeOfDay? datePicked3Time;
                    if (datePicked3Date != null) {
                      datePicked3Time = await showTimePicker(
                        context: context,
                        initialTime:
                            TimeOfDay.fromDateTime(getCurrentTimestamp),
                        builder: (context, child) {
                          return wrapInMaterialTimePickerTheme(
                            context,
                            child!,
                            headerBackgroundColor: const Color(0xFF061B52),
                            headerForegroundColor: Colors.white,
                            headerTextStyle: GoogleFonts.getFont(
                              'Open Sans',
                              fontWeight: FontWeight.w600,
                              fontSize: 32.0,
                            ),
                            pickerBackgroundColor: const Color(0xFFFCF9F5),
                            pickerForegroundColor: const Color(0xFF0B0D12),
                            selectedDateTimeBackgroundColor:
                                const Color(0xFF425CB4),
                            selectedDateTimeForegroundColor: Colors.white,
                            actionButtonForegroundColor:
                                const Color(0xFF12151C),
                            iconSize: 24.0,
                          );
                        },
                      );
                    }

                    if (datePicked3Date != null && datePicked3Time != null) {
                      safeSetState(() {
                        _model.datePicked3 = DateTime(
                          datePicked3Date.year,
                          datePicked3Date.month,
                          datePicked3Date.day,
                          datePicked3Time!.hour,
                          datePicked3Time.minute,
                        );
                      });
                    }
                  },
                  child: Container(
                    width: 202.0,
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7096D1),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          dateTimeFormat('MMMMEEEEd', _model.datePicked3),
                          'day 3',
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Appoint2Record.collection
                        .doc()
                        .set(createAppoint2RecordData(
                          did: int.tryParse(_model.docIDController.text),
                          d1: _model.datePicked1,
                          d2: _model.datePicked2,
                          d3: _model.datePicked3,
                          dname: _model.textController1.text,
                        ));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'upload successful ',
                          style: TextStyle(
                            color: Color(0xFF141821),
                          ),
                        ),
                        duration: Duration(milliseconds: 4000),
                        backgroundColor: Color(0xFF6488C0),
                      ),
                    );
                  },
                  child: Container(
                    height: 65.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFF182F69),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Submit ',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
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
