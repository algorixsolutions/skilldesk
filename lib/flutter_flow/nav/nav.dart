import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SignInWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SignInWidget(),
        ),
        FFRoute(
          name: 'notifications_page',
          path: '/notificationsPage',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: NotificationsPageWidget(),
          ),
        ),
        FFRoute(
          name: 'settings_menu',
          path: '/settingsMenu',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'settings_menu')
              : const NavBarPage(
                  initialPage: 'settings_menu',
                  page: SettingsMenuWidget(),
                ),
        ),
        FFRoute(
          name: 'languages',
          path: '/languages',
          builder: (context, params) => const LanguagesWidget(),
        ),
        FFRoute(
          name: 'reset_password1',
          path: '/resetPassword1',
          builder: (context, params) => const ResetPassword1Widget(),
        ),
        FFRoute(
          name: 'sign_in',
          path: '/signIn',
          builder: (context, params) => const SignInWidget(),
        ),
        FFRoute(
          name: 'reset_email_sent',
          path: '/resetEmailSent',
          builder: (context, params) => const ResetEmailSentWidget(),
        ),
        FFRoute(
          name: 'training_details',
          path: '/trainingDetails',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: TrainingDetailsWidget(
              training: params.getParam('training', ParamType.JSON),
              allTrainings: params.getParam<dynamic>(
                  'allTrainings', ParamType.JSON, true),
            ),
          ),
        ),
        FFRoute(
          name: 'training_chapters',
          path: '/trainingChapters',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: TrainingChaptersWidget(
              training: params.getParam('training', ParamType.JSON),
            ),
          ),
        ),
        FFRoute(
          name: 'training_chapter_content',
          path: '/trainingChapterContent',
          builder: (context, params) => TrainingChapterContentWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            trainingId: params.getParam('trainingId', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'training_quiz-old',
          path: '/trainingQuizOld',
          builder: (context, params) => TrainingQuizOldWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            trainingId: params.getParam('trainingId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'quiz_result',
          path: '/quizResult',
          builder: (context, params) => QuizResultWidget(
            quizId: params.getParam('quizId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'quiz_failed',
          path: '/quizFailed',
          builder: (context, params) => QuizFailedWidget(
            durations: params.getParam('durations', ParamType.String),
            correctAnswers: params.getParam('correctAnswers', ParamType.int),
            wrongAnswers: params.getParam('wrongAnswers', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'quiz_list_old',
          path: '/quizListOld',
          builder: (context, params) => const QuizListOldWidget(),
        ),
        FFRoute(
          name: 'quiz_detail_old',
          path: '/quizDetailOld',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: QuizDetailOldWidget(
              quiz: params.getParam('quiz', ParamType.JSON),
              allQuiz:
                  params.getParam<dynamic>('allQuiz', ParamType.JSON, true),
            ),
          ),
        ),
        FFRoute(
          name: 'quiz_mcq',
          path: '/quizMcq',
          builder: (context, params) => QuizMcqWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_finderror',
          path: '/quizFinderror',
          builder: (context, params) => QuizFinderrorWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_truefalse',
          path: '/quizTruefalse',
          builder: (context, params) => QuizTruefalseWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_finderror_success',
          path: '/quizFinderrorSuccess',
          builder: (context, params) => const QuizFinderrorSuccessWidget(),
        ),
        FFRoute(
          name: 'quiz_finderror_fail',
          path: '/quizFinderrorFail',
          builder: (context, params) => const QuizFinderrorFailWidget(),
        ),
        FFRoute(
          name: 'quiz_image_answer',
          path: '/quizImageAnswer',
          builder: (context, params) => QuizImageAnswerWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_finderror_fail-duplicate',
          path: '/quizFinderrorFailDuplicate',
          builder: (context, params) => const QuizFinderrorFailDuplicateWidget(),
        ),
        FFRoute(
          name: 'notifications_detail',
          path: '/notificationsDetail',
          builder: (context, params) => NotificationsDetailWidget(
            notification: params.getParam('notification', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'home_old',
          path: '/homeOld',
          builder: (context, params) => const HomeOldWidget(),
        ),
        FFRoute(
          name: 'statisticsOLD',
          path: '/statisticsOLD',
          builder: (context, params) => StatisticsOLDWidget(
            period: params.getParam('period', ParamType.String),
            theme: params.getParam('theme', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'sign_in-duplicate',
          path: '/signInDuplicate',
          builder: (context, params) => const SignInDuplicateWidget(),
        ),
        FFRoute(
          name: 'training_list',
          path: '/trainingList',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'training_list')
              : NavBarPage(
                  initialPage: 'training_list',
                  page: TrainingListWidget(
                    selectedTheme:
                        params.getParam('selectedTheme', ParamType.String),
                  ),
                ),
        ),
        FFRoute(
          name: 'training_completed',
          path: '/trainingCompleted',
          builder: (context, params) => TrainingCompletedWidget(
            durations: params.getParam('durations', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'training_quizCopy',
          path: '/trainingQuizCopy',
          builder: (context, params) => TrainingQuizCopyWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            trainingId: params.getParam('trainingId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'home')
              : const NavBarPage(
                  initialPage: 'home',
                  page: HomeWidget(),
                ),
        ),
        FFRoute(
          name: 'users_ranking',
          path: '/usersRanking',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: UsersRankingWidget(),
          ),
        ),
        FFRoute(
          name: 'support_list',
          path: '/supportList',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: SupportListWidget(),
          ),
        ),
        FFRoute(
          name: 'support_details',
          path: '/supportDetails',
          builder: (context, params) => SupportDetailsWidget(
            ticket: params.getParam('ticket', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'new_ticket',
          path: '/newTicket',
          builder: (context, params) => const NewTicketWidget(),
        ),
        FFRoute(
          name: 'message_list',
          path: '/messageList',
          builder: (context, params) => const NavBarPage(
            initialPage: '',
            page: MessageListWidget(),
          ),
        ),
        FFRoute(
          name: 'message_details',
          path: '/messageDetails',
          builder: (context, params) => MessageDetailsWidget(
            message: params.getParam('message', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'new_message',
          path: '/newMessage',
          builder: (context, params) => const NewMessageWidget(),
        ),
        FFRoute(
          name: 'Details07ClassList',
          path: '/details07ClassList',
          builder: (context, params) => const Details07ClassListWidget(),
        ),
        FFRoute(
          name: 'Details04Event',
          path: '/details04Event',
          builder: (context, params) => const Details04EventWidget(),
        ),
        FFRoute(
          name: 'training_quizCopy2',
          path: '/trainingQuizCopy2',
          builder: (context, params) => TrainingQuizCopy2Widget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            trainingId: params.getParam('trainingId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'training_quiz',
          path: '/trainingQuiz',
          builder: (context, params) => TrainingQuizWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            trainingId: params.getParam('trainingId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'quiz_list',
          path: '/quizList',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'quiz_list')
              : NavBarPage(
                  initialPage: 'quiz_list',
                  page: QuizListWidget(
                    themeID: params.getParam('themeID', ParamType.String),
                  ),
                ),
        ),
        FFRoute(
          name: 'quiz_details',
          path: '/quizDetails',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: QuizDetailsWidget(
              quiz: params.getParam('quiz', ParamType.JSON),
              allQuiz:
                  params.getParam<dynamic>('allQuiz', ParamType.JSON, true),
            ),
          ),
        ),
        FFRoute(
          name: 'quiz_mcqCopy',
          path: '/quizMcqCopy',
          builder: (context, params) => QuizMcqCopyWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_truefalseCopy',
          path: '/quizTruefalseCopy',
          builder: (context, params) => QuizTruefalseCopyWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_image_answerCopy',
          path: '/quizImageAnswerCopy',
          builder: (context, params) => QuizImageAnswerCopyWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_finderrorCopy',
          path: '/quizFinderrorCopy',
          builder: (context, params) => QuizFinderrorCopyWidget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_mcqCopy2',
          path: '/quizMcqCopy2',
          builder: (context, params) => QuizMcqCopy2Widget(
            questions:
                params.getParam<dynamic>('questions', ParamType.JSON, true),
            index: params.getParam('index', ParamType.int),
            quizId: params.getParam('quizId', ParamType.String),
            isCompleted: params.getParam('isCompleted', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'quiz_resultCopy',
          path: '/quizResultCopy',
          builder: (context, params) => QuizResultCopyWidget(
            quizId: params.getParam('quizId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'training_completed2',
          path: '/trainingCompleted2',
          builder: (context, params) => TrainingCompleted2Widget(
            durations: params.getParam('durations', ParamType.String),
            trainingId: params.getParam('trainingId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'statistics',
          path: '/statistics',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'statistics')
              : NavBarPage(
                  initialPage: 'statistics',
                  page: StatisticsWidget(
                    period: params.getParam('period', ParamType.String),
                    theme: params.getParam('theme', ParamType.String),
                  ),
                ),
        ),
        FFRoute(
          name: 'STATS',
          path: '/stats',
          builder: (context, params) => const StatsWidget(),
        ),
        FFRoute(
          name: 'statisticsCopyCopy',
          path: '/statisticsCopyCopy',
          builder: (context, params) => StatisticsCopyCopyWidget(
            period: params.getParam('period', ParamType.String),
            theme: params.getParam('theme', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'statisticsCopy',
          path: '/statisticsCopy',
          builder: (context, params) => StatisticsCopyWidget(
            period: params.getParam('period', ParamType.String),
            theme: params.getParam('theme', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'training_chapter_contentCopy',
          path: '/trainingChapterContentCopy',
          builder: (context, params) => TrainingChapterContentCopyWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            trainingId: params.getParam('trainingId', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'training_chapter_contentCopyCopy',
          path: '/trainingChapterContentCopyCopy',
          builder: (context, params) => TrainingChapterContentCopyCopyWidget(
            chapters:
                params.getParam<dynamic>('chapters', ParamType.JSON, true),
            trainingId: params.getParam('trainingId', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signIn';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Capturehij.PNG',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
