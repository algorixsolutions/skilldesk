import '/backend/api_requests/api_calls.dart';
import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'training_chapter_content_copy_widget.dart'
    show TrainingChapterContentCopyWidget;
import 'package:flutter/material.dart';

class TrainingChapterContentCopyModel
    extends FlutterFlowModel<TrainingChapterContentCopyWidget> {
  ///  Local state fields for this page.

  dynamic currChapter;

  bool isTimerEnd = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for custom_appbar component.
  late CustomAppbarModel customAppbarModel;
  // Stores action output result for [Backend Call - API (Store Chapter Progression)] action in Container widget.
  ApiCallResponse? apiResult09l;
  // State field(s) for Timer widget.
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    customAppbarModel = createModel(context, () => CustomAppbarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    customAppbarModel.dispose();
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
