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
  @BuiltValueField(wireName: 'player_id')
  String get playerId;

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
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(WalesSquadRecordBuilder builder) => builder
    ..playerId = ''
    ..playerName = ''
    ..playerImage = ''
    ..playerPosition = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Wales_squad');

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
  String playerId,
  String playerName,
  String playerImage,
  String playerPosition,
}) =>
    serializers.toFirestore(
        WalesSquadRecord.serializer,
        WalesSquadRecord((w) => w
          ..playerId = playerId
          ..playerName = playerName
          ..playerImage = playerImage
          ..playerPosition = playerPosition));
