import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/hospital_app/hospital_app_util.dart';

class DoctorsRecord extends FirestoreRecord {
  DoctorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "doc_name" field.
  String? _docName;
  String get docName => _docName ?? '';
  bool hasDocName() => _docName != null;

  // "doc_category" field.
  String? _docCategory;
  String get docCategory => _docCategory ?? '';
  bool hasDocCategory() => _docCategory != null;

  // "doc_email" field.
  String? _docEmail;
  String get docEmail => _docEmail ?? '';
  bool hasDocEmail() => _docEmail != null;

  // "doc_id" field.
  int? _docId;
  int get docId => _docId ?? 0;
  bool hasDocId() => _docId != null;

  // "rating" field.
  List<int>? _rating;
  List<int> get rating => _rating ?? const [];
  bool hasRating() => _rating != null;

  // "doc_title" field.
  String? _docTitle;
  String get docTitle => _docTitle ?? '';
  bool hasDocTitle() => _docTitle != null;

  void _initializeFields() {
    _docName = snapshotData['doc_name'] as String?;
    _docCategory = snapshotData['doc_category'] as String?;
    _docEmail = snapshotData['doc_email'] as String?;
    _docId = castToType<int>(snapshotData['doc_id']);
    _rating = getDataList(snapshotData['rating']);
    _docTitle = snapshotData['doc_title'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doctors');

  static Stream<DoctorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DoctorsRecord.fromSnapshot(s));

  static Future<DoctorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DoctorsRecord.fromSnapshot(s));

  static DoctorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DoctorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DoctorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DoctorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DoctorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DoctorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDoctorsRecordData({
  String? docName,
  String? docCategory,
  String? docEmail,
  int? docId,
  String? docTitle,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_name': docName,
      'doc_category': docCategory,
      'doc_email': docEmail,
      'doc_id': docId,
      'doc_title': docTitle,
    }.withoutNulls,
  );

  return firestoreData;
}

class DoctorsRecordDocumentEquality implements Equality<DoctorsRecord> {
  const DoctorsRecordDocumentEquality();

  @override
  bool equals(DoctorsRecord? e1, DoctorsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.docName == e2?.docName &&
        e1?.docCategory == e2?.docCategory &&
        e1?.docEmail == e2?.docEmail &&
        e1?.docId == e2?.docId &&
        listEquality.equals(e1?.rating, e2?.rating) &&
        e1?.docTitle == e2?.docTitle;
  }

  @override
  int hash(DoctorsRecord? e) => const ListEquality().hash([
        e?.docName,
        e?.docCategory,
        e?.docEmail,
        e?.docId,
        e?.rating,
        e?.docTitle
      ]);

  @override
  bool isValidKey(Object? o) => o is DoctorsRecord;
}
