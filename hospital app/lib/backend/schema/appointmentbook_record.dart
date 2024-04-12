import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/hospital_app/hospital_app_util.dart';

class AppointmentbookRecord extends FirestoreRecord {
  AppointmentbookRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  bool hasDay() => _day != null;

  // "docid" field.
  int? _docid;
  int get docid => _docid ?? 0;
  bool hasDocid() => _docid != null;

  // "day2" field.
  DateTime? _day2;
  DateTime? get day2 => _day2;
  bool hasDay2() => _day2 != null;

  // "day3" field.
  DateTime? _day3;
  DateTime? get day3 => _day3;
  bool hasDay3() => _day3 != null;

  // "u_email" field.
  String? _uEmail;
  String get uEmail => _uEmail ?? '';
  bool hasUEmail() => _uEmail != null;

  // "u_name" field.
  String? _uName;
  String get uName => _uName ?? '';
  bool hasUName() => _uName != null;

  // "u_symptoms" field.
  String? _uSymptoms;
  String get uSymptoms => _uSymptoms ?? '';
  bool hasUSymptoms() => _uSymptoms != null;

  // "doc_name" field.
  String? _docName;
  String get docName => _docName ?? '';
  bool hasDocName() => _docName != null;

  void _initializeFields() {
    _day = snapshotData['day'] as DateTime?;
    _docid = castToType<int>(snapshotData['docid']);
    _day2 = snapshotData['day2'] as DateTime?;
    _day3 = snapshotData['day3'] as DateTime?;
    _uEmail = snapshotData['u_email'] as String?;
    _uName = snapshotData['u_name'] as String?;
    _uSymptoms = snapshotData['u_symptoms'] as String?;
    _docName = snapshotData['doc_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appointmentbook');

  static Stream<AppointmentbookRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentbookRecord.fromSnapshot(s));

  static Future<AppointmentbookRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppointmentbookRecord.fromSnapshot(s));

  static AppointmentbookRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentbookRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentbookRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentbookRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentbookRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentbookRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentbookRecordData({
  DateTime? day,
  int? docid,
  DateTime? day2,
  DateTime? day3,
  String? uEmail,
  String? uName,
  String? uSymptoms,
  String? docName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'docid': docid,
      'day2': day2,
      'day3': day3,
      'u_email': uEmail,
      'u_name': uName,
      'u_symptoms': uSymptoms,
      'doc_name': docName,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentbookRecordDocumentEquality
    implements Equality<AppointmentbookRecord> {
  const AppointmentbookRecordDocumentEquality();

  @override
  bool equals(AppointmentbookRecord? e1, AppointmentbookRecord? e2) {
    return e1?.day == e2?.day &&
        e1?.docid == e2?.docid &&
        e1?.day2 == e2?.day2 &&
        e1?.day3 == e2?.day3 &&
        e1?.uEmail == e2?.uEmail &&
        e1?.uName == e2?.uName &&
        e1?.uSymptoms == e2?.uSymptoms &&
        e1?.docName == e2?.docName;
  }

  @override
  int hash(AppointmentbookRecord? e) => const ListEquality().hash([
        e?.day,
        e?.docid,
        e?.day2,
        e?.day3,
        e?.uEmail,
        e?.uName,
        e?.uSymptoms,
        e?.docName
      ]);

  @override
  bool isValidKey(Object? o) => o is AppointmentbookRecord;
}
