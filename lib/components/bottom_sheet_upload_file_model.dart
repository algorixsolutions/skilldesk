import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_sheet_upload_file_widget.dart' show BottomSheetUploadFileWidget;
import 'package:flutter/material.dart';

class BottomSheetUploadFileModel
    extends FlutterFlowModel<BottomSheetUploadFileWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
