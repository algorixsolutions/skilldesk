import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'statistics_model.dart';
export 'statistics_model.dart';

class StatisticsWidget extends StatefulWidget {
  const StatisticsWidget({
    Key? key,
    String? period,
    this.theme,
  })  : this.period = period ?? 'day',
        super(key: key);

  final String period;
  final String? theme;

  @override
  _StatisticsWidgetState createState() => _StatisticsWidgetState();
}

class _StatisticsWidgetState extends State<StatisticsWidget> {
  late StatisticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    final chartPieChartColorsList2 = [Color(0xFF725DFF), Color(0xFF00D1FF)];
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
              period: widget.period,
              themeID: widget.theme,
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
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Statistic',
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 190.0, 0.0, 0.0),
                                child: Container(
                                  width: 341.74,
                                  height: 205.78,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: Color(0xFFE6E6E6),
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.69),
                                        child: Container(
                                          width: 341.0,
                                          height: 135.62,
                                          child: FlutterFlowLineChart(
                                            data: [
                                              FFLineChartData(
                                                xData: List.generate(
                                                    random_data.randomInteger(
                                                        0, 0),
                                                    (index) =>
                                                        random_data.randomName(
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
                                                  color: Color(0xFF1363DF),
                                                  barWidth: 2.0,
                                                  isCurved: true,
                                                  dotData:
                                                      FlDotData(show: false),
                                                  belowBarData: BarAreaData(
                                                    show: true,
                                                    color: Color(0xFFEEF4FC),
                                                  ),
                                                ),
                                              )
                                            ],
                                            chartStylingInfo: ChartStylingInfo(
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              showBorder: false,
                                            ),
                                            axisBounds: AxisBounds(),
                                            xAxisLabelInfo: AxisLabelInfo(),
                                            yAxisLabelInfo: AxisLabelInfo(),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.69, 15.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
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
                                                    fontWeight: FontWeight.bold,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 12.0,
                                                        height: 12.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFD9D9D9),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      Padding(
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
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                          style: TextStyle(
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
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 12.0,
                                                        height: 12.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF725DFF),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      Padding(
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
                                                                FontWeight.w600,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
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
                                                          style: TextStyle(
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
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: 12.0,
                                                      height: 12.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF00D1FF),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                    Padding(
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
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  14.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        BaseUrlGroup
                                                            .getUserStatsCall
                                                            .myTrainingProgress(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        style: TextStyle(
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.49, 0.0, 0.0),
                          child: Container(
                            width: 342.0,
                            height: 390.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: Color(0xFFE6E6E6),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
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
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 9.04, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
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
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  controller: _model
                                                          .themeQDropDownValueController ??=
                                                      FormFieldController<
                                                          String>(
                                                    _model.themeQDropDownValue ??=
                                                        widget.theme,
                                                  ),
                                                  options: List<String>.from(
                                                      (BaseUrlGroup
                                                              .getThemesCall
                                                              .idList(
                                                    columnGetThemesResponse
                                                        .jsonBody,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!
                                                          .map((e) =>
                                                              e.toString())
                                                          .toList()),
                                                  optionLabels: (BaseUrlGroup
                                                          .getThemesCall
                                                          .labelList(
                                                    columnGetThemesResponse
                                                        .jsonBody,
                                                  ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()!,
                                                  onChanged: (val) async {
                                                    setState(() => _model
                                                            .themeQDropDownValue =
                                                        val);
                                                    context.goNamed(
                                                      'statistics',
                                                      queryParameters: {
                                                        'period':
                                                            serializeParam(
                                                          _model
                                                              .choiceChipsValue,
                                                          ParamType.String,
                                                        ),
                                                        'theme': serializeParam(
                                                          _model
                                                              .themeQDropDownValue,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  width: 115.0,
                                                  height: 34.0,
                                                  textStyle:
                                                      GoogleFonts.getFont(
                                                    'Inter',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14.0,
                                                  ),
                                                  hintText: 'Select theme',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 24.0,
                                                  ),
                                                  fillColor: Color(0xFFE6E6E6),
                                                  elevation: 2.0,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  borderWidth: 2.0,
                                                  borderRadius: 17.0,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(18.0, 0.0,
                                                          14.01, 0.0),
                                                  hidesUnderline: true,
                                                  isSearchable: false,
                                                  isMultiSelect: false,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 9.96, 16.0, 0.0),
                                        child: Container(
                                          width: 322.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE6F1F8),
                                            borderRadius:
                                                BorderRadius.circular(60.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                0.0, 0.0),
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
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 75.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF39B6FF),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(46.0),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Text(
                                                          '${BaseUrlGroup.getUserStatsCall.myQuizPosition(
                                                                stackGetUserStatsResponse
                                                                    .jsonBody,
                                                              ).toString()} position',
                                                          style: GoogleFonts
                                                              .getFont(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        65.0, 13.0, 19.0, 12.0),
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
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 22.31, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.69),
                                                      child: Text(
                                                        'Time on quiz',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  100.5,
                                                                  0.0),
                                                      child: Text(
                                                        BaseUrlGroup
                                                            .getUserStatsCall
                                                            .myQuizTime(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                LinearPercentIndicator(
                                                  percent: 1.0,
                                                  width: 231.0,
                                                  lineHeight: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFF725DFF),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                  barRadius:
                                                      Radius.circular(8.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 22.31, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.69),
                                                      child: Text(
                                                        'Score',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  187.0,
                                                                  0.0),
                                                      child: Text(
                                                        BaseUrlGroup
                                                            .getUserStatsCall
                                                            .myQuizScore(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                LinearPercentIndicator(
                                                  percent: 1.0,
                                                  width: 142.0,
                                                  lineHeight: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFFFFCB00),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                  barRadius:
                                                      Radius.circular(8.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 22.31, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.69),
                                                      child: Text(
                                                        'Quiz done',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  131.0,
                                                                  0.0),
                                                      child: Text(
                                                        BaseUrlGroup
                                                            .getUserStatsCall
                                                            .myQuizDone(
                                                              stackGetUserStatsResponse
                                                                  .jsonBody,
                                                            )
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'SF Pro Display Bold',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                LinearPercentIndicator(
                                                  percent: 1.0,
                                                  width: 201.0,
                                                  lineHeight: 8.0,
                                                  animation: true,
                                                  animateFromLastPercent: true,
                                                  progressColor:
                                                      Color(0xFF00D1FF),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .accent4,
                                                  barRadius:
                                                      Radius.circular(8.0),
                                                  padding: EdgeInsets.zero,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 35.0),
                                        child: Container(
                                          width: 342.0,
                                          height: 115.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 32.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 115.0,
                                                  height: 115.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Container(
                                                    width: 382.0,
                                                    height: 230.0,
                                                    child: FlutterFlowPieChart(
                                                      data: FFPieChartData(
                                                        values: List.generate(
                                                            random_data
                                                                .randomInteger(
                                                                    0, 0),
                                                            (index) =>
                                                                random_data
                                                                    .randomName(
                                                                        false,
                                                                        true)),
                                                        colors:
                                                            chartPieChartColorsList2,
                                                        radius: [55.0],
                                                      ),
                                                      donutHoleRadius: 0.0,
                                                      donutHoleColor:
                                                          Colors.transparent,
                                                      sectionLabelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineSmall,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          55.0, 55.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 15.0,
                                                            height: 15.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF725DFF),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.74,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Bad Answers',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12.0,
                                                                height: 18.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    30.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width: 15.0,
                                                              height: 15.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF39B6FF),
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.74,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Questions Done',
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      12.0,
                                                                  height: 18.0,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Container(
                            width: 342.0,
                            height: 220.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final columnGetThemesResponse = snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 9.04, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .themeTDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.themeTDropDownValue ??=
                                                      widget.theme,
                                                ),
                                                options: List<String>.from(
                                                    (BaseUrlGroup.getThemesCall
                                                            .idList(
                                                  columnGetThemesResponse
                                                      .jsonBody,
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()!
                                                        .map(
                                                            (e) => e.toString())
                                                        .toList()),
                                                optionLabels: (BaseUrlGroup
                                                        .getThemesCall
                                                        .labelList(
                                                  columnGetThemesResponse
                                                      .jsonBody,
                                                ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .themeTDropDownValue =
                                                      val);
                                                  context.goNamed(
                                                    'statistics',
                                                    queryParameters: {
                                                      'period': serializeParam(
                                                        _model.choiceChipsValue,
                                                        ParamType.String,
                                                      ),
                                                      'theme': serializeParam(
                                                        _model
                                                            .themeTDropDownValue,
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                width: 115.0,
                                                height: 34.0,
                                                textStyle: GoogleFonts.getFont(
                                                  'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0,
                                                ),
                                                hintText: 'Select theme',
                                                icon: Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor: Color(0xFFE6E6E6),
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 2.0,
                                                borderRadius: 17.0,
                                                margin: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 14.01, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.31, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.69),
                                                child: Text(
                                                  'Time on training',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 100.5, 0.0),
                                                child: Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingTime(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          LinearPercentIndicator(
                                            percent: 1.0,
                                            width: 231.0,
                                            lineHeight: 8.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF725DFF),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            barRadius: Radius.circular(8.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.31, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.69),
                                                child: Text(
                                                  'Score',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 187.0, 0.0),
                                                child: Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingScore(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          LinearPercentIndicator(
                                            percent: 1.0,
                                            width: 142.0,
                                            lineHeight: 8.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFFFFCB00),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            barRadius: Radius.circular(8.0),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 22.31, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 2.69),
                                                child: Text(
                                                  'Trainings done',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 131.0, 0.0),
                                                child: Text(
                                                  BaseUrlGroup.getUserStatsCall
                                                      .myTrainingDone(
                                                        stackGetUserStatsResponse
                                                            .jsonBody,
                                                      )
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          LinearPercentIndicator(
                                            percent: 1.0,
                                            width: 201.0,
                                            lineHeight: 8.0,
                                            animation: true,
                                            animateFromLastPercent: true,
                                            progressColor: Color(0xFF00D1FF),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent4,
                                            barRadius: Radius.circular(8.0),
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
                        Container(
                          width: 342.0,
                          height: 10.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          width: 100.0,
                          height: 195.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        ),
                      ],
                    ),
                  if (true)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 18.73, 0.0, 0.0),
                              child: Container(
                                width: 342.0,
                                height: 47.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(60.0),
                                  border: Border.all(
                                    color: Color(0xFFE6E6E6),
                                    width: 2.0,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowChoiceChips(
                                          options: [
                                            ChipData('day'),
                                            ChipData('week'),
                                            ChipData('month')
                                          ],
                                          onChanged: (val) async {
                                            setState(() => _model
                                                .choiceChipsValue = val?.first);
                                            context.goNamed(
                                              'statistics',
                                              queryParameters: {
                                                'period': serializeParam(
                                                  _model.choiceChipsValue,
                                                  ParamType.String,
                                                ),
                                                'theme': serializeParam(
                                                  widget.theme,
                                                  ParamType.String,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          selectedChipStyle: ChipStyle(
                                            backgroundColor: Color(0xFF39B6FF),
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
                                                EdgeInsetsDirectional.fromSTEB(
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
                                                EdgeInsetsDirectional.fromSTEB(
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
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
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
                                          color: Color(0xFFF9F9F9),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          border: Border.all(
                                            color: Color(0xFFE6E6E6),
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
                                                  padding: EdgeInsetsDirectional
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 14.0),
                                                  child: Container(
                                                    width: 51.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF39B6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              46.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      52.0, 0.0, 16.0, 14.0),
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
                                            color: Color(0xFFE6E6E6),
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
                                                  padding: EdgeInsetsDirectional
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 75.0,
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF39B6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              46.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
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
                                              padding: EdgeInsetsDirectional
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
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.safePop();
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Icon(
                        Icons.chevron_left_sharp,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
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
