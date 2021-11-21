import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'no3_record.g.dart';

abstract class No3Record implements Built<No3Record, No3RecordBuilder> {
  static Serializer<No3Record> get serializer => _$no3RecordSerializer;

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

  static void _initializeBuilder(No3RecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('No3');

  static Stream<No3Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  No3Record._();
  factory No3Record([void Function(No3RecordBuilder) updates]) = _$No3Record;

  static No3Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNo3RecordData({
  DocumentReference playerName,
  DocumentReference playerImage,
  DocumentReference playerId,
}) =>
    serializers.toFirestore(
        No3Record.serializer,
        No3Record((n) => n
          ..playerName = playerName
          ..playerImage = playerImage
          ..playerId = playerId));
