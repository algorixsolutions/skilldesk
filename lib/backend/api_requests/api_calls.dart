import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BASE URL Group Code

class BaseUrlGroup {
  static String baseUrl = 'https://quizback.staging.algorixdev.com/api';
  static Map<String, String> headers = {};
  static HomeInfosCall homeInfosCall = HomeInfosCall();
  static GetQuizzesCall getQuizzesCall = GetQuizzesCall();
  static GetThemesCall getThemesCall = GetThemesCall();
  static GetTrainingsCall getTrainingsCall = GetTrainingsCall();
  static GetUserStatsCall getUserStatsCall = GetUserStatsCall();
  static StoreAnsweredQuestionCall storeAnsweredQuestionCall =
      StoreAnsweredQuestionCall();
  static StoreChapterProgressionCall storeChapterProgressionCall =
      StoreChapterProgressionCall();
  static GetNotificationCall getNotificationCall = GetNotificationCall();
  static IncrementNotificationViewCall incrementNotificationViewCall =
      IncrementNotificationViewCall();
  static GetQuizByIdCall getQuizByIdCall = GetQuizByIdCall();
  static GetTrainingByIdCall getTrainingByIdCall = GetTrainingByIdCall();
}

class HomeInfosCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Home Infos',
      apiUrl: '${BaseUrlGroup.baseUrl}/home/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic myRank(dynamic response) => getJsonField(
        response,
        r'''$.ranked''',
      );
  dynamic totalUsers(dynamic response) => getJsonField(
        response,
        r'''$.total_users''',
      );
  dynamic myXP(dynamic response) => getJsonField(
        response,
        r'''$.total_xp''',
      );
  dynamic totaltime(dynamic response) => getJsonField(
        response,
        r'''$.total_time''',
      );
  dynamic myLearningTime(dynamic response) => getJsonField(
        response,
        r'''$.learning_time''',
      );
  dynamic nbQuiz(dynamic response) => getJsonField(
        response,
        r'''$.quizes''',
      );
  dynamic nbTrainings(dynamic response) => getJsonField(
        response,
        r'''$.trainings''',
      );
  dynamic nbQuizCompleted(dynamic response) => getJsonField(
        response,
        r'''$.quizedCompleted''',
      );
  dynamic nbTrainingCompleted(dynamic response) => getJsonField(
        response,
        r'''$.trainingsCompleted''',
      );
  List? inProgress(dynamic response) => getJsonField(
        response,
        r'''$.inprogress''',
        true,
      ) as List?;
  List? upcoming(dynamic response) => getJsonField(
        response,
        r'''$.upcoming''',
        true,
      ) as List?;
}

class GetQuizzesCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Quizzes',
      apiUrl: '${BaseUrlGroup.baseUrl}/quizzes/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'UserID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? quizData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  List<String>? labelList(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].label_theme''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
}

class GetThemesCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Themes',
      apiUrl: '${BaseUrlGroup.baseUrl}/themes/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? labelList(dynamic response) => (getJsonField(
        response,
        r'''$[:].label''',
        true,
      ) as List?)
          ?.withoutNulls
          .cast<String>();
  List? idList(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
}

class GetTrainingsCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Trainings ',
      apiUrl: '${BaseUrlGroup.baseUrl}/trainings/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  List? trainingData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class GetUserStatsCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? period = 'day',
    String? themeID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Stats',
      apiUrl: '${BaseUrlGroup.baseUrl}/stats/${userID}/${period}/${themeID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic myRank(dynamic response) => getJsonField(
        response,
        r'''$.ranked.rank''',
      );
  dynamic myPosition(dynamic response) => getJsonField(
        response,
        r'''$.ranked.position''',
      );
  dynamic numOfUsers(dynamic response) => getJsonField(
        response,
        r'''$.ranked.number_users''',
      );
  dynamic myPoints(dynamic response) => getJsonField(
        response,
        r'''$.pointsAccumulated.points''',
      );
  dynamic myPointsProgress(dynamic response) => getJsonField(
        response,
        r'''$.pointsAccumulated.percentage''',
      );
  dynamic myLearningTime(dynamic response) => getJsonField(
        response,
        r'''$.progress.learning_time''',
      );
  dynamic myQuizProgress(dynamic response) => getJsonField(
        response,
        r'''$.progress.quized''',
      );
  dynamic myTrainingProgress(dynamic response) => getJsonField(
        response,
        r'''$.progress.learnine''',
      );
  dynamic myQuizRank(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.ranked.rank''',
      );
  dynamic myQuizPosition(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.ranked.position''',
      );
  dynamic myQuizTime(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.time_on_quiz''',
      );
  dynamic myQuizScore(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.score''',
      );
  dynamic myQuizDone(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.quiz_done''',
      );
  dynamic myQuestionsDone(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.questions_done''',
      );
  dynamic myBadAnswers(dynamic response) => getJsonField(
        response,
        r'''$.quizesStats.bad_answer''',
      );
  dynamic myTrainingTime(dynamic response) => getJsonField(
        response,
        r'''$.trainingsStats.time_on_training''',
      );
  dynamic myTrainingScore(dynamic response) => getJsonField(
        response,
        r'''$.trainingsStats.score''',
      );
  dynamic myTrainingDone(dynamic response) => getJsonField(
        response,
        r'''$.trainingsStats.training_done''',
      );
}

class StoreAnsweredQuestionCall {
  Future<ApiCallResponse> call({
    String? duration = '',
    int? isCorrect,
    String? questionId = '',
    String? quizId = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store Answered Question',
      apiUrl:
          '${BaseUrlGroup.baseUrl}/quizzes/answer-question/store?duration=${duration}&is_correct=${isCorrect}&question_id=${questionId}&quiz_id=${quizId}&user_id=${userId}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class StoreChapterProgressionCall {
  Future<ApiCallResponse> call({
    String? trainingId = '',
    String? chapterId = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store Chapter Progression',
      apiUrl: '${BaseUrlGroup.baseUrl}/trainings/chapter-progression/store',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'training_id': trainingId,
        'chapter_id': chapterId,
        'user_id': userId,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetNotificationCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Notification',
      apiUrl: '${BaseUrlGroup.baseUrl}/notifications/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class IncrementNotificationViewCall {
  Future<ApiCallResponse> call({
    String? notificationID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Increment Notification View',
      apiUrl:
          '${BaseUrlGroup.baseUrl}/notifications/increment-view/${notificationID}',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuizByIdCall {
  Future<ApiCallResponse> call({
    String? quizzId = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Quiz By Id',
      apiUrl: '${BaseUrlGroup.baseUrl}/quizzes/${quizzId}/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class GetTrainingByIdCall {
  Future<ApiCallResponse> call({
    String? trainingId = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Training By Id',
      apiUrl: '${BaseUrlGroup.baseUrl}/trainings/${trainingId}/${userId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

/// End BASE URL Group Code

class GetTrainingListCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GET TRAINING LIST',
      apiUrl: 'https://quizback.algorixdev.com/api/trainings/${userID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? trainingsData(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
