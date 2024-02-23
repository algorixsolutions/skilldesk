import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/empty_list_text_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultAllTrainings = await BaseUrlGroup.getTrainingsCall.call(
        userID: '01hk04qa10hpm4fjh2e0yym7ee',
      );
      _model.apiResultAllQuizz = await BaseUrlGroup.getQuizzesCall.call(
        userID: currentUserUid,
      );
      if ((_model.apiResultAllTrainings?.succeeded ?? true) &&
          (_model.apiResultAllQuizz?.succeeded ?? true)) {
        _model.allTrainings = (_model.apiResultAllTrainings?.jsonBody ?? '')
            .toList()
            .cast<dynamic>();
        _model.allQuizz =
            (_model.apiResultAllQuizz?.jsonBody ?? '').toList().cast<dynamic>();
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return WebViewAware(
              child: AlertDialog(
                title: const Text('Error while fetching quiz and training lists'),
                content: Text(
                    '${(_model.apiResultAllTrainings?.jsonBody ?? '').toString()}and ${(_model.apiResultAllQuizz?.jsonBody ?? '').toString()}'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            );
          },
        );
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: BaseUrlGroup.homeInfosCall.call(
        userID: currentUserUid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final homeHomeInfosResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Container(
                      height: 52.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('settings_menu');
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/8679856_menu_2_fill_icon.jpg',
                                      width: 24.0,
                                      height: 24.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('users_ranking');
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: const Color(0xFFBEBEBE),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 22.91,
                                              height: 34.91,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/12-Champion.svg',
                                                  width: 22.91,
                                                  height: 34.91,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 9.0, 0.0, 0.0),
                                                  child: Text(
                                                    BaseUrlGroup.homeInfosCall
                                                        .myXP(
                                                          homeHomeInfosResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 9.0),
                                                  child: Text(
                                                    'Xp',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color: const Color(0xFFACACAC),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 11.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 9.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        BaseUrlGroup
                                                            .homeInfosCall
                                                            .myRank(
                                                              homeHomeInfosResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' / ${BaseUrlGroup.homeInfosCall.totalUsers(
                                                              homeHomeInfosResponse
                                                                  .jsonBody,
                                                            ).toString()}',
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              fontFamily:
                                                                  'SF Pro Display',
                                                              fontSize: 11.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 9.0),
                                                    child: Text(
                                                      'Ranked',
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Inter',
                                                        color:
                                                            const Color(0xFFACACAC),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ]
                                              .divide(const SizedBox(width: 10.0))
                                              .around(const SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed('message_list');
                                        },
                                        child: const Icon(
                                          Icons.email,
                                          color: Color(0xFF725DFF),
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('notifications_page');
                                      },
                                      child: const Icon(
                                        Icons.notifications_rounded,
                                        color: Color(0xFF725DFF),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: const Color(0xFFBEBEBE),
                          width: 1.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        13.0, 13.0, 0.0, 0.0),
                                    child: Container(
                                      width: 24.0,
                                      height: 24.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                          'assets/images/Iconly-Bulk-Activity.jpg',
                                          width: 24.0,
                                          height: 24.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        31.0, 13.0, 0.0, 0.0),
                                    child: Container(
                                      width: 7.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFC7BEFF),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    7.0, 15.91, 0.0, 0.0),
                                child: Text(
                                  'Overview',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display Bold',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LinearPercentIndicator(
                                        percent: 0.2,
                                        lineHeight: 8.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryText,
                                        backgroundColor: const Color(0xFFD9D9D9),
                                        barRadius: const Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 12.0,
                                            height: 12.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'learning time',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${BaseUrlGroup.homeInfosCall.myLearningTime(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.totaltime(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LinearPercentIndicator(
                                        percent: BaseUrlGroup.homeInfosCall
                                                .nbQuizCompleted(
                                              homeHomeInfosResponse.jsonBody,
                                            ) /
                                            BaseUrlGroup.homeInfosCall.nbQuiz(
                                              homeHomeInfosResponse.jsonBody,
                                            ),
                                        lineHeight: 8.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .quizColor,
                                        backgroundColor: const Color(0xFFD9D9D9),
                                        barRadius: const Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 12.0,
                                            height: 12.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .quizColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Quiz',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${BaseUrlGroup.homeInfosCall.nbQuizCompleted(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.nbQuiz(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LinearPercentIndicator(
                                        percent: BaseUrlGroup.homeInfosCall
                                                .nbTrainingCompleted(
                                              homeHomeInfosResponse.jsonBody,
                                            ) /
                                            BaseUrlGroup.homeInfosCall
                                                .nbTrainings(
                                              homeHomeInfosResponse.jsonBody,
                                            ),
                                        lineHeight: 8.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .trainingColor,
                                        backgroundColor: const Color(0xFFD9D9D9),
                                        barRadius: const Radius.circular(12.0),
                                        padding: EdgeInsets.zero,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: 12.0,
                                            height: 12.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .trainingColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Training',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${BaseUrlGroup.homeInfosCall.nbTrainingCompleted(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.nbTrainings(
                                              homeHomeInfosResponse.jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(const SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 4.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('quiz_list');
                            },
                            text: 'Quizes list',
                            options: FFButtonOptions(
                              width: 167.0,
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF39B6FF),
                              textStyle: const TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('training_list');
                            },
                            text: 'Training list',
                            options: FFButtonOptions(
                              width: 167.0,
                              height: 35.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF725DFF),
                              textStyle: const TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.32, 0.0, 11.68),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'In Progress',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 230.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Builder(
                                builder: (context) {
                                  final inProgress = BaseUrlGroup.homeInfosCall
                                          .inProgress(
                                            homeHomeInfosResponse.jsonBody,
                                          )
                                          ?.toList() ??
                                      [];
                                  if (inProgress.isEmpty) {
                                    return const EmptyListTextWidget(
                                      item: 'quiz or training  in progress',
                                    );
                                  }
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: inProgress.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(width: 20.0),
                                    itemBuilder: (context, inProgressIndex) {
                                      final inProgressItem =
                                          inProgress[inProgressIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (functions.compareString(
                                              getJsonField(
                                                inProgressItem,
                                                r'''$.type''',
                                              ).toString(),
                                              'quiz')) {
                                            _model.apiResult03s =
                                                await BaseUrlGroup
                                                    .getQuizByIdCall
                                                    .call(
                                              quizzId: getJsonField(
                                                inProgressItem,
                                                r'''$.id''',
                                              ).toString(),
                                              userId: currentUserUid,
                                            );
                                            if ((_model
                                                    .apiResult03s?.succeeded ??
                                                true)) {
                                              context.pushNamed(
                                                'quiz_details',
                                                queryParameters: {
                                                  'quiz': serializeParam(
                                                    getJsonField(
                                                      (_model.apiResult03s
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                  'allQuiz': serializeParam(
                                                    _model.allQuizz,
                                                    ParamType.JSON,
                                                    true,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Error while fetching item'),
                                                      content: Text((_model
                                                                  .apiResult03s
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString()),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          } else {
                                            _model.apiResult1tp =
                                                await BaseUrlGroup
                                                    .getTrainingByIdCall
                                                    .call(
                                              trainingId: getJsonField(
                                                inProgressItem,
                                                r'''$.id''',
                                              ).toString(),
                                              userId: currentUserUid,
                                            );
                                            if ((_model
                                                    .apiResult1tp?.succeeded ??
                                                true)) {
                                              context.pushNamed(
                                                'training_details',
                                                queryParameters: {
                                                  'training': serializeParam(
                                                    getJsonField(
                                                      (_model.apiResult1tp
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data''',
                                                    ),
                                                    ParamType.JSON,
                                                  ),
                                                  'allTrainings':
                                                      serializeParam(
                                                    _model.allTrainings,
                                                    ParamType.JSON,
                                                    true,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Error while fetching item'),
                                                      content: Text((_model
                                                                  .apiResult1tp
                                                                  ?.jsonBody ??
                                                              '')
                                                          .toString()),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: const Text('Ok'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            }
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: 152.0,
                                          height: 230.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            border: Border.all(
                                              color: const Color(0xFFBEBEBE),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.network(
                                                      functions.getImageUrl(getJsonField(
                                                            inProgressItem,
                                                            r'''$.cover''',
                                                          ).toString(), getJsonField(
                                                            inProgressItem,
                                                            r'''$.type''',
                                                          ).toString(), FFAppState().IMAGEURL),
                                                      width: 126.0,
                                                      height: 89.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        13.0, 10.52, 0.0, 0.0),
                                                child: Text(
                                                  getJsonField(
                                                    inProgressItem,
                                                    r'''$.title''',
                                                  ).toString(),
                                                  maxLines: 2,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          13.0, 8.89, 0.0, 0.0),
                                                  child: Text(
                                                    functions.removeHtmlTags(
                                                        getJsonField(
                                                      inProgressItem,
                                                      r'''$.short_description''',
                                                    ).toString()),
                                                    maxLines: 2,
                                                    style: const TextStyle(
                                                      color: Color(0xFFACACAC),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Stack(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                children: [
                                                  if (functions.stringToDouble(
                                                          getJsonField(
                                                        inProgressItem,
                                                        r'''$.percentage''',
                                                      ).toString()) >=
                                                      0.0)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.89,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'You Completed ${getJsonField(
                                                                inProgressItem,
                                                                r'''$.percentage''',
                                                              ).toString()} %',
                                                              style: const TextStyle(
                                                                fontFamily:
                                                                    'SF Pro Display Bold',
                                                                color: Color(
                                                                    0xFF110C2C),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 11.0,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        7.6,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                LinearPercentIndicator(
                                                              percent:
                                                                  valueOrDefault<
                                                                      double>(
                                                                getJsonField(
                                                                      inProgressItem,
                                                                      r'''$.percentage''',
                                                                    ) /
                                                                    100,
                                                                0.0,
                                                              ),
                                                              width: 98.47,
                                                              lineHeight: 6.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                functions
                                                                        .compareString(
                                                                            getJsonField(
                                                                              inProgressItem,
                                                                              r'''$.type''',
                                                                            )
                                                                                .toString(),
                                                                            'quiz')
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .quizColor
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .trainingColor,
                                                                Colors.white,
                                                              ),
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                              center: Text(
                                                                '${getJsonField(
                                                                  inProgressItem,
                                                                  r'''$.percentage''',
                                                                ).toString()} %',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall,
                                                              ),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      4.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (functions.compareString(
                                                      getJsonField(
                                                        inProgressItem,
                                                        r'''$.status''',
                                                      ).toString(),
                                                      'PENDING'))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 20.0,
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  inProgressItem,
                                                                  r'''$.published_at''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (functions.compareString(
                                                          getJsonField(
                                                            inProgressItem,
                                                            r'''$.status''',
                                                          ).toString(),
                                                          'PUBLISHED') &&
                                                      (getJsonField(
                                                            inProgressItem,
                                                            r'''$.percentage''',
                                                          ) ==
                                                          null))
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  13.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () {
                                                          print(
                                                              'Button pressed ...');
                                                        },
                                                        text: 'Start now',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 126.0,
                                                          height: 30.0,
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              const Color(0xFFF8F7FE),
                                                          textStyle: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .trainingColor,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 11.0,
                                                          ),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 48.23, 0.0, 11.68),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Training Themes',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState().getThemes(
                                  uniqueQueryKey: currentUserUid,
                                  requestFn: () =>
                                      BaseUrlGroup.getThemesCall.call(
                                    userID: currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final listViewGetThemesResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final themes = listViewGetThemesResponse
                                          .jsonBody
                                          .toList();
                                      if (themes.isEmpty) {
                                        return const EmptyListTextWidget(
                                          item: 'themes',
                                        );
                                      }
                                      return ListView.separated(
                                        padding: const EdgeInsets.fromLTRB(
                                          20.0,
                                          0,
                                          0,
                                          0,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: themes.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(width: 20.0),
                                        itemBuilder: (context, themesIndex) {
                                          final themesItem =
                                              themes[themesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              FFAppState().selectedQuizLabel =
                                                  getJsonField(
                                                themesItem,
                                                r'''$.label''',
                                              ).toString();

                                              context
                                                  .pushNamed('training_list');
                                            },
                                            child: Material(
                                              color: Colors.transparent,
                                              elevation: 3.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Container(
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: colorFromCssString(
                                                    FFAppState().ThemeColors[
                                                        random_data
                                                            .randomInteger(
                                                                0, 8)],
                                                    defaultColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .trainingColor,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        themesItem,
                                                        r'''$.label''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
