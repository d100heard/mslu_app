import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'no2_record.g.dart';

abstract class No2Record implements Built<No2Record, No2RecordBuilder> {
  static Serializer<No2Record> get serializer => _$no2RecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'player_name')
  DocumentReference get playerName;

  @nullable
  @BuiltValueField(wireName: 'player_image')
  DocumentReference get playerImage;

  @nullable
  @BuiltValueField(wireName: 'player_id')
  DocumentReference get playerId;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(No2RecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('No2');

  static Stream<No2Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  No2Record._();
  factory No2Record([void Function(No2RecordBuilder) updates]) = _$No2Record;

  static No2Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNo2RecordData({
  DocumentReference playerName,
  DocumentReference playerImage,
  DocumentReference playerId,
}) =>
    serializers.toFirestore(
        No2Record.serializer,
        No2Record((n) => n
          ..playerName = playerName
          ..playerImage = playerImage
          ..playerId = playerId));
