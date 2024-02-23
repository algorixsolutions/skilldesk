import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'statistics_o_l_d_widget.dart' show StatisticsOLDWidget;
import 'package:flutter/material.dart';

class StatisticsOLDModel extends FlutterFlowModel<StatisticsOLDWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for ThemeQDropDown widget.
  String? themeQDropDownValue;
  FormFieldController<String>? themeQDropDownValueController;
  // State field(s) for ThemeTDropDown widget.
  String? themeTDropDownValue;
  FormFieldController<String>? themeTDropDownValueController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
