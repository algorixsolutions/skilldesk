import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'training_details_model.dart';

export 'training_details_model.dart';

class TrainingDetailsWidget extends StatefulWidget {
  const TrainingDetailsWidget({
    Key? key,
    required this.training,
    this.allTrainings,
  }) : super(key: key);

  final dynamic training;
  final List<dynamic>? allTrainings;

  @override
  _TrainingDetailsWidgetState createState() => _TrainingDetailsWidgetState();
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
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 9.93, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 40.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Icon(
                              Icons.chevron_left,
                              color: Color(0xFF130F26),
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 84.0, 0.0),
                        child: AutoSizeText(
                          getJsonField(
                            widget.training,
                            r'''$.title''',
                          ).toString().maybeHandleOverflow(maxChars: 25),
                          style: TextStyle(
                            fontFamily: 'SF Pro Display Bold',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.09, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${getJsonField(
                          widget.training,
                          r'''$.progress''',
                        ).toString()}% Completed',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display Bold',
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 14.0, 0.0, 0.0),
                  child: LinearPercentIndicator(
                    percent: functions.calculateProgress(getJsonField(
                      widget.training,
                      r'''$.progress''',
                    )),
                    width: 334.0,
                    lineHeight: 9.0,
                    animation: true,
                    animateFromLastPercent: true,
                    progressColor: Color(0xFF725DFF),
                    backgroundColor: Color(0xFFF5F5F5),
                    barRadius: Radius.circular(20.0),
                    padding: EdgeInsets.zero,
                  ),
                ),
                Stack(
                  children: [
                    if (getJsonField(
                          FFAppState().currchapter,
                          r'''$.cover''',
                        ) ==
                        getJsonField(
                          FFAppState().quizStatus,
                          r'''$.null''',
                        ))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.64, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: SvgPicture.asset(
                            'assets/images/training.a4ae0304.svg',
                            width: 342.0,
                            height: 199.0,
                            fit: BoxFit.none,
                          ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.64, 0.0, 0.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            '${FFAppState().IMAGEURL}${getJsonField(
                              widget.training,
                              r'''$.cover''',
                            ).toString()}',
                            width: 342.0,
                            height: 199.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 21.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(61.0),
                          border: Border.all(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.access_time_sharp,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                getJsonField(
                                  widget.training,
                                  r'''$.duration''',
                                ).toString(),
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display Bold',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(61.0),
                          border: Border.all(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 0.0, 0.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.bookOpen,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                getJsonField(
                                  widget.training,
                                  r'''$.number_chapter''',
                                ).toString(),
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display Bold',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(61.0),
                          border: Border.all(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.star_border,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 0.0, 0.0),
                              child: AutoSizeText(
                                getJsonField(
                                  widget.training,
                                  r'''$.number_xp''',
                                ).toString(),
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display Bold',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 34.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(61.0),
                          border: Border.all(
                            color: Color(0xFFF5F5F5),
                          ),
                        ),
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  19.0, 0.0, 0.0, 0.0),
                              child: Icon(
                                Icons.bolt_outlined,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 2.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  widget.training,
                                  r'''$.label_level''',
                                ).toString(),
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display Bold',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                  child: Container(
                    width: double.infinity,
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Text(
                      functions.removeHtmlTags(getJsonField(
                        widget.training,
                        r'''$.description''',
                      ).toString()),
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF2F2F2F),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.00, 1.00),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF725DFF),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                lineHeight: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
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
