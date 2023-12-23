// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DoubleitemStruct extends BaseStruct {
  DoubleitemStruct({
    double? doubleitem,
  }) : _doubleitem = doubleitem;

  // "doubleitem" field.
  double? _doubleitem;
  double get doubleitem => _doubleitem ?? 0.0;
  set doubleitem(double? val) => _doubleitem = val;
  void incrementDoubleitem(double amount) => _doubleitem = doubleitem + amount;
  bool hasDoubleitem() => _doubleitem != null;

  static DoubleitemStruct fromMap(Map<String, dynamic> data) =>
      DoubleitemStruct(
        doubleitem: castToType<double>(data['doubleitem']),
      );

  static DoubleitemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? DoubleitemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'doubleitem': _doubleitem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'doubleitem': serializeParam(
          _doubleitem,
          ParamType.double,
        ),
      }.withoutNulls;

  static DoubleitemStruct fromSerializableMap(Map<String, dynamic> data) =>
      DoubleitemStruct(
        doubleitem: deserializeParam(
          data['doubleitem'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'DoubleitemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DoubleitemStruct && doubleitem == other.doubleitem;
  }

  @override
  int get hashCode => const ListEquality().hash([doubleitem]);
}

DoubleitemStruct createDoubleitemStruct({
  double? doubleitem,
}) =>
    DoubleitemStruct(
      doubleitem: doubleitem,
    );
