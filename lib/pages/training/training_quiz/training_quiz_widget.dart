import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'training_quiz_model.dart';

export 'training_quiz_model.dart';

class TrainingQuizWidget extends StatefulWidget {
  const TrainingQuizWidget({
    super.key,
    required this.chapters,
    required this.index,
    required this.trainingId,
  });

  final List<dynamic>? chapters;
  final int? index;
  final String? trainingId;

  @override
  _TrainingQuizWidgetState createState() => _TrainingQuizWidgetState();
}

class _TrainingQuizWidgetState extends State<TrainingQuizWidget> {
  late TrainingQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late String title;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingQuizModel());

    title = getJsonField(
      widget.chapters![widget.index!],
      r'''$.title''',
    );
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
        backgroundColor: const Color(0xFFFFF80D),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                      color: Color(0xFF130F26),
                      size: 24.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
              SvgPicture.asset(
                'assets/images/Build_a_website.svg',
                fit: BoxFit.cover,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Now! It Is Time To Take A Quiz',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'SF Pro Display Bold',
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (widget.chapters?.length ==
                          functions.getIndex(widget.index!)) {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('training_list');

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Hurrah! Training Completed',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: const Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                        return;
                      } else {
                        context.pushNamed(
                          'training_chapter_content',
                          queryParameters: {
                            'chapters': serializeParam(
                              widget.chapters,
                              ParamType.JSON,
                              true,
                            ),
                            'trainingId': serializeParam(
                              widget.trainingId,
                              ParamType.String,
                            ),
                            'index': serializeParam(
                              functions.getIndex(widget.index!),
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );

                        return;
                      }
                    },
                    text: 'Skip',
                    options: FFButtonOptions(
                      width: 164.0,
                      height: 50.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFFFFF80D),
                      textStyle: const TextStyle(
                        fontFamily: 'SF Pro Display Bold',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        14.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'quiz_detail',
                          queryParameters: {
                            'quiz': serializeParam(
                              getJsonField(
                                FFAppState().currchapter,
                                r'''$.quiz''',
                              ),
                              ParamType.JSON,
                            ),
                            'allQuiz': serializeParam(
                              widget.chapters,
                              ParamType.JSON,
                              true,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Take a Quiz',
                      options: FFButtonOptions(
                        width: 164.0,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: const Color(0xFF39B6FF),
                        textStyle: const TextStyle(
                          fontFamily: 'SF Pro Display Bold',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
