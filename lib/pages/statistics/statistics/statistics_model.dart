import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'statistics_widget.dart' show StatisticsWidget;
import 'package:flutter/material.dart';

class StatisticsModel extends FlutterFlowModel<StatisticsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ThemeQDropDown widget.
  String? themeQDropDownValue;
  FormFieldController<String>? themeQDropDownValueController;
  // State field(s) for ThemeTDropDown widget.
  String? themeTDropDownValue;
  FormFieldController<String>? themeTDropDownValueController;
  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;

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
