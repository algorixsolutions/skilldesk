import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<dynamic> allTrainings = [];
  void addToAllTrainings(dynamic item) => allTrainings.add(item);
  void removeFromAllTrainings(dynamic item) => allTrainings.remove(item);
  void removeAtIndexFromAllTrainings(int index) => allTrainings.removeAt(index);
  void insertAtIndexInAllTrainings(int index, dynamic item) =>
      allTrainings.insert(index, item);
  void updateAllTrainingsAtIndex(int index, Function(dynamic) updateFn) =>
      allTrainings[index] = updateFn(allTrainings[index]);

  List<dynamic> allQuizz = [];
  void addToAllQuizz(dynamic item) => allQuizz.add(item);
  void removeFromAllQuizz(dynamic item) => allQuizz.remove(item);
  void removeAtIndexFromAllQuizz(int index) => allQuizz.removeAt(index);
  void insertAtIndexInAllQuizz(int index, dynamic item) =>
      allQuizz.insert(index, item);
  void updateAllQuizzAtIndex(int index, Function(dynamic) updateFn) =>
      allQuizz[index] = updateFn(allQuizz[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Trainings )] action in home widget.
  ApiCallResponse? apiResultAllTrainings;
  // Stores action output result for [Backend Call - API (Get Quizzes)] action in home widget.
  ApiCallResponse? apiResultAllQuizz;
  // Stores action output result for [Backend Call - API (Get Quiz By Id)] action in Container widget.
  ApiCallResponse? apiResult03s;
  // Stores action output result for [Backend Call - API (Get Training By Id)] action in Container widget.
  ApiCallResponse? apiResult1tp;

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
