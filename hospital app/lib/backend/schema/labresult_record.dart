import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LabresultRecord extends FirestoreRecord {
  LabresultRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  bool hasTest() => _test != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  bool hasResult() => _result != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  void _initializeFields() {
    _test = snapshotData['test'] as String?;
    _result = snapshotData['result'] as String?;
    _email = snapshotData['email'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labresult');

  static Stream<LabresultRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabresultRecord.fromSnapshot(s));

  static Future<LabresultRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabresultRecord.fromSnapshot(s));

  static LabresultRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabresultRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabresultRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabresultRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabresultRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabresultRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabresultRecordData({
  String? test,
  String? result,
  String? email,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test': test,
      'result': result,
      'email': email,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabresultRecordDocumentEquality implements Equality<LabresultRecord> {
  const LabresultRecordDocumentEquality();

  @override
  bool equals(LabresultRecord? e1, LabresultRecord? e2) {
    return e1?.test == e2?.test &&
        e1?.result == e2?.result &&
        e1?.email == e2?.email &&
        e1?.date == e2?.date;
  }

  @override
  int hash(LabresultRecord? e) =>
      const ListEquality().hash([e?.test, e?.result, e?.email, e?.date]);

  @override
  bool isValidKey(Object? o) => o is LabresultRecord;
}
