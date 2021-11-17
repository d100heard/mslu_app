import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'credits_record.g.dart';

abstract class CreditsRecord
    implements Built<CreditsRecord, CreditsRecordBuilder> {
  static Serializer<CreditsRecord> get serializer => _$creditsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'Name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'No_Credits')
  int get noCredits;

  @nullable
  @BuiltValueField(wireName: 'credit_price')
  String get creditPrice;

  @nullable
  String get image;

  @nullable
  int get price;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CreditsRecordBuilder builder) => builder
    ..name = ''
    ..noCredits = 0
    ..creditPrice = ''
    ..image = ''
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('credits');

  static Stream<CreditsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CreditsRecord._();
  factory CreditsRecord([void Function(CreditsRecordBuilder) updates]) =
      _$CreditsRecord;

  static CreditsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCreditsRecordData({
  String name,
  int noCredits,
  String creditPrice,
  String image,
  int price,
}) =>
    serializers.toFirestore(
        CreditsRecord.serializer,
        CreditsRecord((c) => c
          ..name = name
          ..noCredits = noCredits
          ..creditPrice = creditPrice
          ..image = image
          ..price = price));
