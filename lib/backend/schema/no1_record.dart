import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'no1_record.g.dart';

abstract class No1Record implements Built<No1Record, No1RecordBuilder> {
  static Serializer<No1Record> get serializer => _$no1RecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'player_image')
  DocumentReference get playerImage;

  @nullable
  @BuiltValueField(wireName: 'player_id')
  DocumentReference get playerId;

  @nullable
  @BuiltValueField(wireName: 'player_name')
  DocumentReference get playerName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(No1RecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('No1');

  static Stream<No1Record> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  No1Record._();
  factory No1Record([void Function(No1RecordBuilder) updates]) = _$No1Record;

  static No1Record getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createNo1RecordData({
  DocumentReference playerImage,
  DocumentReference playerId,
  DocumentReference playerName,
}) =>
    serializers.toFirestore(
        No1Record.serializer,
        No1Record((n) => n
          ..playerImage = playerImage
          ..playerId = playerId
          ..playerName = playerName));
