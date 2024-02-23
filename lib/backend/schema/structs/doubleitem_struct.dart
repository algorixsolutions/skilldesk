// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoubleitemStruct extends BaseStruct {
  DoubleitemStruct({
    double? doubleitem,
    String? stringItem,
  })  : _doubleitem = doubleitem,
        _stringItem = stringItem;

  // "doubleitem" field.
  double? _doubleitem;
  double get doubleitem => _doubleitem ?? 0.0;
  set doubleitem(double? val) => _doubleitem = val;
  void incrementDoubleitem(double amount) => _doubleitem = doubleitem + amount;
  bool hasDoubleitem() => _doubleitem != null;

  // "StringItem" field.
  String? _stringItem;
  String get stringItem => _stringItem ?? '';
  set stringItem(String? val) => _stringItem = val;
  bool hasStringItem() => _stringItem != null;

  static DoubleitemStruct fromMap(Map<String, dynamic> data) =>
      DoubleitemStruct(
        doubleitem: castToType<double>(data['doubleitem']),
        stringItem: data['StringItem'] as String?,
      );

  static DoubleitemStruct? maybeFromMap(dynamic data) => data is Map
      ? DoubleitemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'doubleitem': _doubleitem,
        'StringItem': _stringItem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doubleitem': serializeParam(
          _doubleitem,
          ParamType.double,
        ),
        'StringItem': serializeParam(
          _stringItem,
          ParamType.String,
        ),
      }.withoutNulls;

  static DoubleitemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoubleitemStruct(
        doubleitem: deserializeParam(
          data['doubleitem'],
          ParamType.double,
          false,
        ),
        stringItem: deserializeParam(
          data['StringItem'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DoubleitemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoubleitemStruct &&
        doubleitem == other.doubleitem &&
        stringItem == other.stringItem;
  }

  @override
  int get hashCode => const ListEquality().hash([doubleitem, stringItem]);
}

DoubleitemStruct createDoubleitemStruct({
  double? doubleitem,
  String? stringItem,
}) =>
    DoubleitemStruct(
      doubleitem: doubleitem,
      stringItem: stringItem,
    );
