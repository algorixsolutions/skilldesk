import 'dart:convert';

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
  static GetTicketsCall getTicketsCall = GetTicketsCall();
  static StoreNewTicketCall storeNewTicketCall = StoreNewTicketCall();
  static StoreNewDiscussionCall storeNewDiscussionCall =
      StoreNewDiscussionCall();
  static UpdateDiscussionStatusCall updateDiscussionStatusCall =
      UpdateDiscussionStatusCall();
  static GetTicketDetailsCall getTicketDetailsCall = GetTicketDetailsCall();
  static GetTicketResponsesCall getTicketResponsesCall =
      GetTicketResponsesCall();
  static GetDiscussionResponsesCall getDiscussionResponsesCall =
      GetDiscussionResponsesCall();
  static GetTicketsCategoriesCall getTicketsCategoriesCall =
      GetTicketsCategoriesCall();
  static StoreTicketResponseCall storeTicketResponseCall =
      StoreTicketResponseCall();
  static StoreDiscussionResponseCall storeDiscussionResponseCall =
      StoreDiscussionResponseCall();
  static GetUsersRankingCall getUsersRankingCall = GetUsersRankingCall();
  static GetDiscussionsCall getDiscussionsCall = GetDiscussionsCall();

}

class HomeInfosCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Home Infos',
      apiUrl: '${BaseUrlGroup.baseUrl}/home/$userID',
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

      apiUrl: '${BaseUrlGroup.baseUrl}/quizzes/$userID',

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
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetThemesCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Themes',

      apiUrl: '${BaseUrlGroup.baseUrl}/themes/$userID',
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
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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
      apiUrl: '${BaseUrlGroup.baseUrl}/trainings/$userID',
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

      apiUrl: '${BaseUrlGroup.baseUrl}/stats/$userID/$period/$themeID',
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

          '${BaseUrlGroup.baseUrl}/quizzes/answer-question/store?duration=$duration&is_correct=$isCorrect&question_id=$questionId&quiz_id=$quizId&user_id=$userId',

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

      apiUrl: '${BaseUrlGroup.baseUrl}/notifications/$userID',

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

          '${BaseUrlGroup.baseUrl}/notifications/increment-view/$notificationID',
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

      apiUrl: '${BaseUrlGroup.baseUrl}/quizzes/$quizzId/$userId',

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

      apiUrl: '${BaseUrlGroup.baseUrl}/trainings/$trainingId/$userId',

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

class GetTicketsCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Tickets',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/$userID',
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

  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? object(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].object''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? number(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].number''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdby(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].created_by''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? createdat(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].created_at''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? category(dynamic response) => (getJsonField(
        response,
        r'''$.tickets[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? tickets(dynamic response) => getJsonField(
        response,
        r'''$.tickets''',
        true,
      ) as List?;
  List? filename(dynamic response) => getJsonField(
        response,
        r'''$.tickets[:].file_name''',
        true,
      ) as List?;
}

class StoreNewTicketCall {
  Future<ApiCallResponse> call({
    String? createdBy = '',
    String? categoryId = '',
    String? object = '',
    String? message = '',
    FFUploadedFile? file,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store New Ticket',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/store',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'created_by': createdBy,
        'category_id': categoryId,
        'object': object,
        'message': message,
        'file': file,
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

class StoreNewDiscussionCall {
  Future<ApiCallResponse> call({
    String? object = '',
    String? message = '',
    String? from = '',
    String? to = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store New Discussion',
      apiUrl: '${BaseUrlGroup.baseUrl}/discussions/store',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'from': from,
        'object': object,
        'message': message,
        'to': to,
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

class UpdateDiscussionStatusCall {
  Future<ApiCallResponse> call({
    String? discussionID = '',
    String? status = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Update Discussion Status',
      apiUrl: '${BaseUrlGroup.baseUrl}/discussions/$discussionID/update',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'status': status,
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

class GetTicketDetailsCall {
  Future<ApiCallResponse> call({
    String? ticketID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Ticket Details',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/$ticketID/show',
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

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.ticket.id''',
      );
  dynamic object(dynamic response) => getJsonField(
        response,
        r'''$.ticket.object''',
      );
  dynamic number(dynamic response) => getJsonField(
        response,
        r'''$.ticket.number''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.ticket.status''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.ticket.message''',
      );
  dynamic createdby(dynamic response) => getJsonField(
        response,
        r'''$.ticket.created_by''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.ticket.created_at''',
      );
  dynamic category(dynamic response) => getJsonField(
        response,
        r'''$.ticket.category''',
      );
}

class GetTicketResponsesCall {
  Future<ApiCallResponse> call({
    String? ticketID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Ticket Responses',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/$ticketID/responses',
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

  List? responses(dynamic response) => getJsonField(
        response,
        r'''$.responses''',
        true,
      ) as List?;
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.responses[:].id''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.responses[:].message''',
      );
  dynamic createdby(dynamic response) => getJsonField(
        response,
        r'''$.responses[:].created_by''',
      );
  dynamic createdat(dynamic response) => getJsonField(
        response,
        r'''$.responses[:].created_at''',
      );
}

class GetDiscussionResponsesCall {
  Future<ApiCallResponse> call({
    String? discussionID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Discussion Responses',
      apiUrl: '${BaseUrlGroup.baseUrl}/discussions/$discussionID/responses',
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

  List? chats(dynamic response) => getJsonField(
        response,
        r'''$.chat''',
        true,
      ) as List?;
  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].status''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].message''',
      ));
  String? createdbyid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].created_by.id''',
      ));
  String? createdbyfullname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.chat[:].created_by.full_name''',
      ));
  String? createdbyidemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].created_by.email''',
      ));
  String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chat[:].created_at''',
      ));
}

class GetTicketsCategoriesCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Tickets Categories',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/categories',
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

  List? id(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      ) as List?;
  List? title(dynamic response) => getJsonField(
        response,
        r'''$[:].title''',
        true,
      ) as List?;
}

class StoreTicketResponseCall {
  Future<ApiCallResponse> call({
    String? ticketId = '',
    String? createdBy = '',
    String? message = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store Ticket Response',
      apiUrl: '${BaseUrlGroup.baseUrl}/tickets/$ticketId/response/store',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'ticket_id': ticketId,
        'created_by': createdBy,
        'message': message,
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

class StoreDiscussionResponseCall {
  Future<ApiCallResponse> call({
    String? message = '',
    String? chatId = '',
    String? userId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Store Discussion Response ',
      apiUrl: '${BaseUrlGroup.baseUrl}/discussions/$chatId/response/store',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'chat_id': chatId,
        'user_id': userId,
        'message': message,
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

class GetUsersRankingCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Users Ranking',
      apiUrl: '${BaseUrlGroup.baseUrl}/users/ranking/$userID',
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

  List? users(dynamic response) => getJsonField(
        response,
        r'''$.users''',
        true,
      ) as List?;
  List? id(dynamic response) => getJsonField(
        response,
        r'''$.users[:].id''',
        true,
      ) as List?;
  List? fullname(dynamic response) => getJsonField(
        response,
        r'''$.users[:].full_name''',
        true,
      ) as List?;
  List? email(dynamic response) => getJsonField(
        response,
        r'''$.users[:].email''',
        true,
      ) as List?;
  List? points(dynamic response) => getJsonField(
        response,
        r'''$.users[:].points''',
        true,
      ) as List?;
  List? rank(dynamic response) => getJsonField(
        response,
        r'''$.users[:].rank''',
        true,
      ) as List?;
}

class GetDiscussionsCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Discussions',
      apiUrl: '${BaseUrlGroup.baseUrl}/discussions/$userID',
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

  String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].id''',
      ));
  String? object(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].object''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].message''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].status''',
      ));
  String? createdat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].created_at''',
      ));
  String? updatedat(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].updated_at''',
      ));
  List? chats(dynamic response) => getJsonField(
        response,
        r'''$.chats''',
        true,
      ) as List?;
  String? createdbyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].created_by.id''',
      ));
  String? createdbyFullname(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.chats[:].created_by.full_name''',
      ));
  String? createdbyEmail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].created_by.email''',
      ));
  String? toID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].to.id''',
      ));
  String? tofullname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].to.full_name''',
      ));
  String? toemail(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.chats[:].to.email''',
      ));
}

/// End BASE URL Group Code

class GetTrainingListCall {
  static Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GET TRAINING LIST',

      apiUrl: 'https://quizback.algorixdev.com/api/trainings/$userID',

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
