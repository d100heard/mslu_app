import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'game_selection_record.g.dart';

abstract class GameSelectionRecord
    implements Built<GameSelectionRecord, GameSelectionRecordBuilder> {
  static Serializer<GameSelectionRecord> get serializer =>
      _$gameSelectionRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  DocumentReference get userId;

  @nullable
  @BuiltValueField(wireName: 'user_name')
  DocumentReference get userName;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GameSelectionRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('game_selection');

  static Stream<GameSelectionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  GameSelectionRecord._();
  factory GameSelectionRecord(
          [void Function(GameSelectionRecordBuilder) updates]) =
      _$GameSelectionRecord;

  static GameSelectionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createGameSelectionRecordData({
  DocumentReference userId,
  DocumentReference userName,
  DateTime createdTime,
}) =>
    serializers.toFirestore(
        GameSelectionRecord.serializer,
        GameSelectionRecord((g) => g
          ..userId = userId
          ..userName = userName
          ..createdTime = createdTime));
