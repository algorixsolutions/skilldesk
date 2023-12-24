import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_message_widget.dart' show NewMessageWidget;
import 'package:flutter/material.dart';

class NewMessageModel extends FlutterFlowModel<NewMessageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownTo widget.
  String? dropDownToValue;
  FormFieldController<String>? dropDownToValueController;
  // State field(s) for TextFieldObject widget.
  FocusNode? textFieldObjectFocusNode;
  TextEditingController? textFieldObjectController;
  String? Function(BuildContext, String?)? textFieldObjectControllerValidator;
  String? _textFieldObjectControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextMessage widget.
  FocusNode? textMessageFocusNode;
  TextEditingController? textMessageController;
  String? Function(BuildContext, String?)? textMessageControllerValidator;
  String? _textMessageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Store New Discussion)] action in Button widget.
  ApiCallResponse? apiResultja4;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textFieldObjectControllerValidator = _textFieldObjectControllerValidator;
    textMessageControllerValidator = _textMessageControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldObjectFocusNode?.dispose();
    textFieldObjectController?.dispose();

    textMessageFocusNode?.dispose();
    textMessageController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
