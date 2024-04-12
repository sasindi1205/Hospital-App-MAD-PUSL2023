import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/hospital_app/hospital_app_util.dart';

class Appoint2Record extends FirestoreRecord {
  Appoint2Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "did" field.
  int? _did;
  int get did => _did ?? 0;
  bool hasDid() => _did != null;

  // "d1" field.
  DateTime? _d1;
  DateTime? get d1 => _d1;
  bool hasD1() => _d1 != null;

  // "d2" field.
  DateTime? _d2;
  DateTime? get d2 => _d2;
  bool hasD2() => _d2 != null;

  // "d3" field.
  DateTime? _d3;
  DateTime? get d3 => _d3;
  bool hasD3() => _d3 != null;

  // "dname" field.
  String? _dname;
  String get dname => _dname ?? '';
  bool hasDname() => _dname != null;

  void _initializeFields() {
    _did = castToType<int>(snapshotData['did']);
    _d1 = snapshotData['d1'] as DateTime?;
    _d2 = snapshotData['d2'] as DateTime?;
    _d3 = snapshotData['d3'] as DateTime?;
    _dname = snapshotData['dname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appoint2');

  static Stream<Appoint2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Appoint2Record.fromSnapshot(s));

  static Future<Appoint2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Appoint2Record.fromSnapshot(s));

  static Appoint2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Appoint2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Appoint2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Appoint2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Appoint2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Appoint2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppoint2RecordData({
  int? did,
  DateTime? d1,
  DateTime? d2,
  DateTime? d3,
  String? dname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'did': did,
      'd1': d1,
      'd2': d2,
      'd3': d3,
      'dname': dname,
    }.withoutNulls,
  );

  return firestoreData;
}

class Appoint2RecordDocumentEquality implements Equality<Appoint2Record> {
  const Appoint2RecordDocumentEquality();

  @override
  bool equals(Appoint2Record? e1, Appoint2Record? e2) {
    return e1?.did == e2?.did &&
        e1?.d1 == e2?.d1 &&
        e1?.d2 == e2?.d2 &&
        e1?.d3 == e2?.d3 &&
        e1?.dname == e2?.dname;
  }

  @override
  int hash(Appoint2Record? e) =>
      const ListEquality().hash([e?.did, e?.d1, e?.d2, e?.d3, e?.dname]);

  @override
  bool isValidKey(Object? o) => o is Appoint2Record;
}
