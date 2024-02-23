import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'training_details_model.dart';
export 'training_details_model.dart';

class TrainingDetailsWidget extends StatefulWidget {
  const TrainingDetailsWidget({
    super.key,
    required this.training,
    this.allTrainings,
  });

  final dynamic training;
  final List<dynamic>? allTrainings;

  @override
  State<TrainingDetailsWidget> createState() => _TrainingDetailsWidgetState();
}

class _TrainingDetailsWidgetState extends State<TrainingDetailsWidget> {
  late TrainingDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              wrapWithModel(
                                model: _model.customAppbarModel,
                                updateCallback: () => setState(() {}),
                                child: CustomAppbarWidget(
                                  parameter1: getJsonField(
                                    widget.training,
                                    r'''$.title''',
                                  ).toString(),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '${getJsonField(
                                    widget.training,
                                    r'''$.progress''',
                                  ).toString()}% Completed',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: LinearPercentIndicator(
                                  percent:
                                      functions.calculateProgress(getJsonField(
                                    widget.training,
                                    r'''$.progress''',
                                  )),
                                  lineHeight: 9.0,
                                  animation: true,
                                  animateFromLastPercent: true,
                                  progressColor: const Color(0xFF725DFF),
                                  backgroundColor: const Color(0xFFF5F5F5),
                                  barRadius: const Radius.circular(20.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                              Stack(
                                children: [
                                  if (getJsonField(
                                        widget.training,
                                        r'''$.cover''',
                                      ) ==
                                      getJsonField(
                                        FFAppState().quizStatus,
                                        r'''$.null''',
                                      ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: SvgPicture.asset(
                                        'assets/images/training.a4ae0304.svg',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 199.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  if (getJsonField(
                                        widget.training,
                                        r'''$.cover''',
                                      ) !=
                                      getJsonField(
                                        FFAppState().quizStatus,
                                        r'''$.null''',
                                      ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14.0),
                                      child: Image.network(
                                        '${FFAppState().IMAGEURL}${getJsonField(
                                          widget.training,
                                          r'''$.cover''',
                                        ).toString()}',
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 199.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.access_time_sharp,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.training,
                                                r'''$.duration''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.bookOpen,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.training,
                                                r'''$.number_chapter''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FFIcons.ketoileIconeArtboard301,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: AutoSizeText(
                                              getJsonField(
                                                widget.training,
                                                r'''$.number_xp''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 34.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(61.0),
                                      border: Border.all(
                                        color: const Color(0xFFF5F5F5),
                                      ),
                                    ),
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            FFIcons.kenergyIcone01,
                                            color: Colors.black,
                                            size: 18.0,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    4.0, 2.0, 0.0, 0.0),
                                            child: Text(
                                              getJsonField(
                                                widget.training,
                                                r'''$.label_level''',
                                              ).toString(),
                                              style: const TextStyle(
                                                fontFamily: 'SF Pro Display',
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 70.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Html(
                                          data: getJsonField(
                                            widget.training,
                                            r'''$.description''',
                                          ).toString(),
                                          onLinkTap: (url, _, __, ___) =>
                                              launchURL(url!),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(height: 20.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (getJsonField(
                                widget.training,
                                r'''$.prior_training''',
                              ) ==
                              null) {
                            context.pushNamed(
                              'training_chapters',
                              queryParameters: {
                                'training': serializeParam(
                                  widget.training,
                                  ParamType.JSON,
                                ),
                              }.withoutNulls,
                            );

                            return;
                          } else {
                            if (functions.isPriorTrainingCompleted(
                                widget.allTrainings!.toList(),
                                getJsonField(
                                  widget.training,
                                  r'''$.prior_training''',
                                ))) {
                              context.pushNamed(
                                'training_chapters',
                                queryParameters: {
                                  'training': serializeParam(
                                    widget.training,
                                    ParamType.JSON,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please complete ${getJsonField(
                                      widget.training,
                                      r'''$.prior_training.title''',
                                    ).toString()} first',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            }

                            return;
                          }
                        },
                        text: 'Continue',
                        options: FFButtonOptions(
                          width: 342.0,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'SF Pro Display',
                                    color: Colors.white,
                                    useGoogleFonts: false,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
