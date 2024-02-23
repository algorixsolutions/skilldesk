import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'training_chapters_widget.dart' show TrainingChaptersWidget;
import 'package:flutter/material.dart';

class TrainingChaptersModel extends FlutterFlowModel<TrainingChaptersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for custom_appbar component.
  late CustomAppbarModel customAppbarModel;
  // Stores action output result for [Backend Call - API (Start Training)] action in Container widget.
  ApiCallResponse? apiResultdr3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
