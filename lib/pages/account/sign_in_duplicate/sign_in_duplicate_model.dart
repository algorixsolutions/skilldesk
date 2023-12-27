import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'sign_in_duplicate_widget.dart' show SignInDuplicateWidget;

class SignInDuplicateModel extends FlutterFlowModel<SignInDuplicateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
