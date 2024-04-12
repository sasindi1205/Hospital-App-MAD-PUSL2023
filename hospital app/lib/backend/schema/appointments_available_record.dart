import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/hospital_app/hospital_app_util.dart';

class AppointmentsAvailableRecord extends FirestoreRecord {
  AppointmentsAvailableRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "doc_id" field.
  int? _docId;
  int get docId => _docId ?? 0;
  bool hasDocId() => _docId != null;

  // "day1" field.
  DateTime? _day1;
  DateTime? get day1 => _day1;
  bool hasDay1() => _day1 != null;

  // "day2" field.
  DateTime? _day2;
  DateTime? get day2 => _day2;
  bool hasDay2() => _day2 != null;

  // "day3" field.
  DateTime? _day3;
  DateTime? get day3 => _day3;
  bool hasDay3() => _day3 != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _docId = castToType<int>(snapshotData['doc_id']);
    _day1 = snapshotData['day1'] as DateTime?;
    _day2 = snapshotData['day2'] as DateTime?;
    _day3 = snapshotData['day3'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('appointments_available')
          : FirebaseFirestore.instance
              .collectionGroup('appointments_available');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('appointments_available').doc(id);

  static Stream<AppointmentsAvailableRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => AppointmentsAvailableRecord.fromSnapshot(s));

  static Future<AppointmentsAvailableRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppointmentsAvailableRecord.fromSnapshot(s));

  static AppointmentsAvailableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppointmentsAvailableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppointmentsAvailableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppointmentsAvailableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppointmentsAvailableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppointmentsAvailableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppointmentsAvailableRecordData({
  int? docId,
  DateTime? day1,
  DateTime? day2,
  DateTime? day3,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_id': docId,
      'day1': day1,
      'day2': day2,
      'day3': day3,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppointmentsAvailableRecordDocumentEquality
    implements Equality<AppointmentsAvailableRecord> {
  const AppointmentsAvailableRecordDocumentEquality();

  @override
  bool equals(
      AppointmentsAvailableRecord? e1, AppointmentsAvailableRecord? e2) {
    return e1?.docId == e2?.docId &&
        e1?.day1 == e2?.day1 &&
        e1?.day2 == e2?.day2 &&
        e1?.day3 == e2?.day3;
  }

  @override
  int hash(AppointmentsAvailableRecord? e) =>
      const ListEquality().hash([e?.docId, e?.day1, e?.day2, e?.day3]);

  @override
  bool isValidKey(Object? o) => o is AppointmentsAvailableRecord;
}
