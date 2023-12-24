import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'dart:async';
import 'message_details_widget.dart' show MessageDetailsWidget;
import 'package:flutter/material.dart';

class MessageDetailsModel extends FlutterFlowModel<MessageDetailsWidget> {
  ///  Local state fields for this page.

  bool buttonSendDisable = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // State field(s) for TextFieldReply widget.
  FocusNode? textFieldReplyFocusNode;
  TextEditingController? textFieldReplyController;
  String? Function(BuildContext, String?)? textFieldReplyControllerValidator;
  // Stores action output result for [Backend Call - API (Store Discussion Response )] action in IconButton widget.
  ApiCallResponse? apiResultags;

  /// Query cache managers for this widget.

  final _getDiscussionResponsesManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getDiscussionResponses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getDiscussionResponsesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetDiscussionResponsesCache() =>
      _getDiscussionResponsesManager.clear();
  void clearGetDiscussionResponsesCacheKey(String? uniqueKey) =>
      _getDiscussionResponsesManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldReplyFocusNode?.dispose();
    textFieldReplyController?.dispose();

    /// Dispose query cache managers for this widget.

    clearGetDiscussionResponsesCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
