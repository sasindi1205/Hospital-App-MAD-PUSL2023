import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class LabResultsRecord extends FirestoreRecord {
  LabResultsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "test" field.
  String? _test;
  String get test => _test ?? '';
  bool hasTest() => _test != null;

  // "results" field.
  String? _results;
  String get results => _results ?? '';
  bool hasResults() => _results != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _test = snapshotData['test'] as String?;
    _results = snapshotData['results'] as String?;
    _email = snapshotData['email'] as String?;
    _date = snapshotData['date'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('lab_results')
          : FirebaseFirestore.instance.collectionGroup('lab_results');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('lab_results').doc(id);

  static Stream<LabResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabResultsRecord.fromSnapshot(s));

  static Future<LabResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabResultsRecord.fromSnapshot(s));

  static LabResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabResultsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabResultsRecordData({
  String? test,
  String? results,
  String? email,
  DateTime? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'test': test,
      'results': results,
      'email': email,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabResultsRecordDocumentEquality implements Equality<LabResultsRecord> {
  const LabResultsRecordDocumentEquality();

  @override
  bool equals(LabResultsRecord? e1, LabResultsRecord? e2) {
    return e1?.test == e2?.test &&
        e1?.results == e2?.results &&
        e1?.email == e2?.email &&
        e1?.date == e2?.date;
  }

  @override
  int hash(LabResultsRecord? e) =>
      const ListEquality().hash([e?.test, e?.results, e?.email, e?.date]);

  @override
  bool isValidKey(Object? o) => o is LabResultsRecord;
}
