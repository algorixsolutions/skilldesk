import 'package:flutter/material.dart';

import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_detail_widget.dart' show NotificationsDetailWidget;

class NotificationsDetailModel
    extends FlutterFlowModel<NotificationsDetailWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Increment Notification View)] action in notifications_detail widget.
  ApiCallResponse? apiResultzee;

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
