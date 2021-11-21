import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'wales_squad_record.g.dart';

abstract class WalesSquadRecord
    implements Built<WalesSquadRecord, WalesSquadRecordBuilder> {
  static Serializer<WalesSquadRecord> get serializer =>
      _$walesSquadRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'player_name')
  String get playerName;

  @nullable
  @BuiltValueField(wireName: 'player_image')
  String get playerImage;

  @nullable
  @BuiltValueField(wireName: 'player_position')
  String get playerPosition;

  @nullable
  @BuiltValueField(wireName: 'player_id')
  String get playerId;

  @nullable
  String get email;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WalesSquadRecordBuilder builder) => builder
    ..playerName = ''
    ..playerImage = ''
    ..playerPosition = ''
    ..playerId = ''
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wales_squad');

  static Stream<WalesSquadRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  WalesSquadRecord._();
  factory WalesSquadRecord([void Function(WalesSquadRecordBuilder) updates]) =
      _$WalesSquadRecord;

  static WalesSquadRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createWalesSquadRecordData({
  String playerName,
  String playerImage,
  String playerPosition,
  String playerId,
  String email,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
}) =>
    serializers.toFirestore(
        WalesSquadRecord.serializer,
        WalesSquadRecord((w) => w
          ..playerName = playerName
          ..playerImage = playerImage
          ..playerPosition = playerPosition
          ..playerId = playerId
          ..email = email
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber));
