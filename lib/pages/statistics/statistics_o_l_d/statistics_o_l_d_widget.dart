import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'statistics_o_l_d_model.dart';
export 'statistics_o_l_d_model.dart';

class StatisticsOLDWidget extends StatefulWidget {
  const StatisticsOLDWidget({
    super.key,
    String? period,
    this.theme,
  }) : period = period ?? 'day';

  final String period;
  final String? theme;

  @override
  State<StatisticsOLDWidget> createState() => _StatisticsOLDWidgetState();
}

class _StatisticsOLDWidgetState extends State<StatisticsOLDWidget> {
  late StatisticsOLDModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticsOLDModel());
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
      future: FFAppState().getUserStats(
        uniqueQueryKey: currentUserUid,
        requestFn: () => BaseUrlGroup.getUserStatsCall.call(
          userID: currentUserUid,
          period: widget.period,
          themeID: widget.theme,
        ),
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
        final statisticsOLDGetUserStatsResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              title: Text(
                'Statistics 2',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'SF Pro Display',
                      color: FlutterFlowTheme.of(context).primaryText,
                      useGoogleFonts: false,
                    ),
              ),
              actions: const [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(60.0),
                                border: Border.all(
                                  color: const Color(0xFFE6E6E6),
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowChoiceChips(
                                  options: const [
                                    ChipData('day'),
                                    ChipData('week'),
                                    ChipData('month')
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.choiceChipsValue =
                                        val?.firstOrNull);
                                    FFAppState().clearGetUserStatsCacheKey(
                                        currentUserUid);
                                    setState(() {
                                      FFAppState().StatsPeriod =
                                          _model.choiceChipsValue!;
                                    });
                                  },
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor: const Color(0xFF39B6FF),
                                    textStyle: GoogleFonts.getFont(
                                      'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 0.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            31.0, 5.0, 31.0, 5.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor: Colors.white,
                                    textStyle: GoogleFonts.getFont(
                                      'Inter',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0,
                                    ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 12.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            28.0, 8.0, 28.0, 8.0),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  chipSpacing: 0.0,
                                  rowSpacing: 12.0,
                                  multiselect: false,
                                  initialized: _model.choiceChipsValue != null,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    ['day'],
                                  ),
                                  wrapped: false,
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF9F9F9),
                                      borderRadius: BorderRadius.circular(16.0),
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 14.0),
                                                child: Text(
                                                  'Points Accumulated',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 14.0),
                                                child: Container(
                                                  width: 51.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF39B6FF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            46.0),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '${BaseUrlGroup.getUserStatsCall.myPointsProgress(
                                                            statisticsOLDGetUserStatsResponse
                                                                .jsonBody,
                                                          ).toString()}%',
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
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
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 14.0),
                                          child: Text(
                                            '${BaseUrlGroup.getUserStatsCall.myPoints(
                                                  statisticsOLDGetUserStatsResponse
                                                      .jsonBody,
                                                ).toString()} Xp',
                                            style: const TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 51.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
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
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Ranked',
                                                style: TextStyle(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 75.0,
                                                  height: 20.0,
                                                  decoration: BoxDecoration(
                                                    color: const Color(0xFF39B6FF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            46.0),
                                                  ),
                                                  child: const Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Text(
                                                      '+ 2 Position',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
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
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 16.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                BaseUrlGroup.getUserStatsCall
                                                    .myRank(
                                                      statisticsOLDGetUserStatsResponse
                                                          .jsonBody,
                                                    )
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                              Text(
                                                ' / ${BaseUrlGroup.getUserStatsCall.numOfUsers(
                                                      statisticsOLDGetUserStatsResponse
                                                          .jsonBody,
                                                    ).toString()}',
                                                style: const TextStyle(
                                                  fontFamily:
                                                      'SF Pro Display Bold',
                                                  fontWeight: FontWeight.bold,
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
                            Container(
                              width: double.infinity,
                              height: 200.0,
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
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Progress 2',
                                      style: TextStyle(
                                        fontFamily: 'SF Pro Display Bold',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        height: 22.0,
                                      ),
                                    ),
                                    if (false)
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 20.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFFD9D9D9),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Learning time',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      BaseUrlGroup
                                                          .getUserStatsCall
                                                          .myTrainingTime(
                                                            statisticsOLDGetUserStatsResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                      style: const TextStyle(
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
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 12.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 12.0,
                                                    height: 12.0,
                                                    decoration: const BoxDecoration(
                                                      color: Color(0xFF725DFF),
                                                      shape: BoxShape.circle,
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Quiz',
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 10.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(14.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      BaseUrlGroup
                                                          .getUserStatsCall
                                                          .myQuizProgress(
                                                            statisticsOLDGetUserStatsResponse
                                                                .jsonBody,
                                                          )
                                                          .toString(),
                                                      style: const TextStyle(
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
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0xFF00D1FF),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Training',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10.0,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          14.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myTrainingProgress(
                                                          statisticsOLDGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
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
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
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
                                    16.0, 10.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(
                                            'Quiz',
                                            style: TextStyle(
                                              fontFamily: 'SF Pro Display Bold',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              height: 22.0,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: FFAppState().getThemes(
                                              uniqueQueryKey: currentUserUid,
                                              requestFn: () => BaseUrlGroup
                                                  .getThemesCall
                                                  .call(
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final themeQDropDownGetThemesResponse =
                                                  snapshot.data!;
                                              return FlutterFlowDropDown<
                                                  String>(
                                                controller: _model
                                                        .themeQDropDownValueController ??=
                                                    FormFieldController<String>(
                                                  _model.themeQDropDownValue ??=
                                                      FFAppState().StatsTheme,
                                                ),
                                                options: List<String>.from(
                                                    BaseUrlGroup.getThemesCall
                                                        .idList(
                                                          themeQDropDownGetThemesResponse
                                                              .jsonBody,
                                                        )!
                                                        .map(
                                                            (e) => e.toString())
                                                        .toList()),
                                                optionLabels: BaseUrlGroup
                                                    .getThemesCall
                                                    .labelList(
                                                  themeQDropDownGetThemesResponse
                                                      .jsonBody,
                                                )!,
                                                onChanged: (val) async {
                                                  setState(() => _model
                                                          .themeQDropDownValue =
                                                      val);
                                                  setState(() {
                                                    FFAppState().StatsTheme =
                                                        _model
                                                            .themeQDropDownValue!;
                                                  });
                                                },
                                                height: 34.0,
                                                textStyle: const TextStyle(
                                                  fontFamily: 'SF Pro Display',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12.0,
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
                                                fillColor: const Color(0xFFE6E6E6),
                                                elevation: 2.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 2.0,
                                                borderRadius: 17.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        18.0, 0.0, 18.0, 0.0),
                                                hidesUnderline: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE6F1F8),
                                          borderRadius:
                                              BorderRadius.circular(60.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text(
                                                    'Ranked',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 20.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFF39B6FF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              46.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: Text(
                                                          '${BaseUrlGroup.getUserStatsCall.myQuizPosition(
                                                                statisticsOLDGetUserStatsResponse
                                                                    .jsonBody,
                                                              ).toString()} position',
                                                          style: const TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 16.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizRank(
                                                          statisticsOLDGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    ' / ${BaseUrlGroup.getUserStatsCall.numOfUsers(
                                                          statisticsOLDGetUserStatsResponse
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
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Time on quiz',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizTime(
                                                          statisticsOLDGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 50.0)),
                                              ),
                                              LinearPercentIndicator(
                                                percent: 1.0,
                                                width: 231.0,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFF725DFF),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius: const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ].divide(const SizedBox(height: 3.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Score',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizScore(
                                                          statisticsOLDGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 50.0)),
                                              ),
                                              LinearPercentIndicator(
                                                percent: 1.0,
                                                width: 142.0,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFFFFCB00),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius: const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ].divide(const SizedBox(height: 3.0)),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Quiz done',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    BaseUrlGroup
                                                        .getUserStatsCall
                                                        .myQuizDone(
                                                          statisticsOLDGetUserStatsResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily:
                                                          'SF Pro Display Bold',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 50.0)),
                                              ),
                                              LinearPercentIndicator(
                                                percent: 1.0,
                                                width: 201.0,
                                                lineHeight: 8.0,
                                                animation: true,
                                                animateFromLastPercent: true,
                                                progressColor:
                                                    const Color(0xFF00D1FF),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .accent4,
                                                barRadius: const Radius.circular(8.0),
                                                padding: EdgeInsets.zero,
                                              ),
                                            ].divide(const SizedBox(height: 3.0)),
                                          ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 30.0, 0.0, 0.0),
                                      child: Container(
                                        width: 342.0,
                                        height: 115.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 15.0,
                                                          height: 15.0,
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
                                                            'Bad Answers',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 15.0,
                                                          height: 15.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFF39B6FF),
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
                                                            'Questions Done',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'SF Pro Display Bold',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 30.0)),
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
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 30.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .quizDefaultBorder,
                                    width: 2.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16.0, 10.0, 16.0, 10.0),
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
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const Expanded(
                                                flex: 2,
                                                child: Text(
                                                  'Trainings',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'SF Pro Display Bold',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0,
                                                    height: 22.0,
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 4,
                                                child: FutureBuilder<
                                                    ApiCallResponse>(
                                                  future:
                                                      FFAppState().getThemes(
                                                    uniqueQueryKey:
                                                        currentUserUid,
                                                    requestFn: () =>
                                                        BaseUrlGroup
                                                            .getThemesCall
                                                            .call(
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
                                                          child:
                                                              CircularProgressIndicator(
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                    Color>(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final themeTDropDownGetThemesResponse =
                                                        snapshot.data!;
                                                    return FlutterFlowDropDown<
                                                        String>(
                                                      controller: _model
                                                              .themeTDropDownValueController ??=
                                                          FormFieldController<
                                                              String>(
                                                        _model.themeTDropDownValue ??=
                                                            FFAppState()
                                                                .StatsTheme,
                                                      ),
                                                      options: List<
                                                              String>.from(
                                                          BaseUrlGroup
                                                              .getThemesCall
                                                              .idList(
                                                                themeTDropDownGetThemesResponse
                                                                    .jsonBody,
                                                              )!
                                                              .map((e) =>
                                                                  e.toString())
                                                              .toList()),
                                                      optionLabels: BaseUrlGroup
                                                          .getThemesCall
                                                          .labelList(
                                                        themeTDropDownGetThemesResponse
                                                            .jsonBody,
                                                      )!,
                                                      onChanged: (val) async {
                                                        setState(() => _model
                                                                .themeTDropDownValue =
                                                            val);
                                                        setState(() {
                                                          FFAppState()
                                                                  .StatsTheme =
                                                              _model
                                                                  .themeTDropDownValue!;
                                                        });
                                                      },
                                                      height: 34.0,
                                                      textStyle: const TextStyle(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12.0,
                                                      ),
                                                      hintText: 'Select theme',
                                                      icon: Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      fillColor:
                                                          const Color(0xFFE6E6E6),
                                                      elevation: 2.0,
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      borderWidth: 2.0,
                                                      borderRadius: 17.0,
                                                      margin:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  18.0,
                                                                  0.0),
                                                      hidesUnderline: true,
                                                      isSearchable: false,
                                                      isMultiSelect: false,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 30.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Time on training',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          BaseUrlGroup
                                                              .getUserStatsCall
                                                              .myTrainingTime(
                                                                statisticsOLDGetUserStatsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 50.0)),
                                                    ),
                                                    LinearPercentIndicator(
                                                      percent: 1.0,
                                                      width: 231.0,
                                                      lineHeight: 8.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          const Color(0xFF725DFF),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      barRadius:
                                                          const Radius.circular(8.0),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 3.0)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Score',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          BaseUrlGroup
                                                              .getUserStatsCall
                                                              .myTrainingScore(
                                                                statisticsOLDGetUserStatsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 50.0)),
                                                    ),
                                                    LinearPercentIndicator(
                                                      percent: 1.0,
                                                      width: 142.0,
                                                      lineHeight: 8.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          const Color(0xFFFFCB00),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      barRadius:
                                                          const Radius.circular(8.0),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 3.0)),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Trainings done',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                        Text(
                                                          BaseUrlGroup
                                                              .getUserStatsCall
                                                              .myTrainingDone(
                                                                statisticsOLDGetUserStatsResponse
                                                                    .jsonBody,
                                                              )
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontFamily:
                                                                'SF Pro Display Bold',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0,
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 50.0)),
                                                    ),
                                                    LinearPercentIndicator(
                                                      percent: 1.0,
                                                      width: 201.0,
                                                      lineHeight: 8.0,
                                                      animation: true,
                                                      animateFromLastPercent:
                                                          true,
                                                      progressColor:
                                                          const Color(0xFF00D1FF),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4,
                                                      barRadius:
                                                          const Radius.circular(8.0),
                                                      padding: EdgeInsets.zero,
                                                    ),
                                                  ].divide(
                                                      const SizedBox(height: 3.0)),
                                                ),
                                              ].divide(const SizedBox(height: 16.0)),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(height: 10.0)),
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
