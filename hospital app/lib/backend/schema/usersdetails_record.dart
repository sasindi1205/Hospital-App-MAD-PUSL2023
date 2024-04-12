import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class UsersdetailsRecord extends FirestoreRecord {
  UsersdetailsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('usersdetails');

  static Stream<UsersdetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersdetailsRecord.fromSnapshot(s));

  static Future<UsersdetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersdetailsRecord.fromSnapshot(s));

  static UsersdetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UsersdetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersdetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersdetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersdetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersdetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersdetailsRecordData({
  String? name,
  String? email,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersdetailsRecordDocumentEquality
    implements Equality<UsersdetailsRecord> {
  const UsersdetailsRecordDocumentEquality();

  @override
  bool equals(UsersdetailsRecord? e1, UsersdetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.image == e2?.image;
  }

  @override
  int hash(UsersdetailsRecord? e) =>
      const ListEquality().hash([e?.name, e?.email, e?.image]);

  @override
  bool isValidKey(Object? o) => o is UsersdetailsRecord;
}
