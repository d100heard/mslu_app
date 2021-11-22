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
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'No1')
  String get no1;

  @nullable
  @BuiltValueField(wireName: 'No2')
  String get no2;

  @nullable
  @BuiltValueField(wireName: 'No3')
  String get no3;

  @nullable
  @BuiltValueField(wireName: 'user_id')
  String get userId;

  @nullable
  @BuiltValueField(wireName: 'user_name')
  String get userName;

  @nullable
  @BuiltValueField(wireName: 'No1_image')
  String get no1Image;

  @nullable
  @BuiltValueField(wireName: 'no2_image')
  String get no2Image;

  @nullable
  @BuiltValueField(wireName: 'no3_image')
  String get no3Image;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(GameSelectionRecordBuilder builder) => builder
    ..no1 = ''
    ..no2 = ''
    ..no3 = ''
    ..userId = ''
    ..userName = ''
    ..no1Image = ''
    ..no2Image = ''
    ..no3Image = '';

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
  DateTime createdTime,
  String no1,
  String no2,
  String no3,
  String userId,
  String userName,
  String no1Image,
  String no2Image,
  String no3Image,
}) =>
    serializers.toFirestore(
        GameSelectionRecord.serializer,
        GameSelectionRecord((g) => g
          ..createdTime = createdTime
          ..no1 = no1
          ..no2 = no2
          ..no3 = no3
          ..userId = userId
          ..userName = userName
          ..no1Image = no1Image
          ..no2Image = no2Image
          ..no3Image = no3Image));
