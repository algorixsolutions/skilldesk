import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _AUDIOURL = prefs.getString('ff_AUDIOURL') ?? _AUDIOURL;
    });
    _safeInit(() {
      _IMAGEURL = prefs.getString('ff_IMAGEURL') ?? _IMAGEURL;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _AUDIOURL = 'https://quizback.staging.algorixdev.com/storage/audios/';
  String get AUDIOURL => _AUDIOURL;
  set AUDIOURL(String _value) {
    _AUDIOURL = _value;
    prefs.setString('ff_AUDIOURL', _value);
  }

  String _IMAGEURL = 'https://quizback.staging.algorixdev.com/storage/images/';
  String get IMAGEURL => _IMAGEURL;
  set IMAGEURL(String _value) {
    _IMAGEURL = _value;
    prefs.setString('ff_IMAGEURL', _value);
  }

  dynamic _quizStatus = jsonDecode(
      '{\"pending\":\"PENDING\",\"notStarted\":\"not_started\",\"publish\":\"PUBLISHED\",\"null\":null}');
  dynamic get quizStatus => _quizStatus;
  set quizStatus(dynamic _value) {
    _quizStatus = _value;
  }

  String _selectedQuizLabel = '';
  String get selectedQuizLabel => _selectedQuizLabel;
  set selectedQuizLabel(String _value) {
    _selectedQuizLabel = _value;
  }

  dynamic _quiztype = jsonDecode(
      '{\"mcq\":\"MCQ\",\"tf\":\"TRUE_FALSE\",\"error\":\"FIND_THE_ERROR\",\"image\":\"IMAGE\",\"true\":true}');
  dynamic get quiztype => _quiztype;
  set quiztype(dynamic _value) {
    _quiztype = _value;
  }

  dynamic _currQuestion;
  dynamic get currQuestion => _currQuestion;
  set currQuestion(dynamic _value) {
    _currQuestion = _value;
  }

  List<int> _selectedAns = [];
  List<int> get selectedAns => _selectedAns;
  set selectedAns(List<int> _value) {
    _selectedAns = _value;
  }

  void addToSelectedAns(int _value) {
    _selectedAns.add(_value);
  }

  void removeFromSelectedAns(int _value) {
    _selectedAns.remove(_value);
  }

  void removeAtIndexFromSelectedAns(int _index) {
    _selectedAns.removeAt(_index);
  }

  void updateSelectedAnsAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _selectedAns[_index] = updateFn(_selectedAns[_index]);
  }

  void insertAtIndexInSelectedAns(int _index, int _value) {
    _selectedAns.insert(_index, _value);
  }

  bool _isExplain = false;
  bool get isExplain => _isExplain;
  set isExplain(bool _value) {
    _isExplain = _value;
  }

  bool _showAnswer = false;
  bool get showAnswer => _showAnswer;
  set showAnswer(bool _value) {
    _showAnswer = _value;
  }

  int _correctAns = 0;
  int get correctAns => _correctAns;
  set correctAns(int _value) {
    _correctAns = _value;
  }

  DateTime? _startingTime = DateTime.fromMillisecondsSinceEpoch(1699277280000);
  DateTime? get startingTime => _startingTime;
  set startingTime(DateTime? _value) {
    _startingTime = _value;
  }

  DateTime? _quizInitTimer = DateTime.fromMillisecondsSinceEpoch(1699280580000);
  DateTime? get quizInitTimer => _quizInitTimer;
  set quizInitTimer(DateTime? _value) {
    _quizInitTimer = _value;
  }

  dynamic _currchapter;
  dynamic get currchapter => _currchapter;
  set currchapter(dynamic _value) {
    _currchapter = _value;
  }

  dynamic _contentType = jsonDecode(
      '{\"text\":\"TEXT\",\"audio\":\"AUDIO\",\"video\":\"VIDEO\",\"image\":\"IMAGE\"}');
  dynamic get contentType => _contentType;
  set contentType(dynamic _value) {
    _contentType = _value;
  }

  dynamic _mediaType =
      jsonDecode('{\"text\":\"text\",\"audio\":\"audio\",\"image\":\"image\"}');
  dynamic get mediaType => _mediaType;
  set mediaType(dynamic _value) {
    _mediaType = _value;
  }

  bool _isTimerEnd = false;
  bool get isTimerEnd => _isTimerEnd;
  set isTimerEnd(bool _value) {
    _isTimerEnd = _value;
  }

  dynamic _trainingAfterQuiz;
  dynamic get trainingAfterQuiz => _trainingAfterQuiz;
  set trainingAfterQuiz(dynamic _value) {
    _trainingAfterQuiz = _value;
  }

  int _minAnsToPass = 0;
  int get minAnsToPass => _minAnsToPass;
  set minAnsToPass(int _value) {
    _minAnsToPass = _value;
  }

  String _quizID = '';
  String get quizID => _quizID;
  set quizID(String _value) {
    _quizID = _value;
  }

  dynamic _quizResult;
  dynamic get quizResult => _quizResult;
  set quizResult(dynamic _value) {
    _quizResult = _value;
  }

  final _getUsersRankingManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getUsersRanking({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getUsersRankingManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUsersRankingCache() => _getUsersRankingManager.clear();
  void clearGetUsersRankingCacheKey(String? uniqueKey) =>
      _getUsersRankingManager.clearRequest(uniqueKey);

  final _getTicketsCategoriesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTicketsCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTicketsCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTicketsCategoriesCache() => _getTicketsCategoriesManager.clear();
  void clearGetTicketsCategoriesCacheKey(String? uniqueKey) =>
      _getTicketsCategoriesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
