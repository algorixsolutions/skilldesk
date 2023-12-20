import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/grid_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'home_copy_model.dart';
export 'home_copy_model.dart';

class HomeCopyWidget extends StatefulWidget {
  const HomeCopyWidget({Key? key}) : super(key: key);

  @override
  _HomeCopyWidgetState createState() => _HomeCopyWidgetState();
}

class _HomeCopyWidgetState extends State<HomeCopyWidget> {
  late HomeCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeCopyModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
        final homeCopyHomeInfosResponse = snapshot.data!;
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
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
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
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        border: Border.all(
                                          color: Color(0xFFBEBEBE),
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 9.0, 0.0, 0.0),
                                                child: Text(
                                                  BaseUrlGroup.homeInfosCall
                                                      .myXP(
                                                        homeCopyHomeInfosResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 9.0),
                                                child: Text(
                                                  'Xp',
                                                  style: GoogleFonts.getFont(
                                                    'Inter',
                                                    color: Color(0xFFACACAC),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 9.0, 0.0, 0.0),
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
                                                      BaseUrlGroup.homeInfosCall
                                                          .myRank(
                                                            homeCopyHomeInfosResponse
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
                                                            homeCopyHomeInfosResponse
                                                                .jsonBody,
                                                          ).toString()}',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            fontSize: 11.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 9.0),
                                                  child: Text(
                                                    'Ranked',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      color: Color(0xFFACACAC),
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
                                            .divide(SizedBox(width: 10.0))
                                            .around(SizedBox(width: 10.0)),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
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
                                      child: Icon(
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
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Color(0xFFBEBEBE),
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        31.0, 13.0, 0.0, 0.0),
                                    child: Container(
                                      width: 7.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7BEFF),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
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
                            padding: EdgeInsets.all(20.0),
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
                                        backgroundColor: Color(0xFFD9D9D9),
                                        barRadius: Radius.circular(12.0),
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
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.totaltime(
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
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
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ) /
                                            BaseUrlGroup.homeInfosCall.nbQuiz(
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ),
                                        lineHeight: 8.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .quizColor,
                                        backgroundColor: Color(0xFFD9D9D9),
                                        barRadius: Radius.circular(12.0),
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
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.nbQuiz(
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
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
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ) /
                                            BaseUrlGroup.homeInfosCall
                                                .nbTrainings(
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ),
                                        lineHeight: 8.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .trainingColor,
                                        backgroundColor: Color(0xFFD9D9D9),
                                        barRadius: Radius.circular(12.0),
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
                                                EdgeInsetsDirectional.fromSTEB(
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
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()} / ${BaseUrlGroup.homeInfosCall.nbTrainings(
                                              homeCopyHomeInfosResponse
                                                  .jsonBody,
                                            ).toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge,
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 4.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('quiz_list');
                            },
                            text: 'Quizes list',
                            options: FFButtonOptions(
                              width: 167.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF39B6FF),
                              textStyle: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('training_list');
                            },
                            text: 'Training list',
                            options: FFButtonOptions(
                              width: 167.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF725DFF),
                              textStyle: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              elevation: 3.0,
                              borderSide: BorderSide(
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
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                          fontFamily: 'SF Pro Display Bold',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              children: [
                                if (!functions
                                    .isListNull(BaseUrlGroup.homeInfosCall
                                        .inProgress(
                                          homeCopyHomeInfosResponse.jsonBody,
                                        )!
                                        .toList()))
                                  Container(
                                    width: double.infinity,
                                    height: 230.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Builder(
                                      builder: (context) {
                                        final inProgress =
                                            BaseUrlGroup.homeInfosCall
                                                    .inProgress(
                                                      homeCopyHomeInfosResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: inProgress.length,
                                          itemBuilder:
                                              (context, inProgressIndex) {
                                            final inProgressItem =
                                                inProgress[inProgressIndex];
                                            return GridCardWidget(
                                              key: Key(
                                                  'Keyrkp_${inProgressIndex}_of_${inProgress.length}'),
                                              progression: getJsonField(
                                                inProgressItem,
                                                r'''$.percentage''',
                                              ),
                                              jsonItem: inProgressItem,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                if (functions
                                    .isListNull(BaseUrlGroup.homeInfosCall
                                        .inProgress(
                                          homeCopyHomeInfosResponse.jsonBody,
                                        )!
                                        .toList()))
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      'No quiz or training  in progress.',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge,
                                    ),
                                  ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                          fontFamily: 'SF Pro Display Bold',
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: false,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: BaseUrlGroup.getThemesCall.call(
                                userID: currentUserUid,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final stackGetThemesResponse = snapshot.data!;
                                return Stack(
                                  children: [
                                    if (!functions.isListNull(
                                        stackGetThemesResponse.jsonBody))
                                      Container(
                                        width: double.infinity,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            final themes =
                                                stackGetThemesResponse.jsonBody
                                                    .toList();
                                            return ListView.separated(
                                              padding: EdgeInsets.fromLTRB(
                                                20.0,
                                                0,
                                                0,
                                                0,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: themes.length,
                                              separatorBuilder: (_, __) =>
                                                  SizedBox(width: 20.0),
                                              itemBuilder:
                                                  (context, themesIndex) {
                                                final themesItem =
                                                    themes[themesIndex];
                                                return Material(
                                                  color: Colors.transparent,
                                                  elevation: 3.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Container(
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          valueOrDefault<Color>(
                                                        random_data
                                                            .randomColor(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .quizColor,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      border: Border.all(
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Text(
                                                          getJsonField(
                                                            themesItem,
                                                            r'''$.label''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display Bold',
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
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    if (functions.isListNull(
                                        stackGetThemesResponse.jsonBody))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          'No themes available. ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ),
                                  ],
                                );
                              },
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
