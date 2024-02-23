import '/components/custom_appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'training_quiz_old_model.dart';
export 'training_quiz_old_model.dart';

class TrainingQuizOldWidget extends StatefulWidget {
  const TrainingQuizOldWidget({
    super.key,
    required this.chapters,
    required this.index,
    required this.trainingId,
  });

  final List<dynamic>? chapters;
  final int? index;
  final String? trainingId;

  @override
  State<TrainingQuizOldWidget> createState() => _TrainingQuizOldWidgetState();
}

class _TrainingQuizOldWidgetState extends State<TrainingQuizOldWidget> {
  late TrainingQuizOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrainingQuizOldModel());
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
        backgroundColor: const Color(0xFFFFF80D),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.customAppbarModel,
                    updateCallback: () => setState(() {}),
                    child: CustomAppbarWidget(
                      parameter1: getJsonField(
                        widget.chapters?[widget.index!],
                        r'''$.title''',
                      ).toString(),
                      backgroundColor: const Color(0xFFFFF80D),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(),
                      child: const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 30.0, 20.0, 30.0),
                        child: Text(
                          'Now! It Is Time To Take A Quiz',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'SF Pro Display Bold',
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0,
                            height: 32.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 200.0, 0.0, 0.0),
                      child: Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: SvgPicture.asset(
                              'assets/images/Build_a_website.svg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed(
                            'quiz_detail_old',
                            queryParameters: {
                              'quiz': serializeParam(
                                getJsonField(
                                  widget.chapters?[widget.index!],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
