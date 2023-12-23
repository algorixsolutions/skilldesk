import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'grid_card_model.dart';
export 'grid_card_model.dart';

class GridCardWidget extends StatefulWidget {
  const GridCardWidget({
    Key? key,
    this.progression,
    required this.jsonItem,
  }) : super(key: key);

  final double? progression;
  final dynamic jsonItem;

  @override
  _GridCardWidgetState createState() => _GridCardWidgetState();
}

class _GridCardWidgetState extends State<GridCardWidget> {
  late GridCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GridCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (functions.compareString(
              getJsonField(
                widget.jsonItem,
                r'''$.type''',
              ).toString(),
              'quiz')) {
            context.pushNamed(
              'quiz_detail',
              queryParameters: {
                'quiz': serializeParam(
                  widget.jsonItem,
                  ParamType.JSON,
                ),
              }.withoutNulls,
            );
          } else {
            context.pushNamed(
              'training_details',
              queryParameters: {
                'training': serializeParam(
                  widget.jsonItem,
                  ParamType.JSON,
                ),
              }.withoutNulls,
            );
          }
        },
        child: Container(
          width: 152.0,
          height: 230.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Color(0xFFBEBEBE),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      '${functions.getImageUrl(getJsonField(
                            widget.jsonItem,
                            r'''$.cover''',
                          ).toString(), getJsonField(
                            widget.jsonItem,
                            r'''$.type''',
                          ).toString(), FFAppState().IMAGEURL)}',
                      width: 126.0,
                      height: 89.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(13.0, 10.52, 0.0, 0.0),
                child: Text(
                  getJsonField(
                    widget.jsonItem,
                    r'''$.title''',
                  ).toString().maybeHandleOverflow(
                        maxChars: 30,
                        replacement: '…',
                      ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display Bold',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(13.0, 8.89, 0.0, 0.0),
                  child: Text(
                    functions
                        .removeHtmlTags(getJsonField(
                          widget.jsonItem,
                          r'''$.short_description''',
                        ).toString())
                        .maybeHandleOverflow(
                          maxChars: 45,
                          replacement: '…',
                        ),
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFFACACAC),
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: AlignmentDirectional(0.0, 1.0),
                children: [
                  if (widget.progression! >= 0.0)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.89, 0.0, 0.0),
                            child: Text(
                              'You Completed ${widget.progression?.toString()} %',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display Bold',
                                color: Color(0xFF110C2C),
                                fontWeight: FontWeight.w600,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 7.6, 0.0, 0.0),
                            child: LinearPercentIndicator(
                              percent: valueOrDefault<double>(
                                widget.progression! / 100,
                                0.0,
                              ),
                              width: 98.47,
                              lineHeight: 6.0,
                              animation: true,
                              animateFromLastPercent: true,
                              progressColor: valueOrDefault<Color>(
                                functions.compareString(
                                        getJsonField(
                                          widget.jsonItem,
                                          r'''$.type''',
                                        ).toString(),
                                        'quiz')
                                    ? FlutterFlowTheme.of(context).quizColor
                                    : FlutterFlowTheme.of(context)
                                        .trainingColor,
                                Colors.white,
                              ),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              center: Text(
                                '${widget.progression?.toString()} %',
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              barRadius: Radius.circular(4.0),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (functions.compareString(
                      getJsonField(
                        widget.jsonItem,
                        r'''$.status''',
                      ).toString(),
                      'PENDING'))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.access_time_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  widget.jsonItem,
                                  r'''$.published_at''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (functions.compareString(
                          getJsonField(
                            widget.jsonItem,
                            r'''$.status''',
                          ).toString(),
                          'PUBLISHED') &&
                      (widget.progression == null))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(13.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Start now',
                        options: FFButtonOptions(
                          width: 126.0,
                          height: 30.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFFF8F7FE),
                          textStyle: TextStyle(
                            fontFamily: 'SF Pro Display Bold',
                            color: FlutterFlowTheme.of(context).trainingColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 11.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
