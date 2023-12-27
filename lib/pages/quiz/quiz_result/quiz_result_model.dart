import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'quiz_result_widget.dart' show QuizResultWidget;


class QuizResultModel extends FlutterFlowModel<QuizResultWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
