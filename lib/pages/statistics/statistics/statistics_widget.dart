import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'statistics_model.dart';

export 'statistics_model.dart';

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({super.key});

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  late StatisticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String themeId = '';
  String themeName = '';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticsModel());
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
    final chartPieChartColorsList2 = [
      const Color(0xFF725DFF),
      const Color(0xFF00D1FF)
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: BaseUrlGroup.getUserStatsCall.call(
              userID: currentUserUid,
              period: _model.choiceChipsValue,
              themeID: themeId,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final stackGetUserStatsResponse = snapshot.data!;
              print(stackGetUserStatsResponse.response?.body);
              return Stack(
                children: [
                  //* Bottom
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 220.0, 0.0, 0.0),
                                  child: Container(
                                    width: 341.74,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: const Color(0xFFE6E6E6),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: const AlignmentDirectional(
                                              0.00, 0.69),
                                          child: SizedBox(
                                            width: 341.0,
                                            height: 135.62,
                                            child: FlutterFlowLineChart(
                                              data: [
                                                FFLineChartData(
                                                  xData: List.generate(
                                                      random_data.randomInteger(
                                                          0, 0),
                                                      (index) => random_data
                                                          .randomName(
                                                              true, false)),
                                                  yData: List.generate(
                                                      random_data.randomInteger(
                                                          10, 30),
                                                      (index) => random_data
                                                              .randomString(
                                                            1,
                                                            10,
                                                            true,
                                                            false,
                                                            false,
                                                          )),
                                                  settings: LineChartBarData(
                                                    color:
                                                        const Color(0xFF1363DF),
                                                    barWidth: 2.0,
                                                    isCurved: true,
                                                    dotData:
                                                        FlDotData(show: false),
                                                    belowBarData: BarAreaData(
                                                      show: true,
                                                      color: const Color(
                                                          0xFFEEF4FC),
                                                    ),
                                                  ),
                                                )
                                              ],
                                              chartStylingInfo:
                                                  ChartStylingInfo(
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                showBorder: false,
                                              ),
                                              axisBounds: const AxisBounds(),
                                              xAxisLabelInfo:
                                                  const AxisLabelInfo(),
                                              yAxisLabelInfo:
                                                  const AxisLabelInfo(),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(15.69, 15.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 0.0, 21.72),
                                                child: Container(
                                                  width: 107.0,
                                                  height: 21.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Text(
                                                    'Progress',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                      height: 22.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                            0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 12.0,
                                                          height: 12.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFFD9D9D9),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'learning time',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  14.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            BaseUrlGroup
                                                                .getUserStatsCall
                                                                .myTrainingTime(
                                                                  stackGetUserStatsResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                            0.0, 12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 12.0,
                                                          height: 12.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFF725DFF),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Quiz',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  14.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                          child: Text(
                                                            BaseUrlGroup
                                                                .getUserStatsCall
                                                                .myQuizProgress(
                                                                  stackGetUserStatsResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 12.0,
                                                        height: 12.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFF00D1FF),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'training',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(14.0,
                                                                0.0, 0.0, 0.0),
                                                        child: Text(
                                                          BaseUrlGroup
                                                              .getUserStatsCall
                                                              .myTrainingProgress(
                                                                stackGetUserStatsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //* QUiz Box
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.49, 0.0, 0.0),
                            child: Container(
                              width: 342.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.49, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
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
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    final columnGetThemesResponse =
                                        snapshot.data!;
                                    final labelList =
                                        (BaseUrlGroup.getThemesCall.labelList(
                                      columnGetThemesResponse.jsonBody,
                                    ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList();
                                    final labelIdList = List<String>.from(
                                        (BaseUrlGroup.getThemesCall.idList(
                                      columnGetThemesResponse.jsonBody,
                                    ) as List)
                                            .map<String>((s) => s.toString())
                                            .toList()
                                            .map((e) => e.toString())
                                            .toList());
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 9.04, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Quiz',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          0.0, 0.0, 16.0, 0.0),
                                                  child: Container(
                                                    width: 115.0,
                                                    height: 34.0,
                                                    margin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(18.0, 0.0,
                                                            14.01, 0.0),
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFE6E6E6),
                                                      border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              17.0),
                                                    ),
                                                    child: FittedBox(
                                                      child: DropdownButton(
                                                        icon: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          size: 24.0,
                                                        ),
                                                        underline:
                                                            const SizedBox(),
                                                        items: List.generate(
                                                          labelList.length,
                                                          (index) =>
                                                              DropdownMenuItem(
                                                            value: labelIdList[
                                                                index],
                                                            child: Text(
                                                                labelList[
                                                                    index]),
                                                          ),
                                                        ),
                                                        hint: Text(
                                                          themeName.isEmpty
                                                              ? "Select Theme"
                                                              : themeName,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: GoogleFonts
                                                              .getFont(
                                                            'Inter',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            // fontSize: 14.0,
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (value != null) {
                                                            setState(() {
                                                              themeId = value;
                                                              themeName = labelList[
                                                                  labelIdList
                                                                      .indexOf(
                                                                          value)];
                                                            });
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16.0, 9.96, 16.0, 0.0),
                                          child: Container(
                                            width: 322.0,
                                            height: 45.0,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE6F1F8),
                                              borderRadius:
                                                  BorderRadius.circular(60.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(16.0,
                                                              0.0, 0.0, 0.0),
                                                      child: Text(
                                                        'Ranked',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(5.0,
                                                              0.0, 0.0, 0.0),
                                                      child: Container(
                                                        width: 75.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: const Color(
                                                              0xFF39B6FF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      46.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child: Text(
                                                            '${BaseUrlGroup.getUserStatsCall.myQuizPosition(
                                                                  stackGetUserStatsResponse
                                                                      .jsonBody,
                                                                ).toString()} position',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Inter',
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 10.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(65.0, 13.0,
                                                          19.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        BaseUrlGroup
                                                            .getUserStatsCall
                                                            .myQuizRank(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                      Text(
                                                        ' / ${BaseUrlGroup.getUserStatsCall.numOfUsers(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            ).toString()}',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12.0,
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
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Time on quiz',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizTime(
                                                          stackGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              LinearPercentIndicator(
                                                percent: 0.5,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFF725DFF),
                                                backgroundColor: Colors.black12,
                                                barRadius:
                                                    const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Score',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizScore(
                                                          stackGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              LinearPercentIndicator(
                                                percent: BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizScore(
                                                      stackGetUserStatsResponse
                                                          .jsonBody,
                                                    ) /
                                                    100,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFFFFCB00),
                                                backgroundColor: Colors.black12,
                                                barRadius:
                                                    const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  const Text(
                                                    'Quiz done',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizDone(
                                                          stackGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              LinearPercentIndicator(
                                                percent: BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizDone(
                                                      stackGetUserStatsResponse
                                                          .jsonBody,
                                                    ) /
                                                    100,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFF00D1FF),
                                                backgroundColor: Colors.black12,
                                                barRadius:
                                                    const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),

                          //* Training Box
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Container(
                              width: 342.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 2.0,
                                ),
                              ),
                              child: FutureBuilder<ApiCallResponse>(
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
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final columnGetThemesResponse =
                                      snapshot.data!;
                                  final labelList =
                                      (BaseUrlGroup.getThemesCall.labelList(
                                    columnGetThemesResponse.jsonBody,
                                  ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList();
                                  final labelIdList = List<String>.from(
                                      (BaseUrlGroup.getThemesCall.idList(
                                    columnGetThemesResponse.jsonBody,
                                  ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()
                                          .map((e) => e.toString())
                                          .toList());
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0.0, 9.04, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 6.0, 0.0, 0.0),
                                                child: Text(
                                                  'Trainings',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width: 115.0,
                                                  height: 34.0,
                                                  margin:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(18.0, 0.0,
                                                          14.01, 0.0),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFE6E6E6),
                                                    border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.0),
                                                  ),
                                                  child: FittedBox(
                                                    child: DropdownButton(
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      hint: Text(
                                                        themeName.isEmpty
                                                            ? "Select Theme"
                                                            : themeName,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          // fontSize: 14.0,
                                                        ),
                                                      ),
                                                      underline:
                                                          const SizedBox(),
                                                      items: List.generate(
                                                        labelList.length,
                                                        (index) =>
                                                            DropdownMenuItem(
                                                          value: labelIdList[
                                                              index],
                                                          child: Text(
                                                              labelList[index]),
                                                        ),
                                                      ),
                                                      onChanged: (value) {
                                                        if (value != null) {
                                                          setState(() {
                                                            themeId = value;
                                                            themeName = labelList[
                                                                labelIdList
                                                                    .indexOf(
                                                                        value)];
                                                          });
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Time on training',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingTime(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            LinearPercentIndicator(
                                              percent: 0.5,
                                              lineHeight: 8.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  const Color(0xFF725DFF),
                                              backgroundColor: Colors.black12,
                                              barRadius:
                                                  const Radius.circular(8.0),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Score',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingScore(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            LinearPercentIndicator(
                                              percent: BaseUrlGroup
                                                      .getUserStatsCall
                                                      .myTrainingScore(
                                                    stackGetUserStatsResponse
                                                        .jsonBody,
                                                  ) /
                                                  100,
                                              lineHeight: 8.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  const Color(0xFFFFCB00),
                                              backgroundColor: Colors.black12,
                                              barRadius:
                                                  const Radius.circular(8.0),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  'Trainings done',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingDone(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            LinearPercentIndicator(
                                              percent: BaseUrlGroup
                                                      .getUserStatsCall
                                                      .myTrainingDone(
                                                    stackGetUserStatsResponse
                                                        .jsonBody,
                                                  ) /
                                                  100,
                                              lineHeight: 8.0,
                                              animation: true,
                                              animateFromLastPercent: true,
                                              progressColor:
                                                  const Color(0xFF00D1FF),
                                              backgroundColor: Colors.black12,
                                              barRadius:
                                                  const Radius.circular(8.0),
                                              padding: EdgeInsets.zero,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),

                  //* Top
                  Container(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.00, 0.00),
                          child: Text(
                            'Statistics',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'SF Pro Display Bold',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.73, 0.0, 0.0),
                              child: Container(
                                width: 342.0,
                                height: 47.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(60.0),
                                  border: Border.all(
                                    color: const Color(0xFFE6E6E6),
                                    width: 2.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: const [
                                            ChipData('day'),
                                            ChipData('week'),
                                            ChipData('month')
                                          ],
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .choiceChipsValue = val?.first);
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor:
                                                const Color(0xFF39B6FF),
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            iconSize: 0.0,
                                            labelPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    31.0, 5.0, 31.0, 6.0),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          unselectedChipStyle: ChipStyle(
                                            backgroundColor: Colors.white,
                                            textStyle: GoogleFonts.getFont(
                                              'Inter',
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.0,
                                            ),
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            iconSize: 18.0,
                                            labelPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                    28.0, 8.0, 28.0, 7.0),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                          chipSpacing: 12.0,
                                          rowSpacing: 12.0,
                                          multiselect: false,
                                          initialized:
                                              _model.choiceChipsValue != null,
                                          alignment: WrapAlignment.start,
                                          controller: _model
                                                  .choiceChipsValueController ??=
                                              FormFieldController<List<String>>(
                                            ['day'],
                                          ),
                                          wrapped: false,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment:
                                  const AlignmentDirectional(0.00, -1.00),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Container(
                                  width: 342.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 342.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9F9F9),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: const Color(0xFFE6E6E6),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16.0, 0.0, 0.0, 15.0),
                                                  child: Text(
                                                    'Points Accumulated',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          10.0, 0.0, 0.0, 14.0),
                                                  child: Container(
                                                    width: 51.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF39B6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              46.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Text(
                                                        '${BaseUrlGroup.getUserStatsCall.myPointsProgress(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            ).toString()}%',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 10.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      16.0, 0.0, 16.0, 14.0),
                                              child: Text(
                                                '${BaseUrlGroup.getUserStatsCall.myPoints(
                                                      stackGetUserStatsResponse
                                                          .jsonBody,
                                                    ).toString()} Xp',
                                                style: GoogleFonts.getFont(
                                                  'Inter',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 342.0,
                                        height: 51.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          border: Border.all(
                                            color: const Color(0xFFE6E6E6),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          16.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Ranked',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFF39B6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              46.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Text(
                                                        '+ 2 Position',
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Inter',
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 10.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      116.0, 15.0, 19.0, 14.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myRank(
                                                          stackGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' / ${BaseUrlGroup.getUserStatsCall.numOfUsers(
                                                          stackGetUserStatsResponse
                                                              .jsonBody,
                                                        ).toString()}',
                                                    style: GoogleFonts.getFont(
                                                      'Inter',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12.0,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
