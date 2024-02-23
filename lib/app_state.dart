import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
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
    _safeInit(() {
      _DOCUMENTURL = prefs.getString('ff_DOCUMENTURL') ?? _DOCUMENTURL;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _AUDIOURL = 'https://quizback.staging.algorixdev.com/storage/audios/';
  String get AUDIOURL => _AUDIOURL;
  set AUDIOURL(String value) {
    _AUDIOURL = value;
    prefs.setString('ff_AUDIOURL', value);
  }

  String _IMAGEURL = 'https://quizback.staging.algorixdev.com/storage/images/';
  String get IMAGEURL => _IMAGEURL;
  set IMAGEURL(String value) {
    _IMAGEURL = value;
    prefs.setString('ff_IMAGEURL', value);
  }

  dynamic _quizStatus = jsonDecode(
      '{"pending":"PENDING","notStarted":"not_started","publish":"PUBLISHED","null":null,"inProgress":"in_progress","completed":"completed"}');
  dynamic get quizStatus => _quizStatus;
  set quizStatus(dynamic value) {
    _quizStatus = value;
  }

  String _selectedQuizLabel = '';
  String get selectedQuizLabel => _selectedQuizLabel;
  set selectedQuizLabel(String value) {
    _selectedQuizLabel = value;
  }

  dynamic _quiztype = jsonDecode(
      '{"mcq":"MCQ","tf":"TRUE_FALSE","error":"FIND_THE_ERROR","image":"IMAGE","true":true}');
  dynamic get quiztype => _quiztype;
  set quiztype(dynamic value) {
    _quiztype = value;
  }

  dynamic _currQuestion;
  dynamic get currQuestion => _currQuestion;
  set currQuestion(dynamic value) {
    _currQuestion = value;
  }

  List<int> _selectedAns = [];
  List<int> get selectedAns => _selectedAns;
  set selectedAns(List<int> value) {
    _selectedAns = value;
  }

  void addToSelectedAns(int value) {
    _selectedAns.add(value);
  }

  void removeFromSelectedAns(int value) {
    _selectedAns.remove(value);
  }

  void removeAtIndexFromSelectedAns(int index) {
    _selectedAns.removeAt(index);
  }

  void updateSelectedAnsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _selectedAns[index] = updateFn(_selectedAns[index]);
  }

  void insertAtIndexInSelectedAns(int index, int value) {
    _selectedAns.insert(index, value);
  }

  bool _isExplain = false;
  bool get isExplain => _isExplain;
  set isExplain(bool value) {
    _isExplain = value;
  }

  bool _showAnswer = false;
  bool get showAnswer => _showAnswer;
  set showAnswer(bool value) {
    _showAnswer = value;
  }

  int _correctAns = 0;
  int get correctAns => _correctAns;
  set correctAns(int value) {
    _correctAns = value;
  }

  DateTime? _startingTime = DateTime.fromMillisecondsSinceEpoch(1699277280000);
  DateTime? get startingTime => _startingTime;
  set startingTime(DateTime? value) {
    _startingTime = value;
  }

  DateTime? _quizInitTimer = DateTime.fromMillisecondsSinceEpoch(1699280580000);
  DateTime? get quizInitTimer => _quizInitTimer;
  set quizInitTimer(DateTime? value) {
    _quizInitTimer = value;
  }

  dynamic _contentType = jsonDecode(
      '{"text":"TEXT","audio":"AUDIO","video":"VIDEO","image":"IMAGE","youtube":"Youtube","vimeo":"Vimeo"}');
  dynamic get contentType => _contentType;
  set contentType(dynamic value) {
    _contentType = value;
  }

  dynamic _mediaType =
      jsonDecode('{"text":"text","audio":"audio","image":"image"}');
  dynamic get mediaType => _mediaType;
  set mediaType(dynamic value) {
    _mediaType = value;
  }

  bool _isTimerEnd = false;
  bool get isTimerEnd => _isTimerEnd;
  set isTimerEnd(bool value) {
    _isTimerEnd = value;
  }

  dynamic _trainingAfterQuiz;
  dynamic get trainingAfterQuiz => _trainingAfterQuiz;
  set trainingAfterQuiz(dynamic value) {
    _trainingAfterQuiz = value;
  }

  int _minAnsToPass = 0;
  int get minAnsToPass => _minAnsToPass;
  set minAnsToPass(int value) {
    _minAnsToPass = value;
  }

  String _quizID = '';
  String get quizID => _quizID;
  set quizID(String value) {
    _quizID = value;
  }

  dynamic _quizResult;
  dynamic get quizResult => _quizResult;
  set quizResult(dynamic value) {
    _quizResult = value;
  }

  List<String> _ThemeColors = [
    '#E26EE5',
    '#7E30E1',
    '#FF7676',
    '#756AB6',
    '#0C356A',
    '#000000',
    '#5FBDFF',
    '#0ECEFF',
    '#3887BE'
  ];
  List<String> get ThemeColors => _ThemeColors;
  set ThemeColors(List<String> value) {
    _ThemeColors = value;
  }

  void addToThemeColors(String value) {
    _ThemeColors.add(value);
  }

  void removeFromThemeColors(String value) {
    _ThemeColors.remove(value);
  }

  void removeAtIndexFromThemeColors(int index) {
    _ThemeColors.removeAt(index);
  }

  void updateThemeColorsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _ThemeColors[index] = updateFn(_ThemeColors[index]);
  }

  void insertAtIndexInThemeColors(int index, String value) {
    _ThemeColors.insert(index, value);
  }

  String _DOCUMENTURL =
      'https://quizback.staging.algorixdev.com/storage/uploads/';
  String get DOCUMENTURL => _DOCUMENTURL;
  set DOCUMENTURL(String value) {
    _DOCUMENTURL = value;
    prefs.setString('ff_DOCUMENTURL', value);
  }

  String _StatsPeriod = '';
  String get StatsPeriod => _StatsPeriod;
  set StatsPeriod(String value) {
    _StatsPeriod = value;
  }

  String _StatsTheme = '';
  String get StatsTheme => _StatsTheme;
  set StatsTheme(String value) {
    _StatsTheme = value;
  }

  int _NbOfQuestionsToAns = 0;
  int get NbOfQuestionsToAns => _NbOfQuestionsToAns;
  set NbOfQuestionsToAns(int value) {
    _NbOfQuestionsToAns = value;
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

  final _getThemesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getThemes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getThemesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetThemesCache() => _getThemesManager.clear();
  void clearGetThemesCacheKey(String? uniqueKey) =>
      _getThemesManager.clearRequest(uniqueKey);

  final _getQuizListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getQuizList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getQuizListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetQuizListCache() => _getQuizListManager.clear();
  void clearGetQuizListCacheKey(String? uniqueKey) =>
      _getQuizListManager.clearRequest(uniqueKey);

  final _getTrainingListManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTrainingList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTrainingListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTrainingListCache() => _getTrainingListManager.clear();
  void clearGetTrainingListCacheKey(String? uniqueKey) =>
      _getTrainingListManager.clearRequest(uniqueKey);

  final _getUserStatsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getUserStats({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getUserStatsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserStatsCache() => _getUserStatsManager.clear();
  void clearGetUserStatsCacheKey(String? uniqueKey) =>
      _getUserStatsManager.clearRequest(uniqueKey);

  final _getTicketsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getTickets({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getTicketsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetTicketsCache() => _getTicketsManager.clear();
  void clearGetTicketsCacheKey(String? uniqueKey) =>
      _getTicketsManager.clearRequest(uniqueKey);
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
