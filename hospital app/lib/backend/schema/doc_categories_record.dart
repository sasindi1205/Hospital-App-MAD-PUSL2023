import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class DocCategoriesRecord extends FirestoreRecord {
  DocCategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "category_id" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  bool hasCategoryId() => _categoryId != null;

  // "doctors" field.
  List<String>? _doctors;
  List<String> get doctors => _doctors ?? const [];
  bool hasDoctors() => _doctors != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _categoryId = snapshotData['category_id'] as String?;
    _doctors = getDataList(snapshotData['doctors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('doc_categories');

  static Stream<DocCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocCategoriesRecord.fromSnapshot(s));

  static Future<DocCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocCategoriesRecord.fromSnapshot(s));

  static DocCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocCategoriesRecordData({
  String? categoryName,
  String? categoryId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'category_id': categoryId,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocCategoriesRecordDocumentEquality
    implements Equality<DocCategoriesRecord> {
  const DocCategoriesRecordDocumentEquality();

  @override
  bool equals(DocCategoriesRecord? e1, DocCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.categoryName == e2?.categoryName &&
        e1?.categoryId == e2?.categoryId &&
        listEquality.equals(e1?.doctors, e2?.doctors);
  }

  @override
  int hash(DocCategoriesRecord? e) =>
      const ListEquality().hash([e?.categoryName, e?.categoryId, e?.doctors]);

  @override
  bool isValidKey(Object? o) => o is DocCategoriesRecord;
}
