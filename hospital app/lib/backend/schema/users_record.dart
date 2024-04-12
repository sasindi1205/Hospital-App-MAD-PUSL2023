import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/hospital_app/hospital_app_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "bloodtype" field.
  String? _bloodtype;
  String get bloodtype => _bloodtype ?? '';
  bool hasBloodtype() => _bloodtype != null;

  // "allergies" field.
  String? _allergies;
  String get allergies => _allergies ?? '';
  bool hasAllergies() => _allergies != null;

  // "lifelong_conditions" field.
  String? _lifelongConditions;
  String get lifelongConditions => _lifelongConditions ?? '';
  bool hasLifelongConditions() => _lifelongConditions != null;

  // "contact_number" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  // "guardian_number" field.
  String? _guardianNumber;
  String get guardianNumber => _guardianNumber ?? '';
  bool hasGuardianNumber() => _guardianNumber != null;

  // "classRef" field.
  DocumentReference? _classRef;
  DocumentReference? get classRef => _classRef;
  bool hasClassRef() => _classRef != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _address = snapshotData['address'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _age = castToType<int>(snapshotData['age']);
    _bloodtype = snapshotData['bloodtype'] as String?;
    _allergies = snapshotData['allergies'] as String?;
    _lifelongConditions = snapshotData['lifelong_conditions'] as String?;
    _contactNumber = snapshotData['contact_number'] as String?;
    _guardianNumber = snapshotData['guardian_number'] as String?;
    _classRef = snapshotData['classRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? address,
  DateTime? birthday,
  int? age,
  String? bloodtype,
  String? allergies,
  String? lifelongConditions,
  String? contactNumber,
  String? guardianNumber,
  DocumentReference? classRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'address': address,
      'birthday': birthday,
      'age': age,
      'bloodtype': bloodtype,
      'allergies': allergies,
      'lifelong_conditions': lifelongConditions,
      'contact_number': contactNumber,
      'guardian_number': guardianNumber,
      'classRef': classRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.address == e2?.address &&
        e1?.birthday == e2?.birthday &&
        e1?.age == e2?.age &&
        e1?.bloodtype == e2?.bloodtype &&
        e1?.allergies == e2?.allergies &&
        e1?.lifelongConditions == e2?.lifelongConditions &&
        e1?.contactNumber == e2?.contactNumber &&
        e1?.guardianNumber == e2?.guardianNumber &&
        e1?.classRef == e2?.classRef;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.address,
        e?.birthday,
        e?.age,
        e?.bloodtype,
        e?.allergies,
        e?.lifelongConditions,
        e?.contactNumber,
        e?.guardianNumber,
        e?.classRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
