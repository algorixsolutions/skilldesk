import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool compareString(
  String inputString1,
  String inputString2,
) {
  return inputString1 == inputString2;
}

bool isListNull(List<dynamic> listVar) {
  // test if list is null
  return listVar == null || listVar.isEmpty;
}

String removeHtmlTags(String inputString) {
  // remove html tags from string
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  String outputString = inputString.replaceAll(exp, '');
  return outputString;
}

String getImageUrl(
  String? cover,
  String? typeItem,
  String baseurl,
) {
  String outputUrl;
  if (cover == null || cover.isEmpty) {
    if (typeItem == 'quiz')
      outputUrl =
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/skilldesk-gh5vkj/assets/4dpxu1jqyjp1/quiz.9760d3c2.svg';
    else
      outputUrl =
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/skilldesk-gh5vkj/assets/gbx5x5tghj5j/training.a4ae0304.svg';
  } else {
    outputUrl = '$baseurl/$cover';
  }

  return outputUrl;
}

String getQuizCoverImage(
  String baseUrl,
  String imageUrl,
) {
  return baseUrl + imageUrl;
}

double calculateProgress(int? progress) {
  if (progress != null) {
    return progress / 100;
  } else {
    return 0;
  }
}

bool checkSelectedValue(String? selectedLabel) {
  if (selectedLabel != null || selectedLabel!.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool matchValue(
  String selectedLabel,
  String listLabel,
) {
  if (listLabel.toString().toLowerCase == selectedLabel.toLowerCase) {
    return true;
  } else {
    return false;
  }
}

bool isTextFieldEmpty(String? search) {
  if (search == null || search.isEmpty) {
    return true;
  } else {
    return false;
  }
}

int getIndex(int currIndex) {
  return currIndex + 1;
}

bool isValuePresent(
  List<int> ans,
  int item,
) {
  if (ans.contains(item)) {
    return true;
  } else {
    return false;
  }
}

bool isAnswersValidate(
  dynamic correctNo,
  int totalAns,
) {
  if (correctNo == totalAns) {
    return true;
  } else {
    return false;
  }
}

bool isAnswerCorrect(
  List<dynamic> answers,
  List<int> selectAnswer,
) {
  for (int i in selectAnswer) {
    if (answers[i]['correct'] != 1) {
      return false; // it will return even if one of the selected answer is not correct
    }
  }

  return true;
}

bool isSelectedIdexCorrect(
  List<dynamic> list,
  int index,
) {
  if (list[index]['correct'] == 1) {
    return true;
  } else {
    return false;
  }
}

bool isValueSelected(String? value) {
  if (value != null && value.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isContainsLabelTxtField(
  String txt,
  String label,
) {
  if (label.contains(txt)) {
    return true;
  } else {
    return false;
  }
}

String getDuration(
  DateTime startTime,
  DateTime endTime,
) {
  final difference = endTime.difference(startTime);

  final seconds = difference.inSeconds % 60;
  final minute = difference.inMinutes % 60;

  String min =
      minute.toInt() < 10 ? "0${minute.toInt()}" : minute.toInt().toString();
  String sec =
      seconds.toInt() < 10 ? "0${seconds.toInt()}" : seconds.toInt().toString();

  return "$min:$sec";
}

bool isQuizSuccess(
  int validateQuestions,
  int minCorrAnsToPass,
) {
  if (validateQuestions >= minCorrAnsToPass) {
    return true;
  } else {
    return false;
  }
}

bool isQuizHaveQuestions(List<dynamic> questions) {
  if (questions.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

int calculateWrongAnswers(
  List<dynamic> totalQuestions,
  int correctAnswers,
) {
  return totalQuestions.length - correctAnswers;
}

int getCountdownTimer(String duration) {
  final min = duration.split(':')[0];
  final sec = duration.split(':')[1];

  return ((int.parse(min) * 60 * 1000) + (int.parse(sec) * 1000)).toInt();
}

String calculateNotifDuration(String publishAt) {
  String response = '';
  int daydiffer = DateTime.now().difference(DateTime.parse(publishAt)).inDays;
  if (daydiffer < 1) {
    int hourDiffer =
        DateTime.now().difference(DateTime.parse(publishAt)).inHours;
    response = '$hourDiffer Hours ago';
  } else {
    response = '$daydiffer Days ago';
  }
  return response;
}

bool isPriorTrainingCompleted(
  List<dynamic> trainings,
  dynamic priorTraining,
) {
  bool response = false;
  int index = trainings.indexWhere(
    (element) => element['id'] == priorTraining['id'],
  );
  if (trainings[index]['progress'] == 100) {
    response = true;
  } else {
    response = false;
  }
  return response;
}

bool isExplanationNotEmpty(String? explain) {
  if (explain != null && explain.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

bool isCurrQuestionCompleted(dynamic question) {
  if (question['status_by_user'] == 'completed') {
    return true;
  } else {
    return false;
  }
}

int getCountDownTImerForChapter(String duration) {
  final hours = duration.split(':')[0];
  final min = duration.split(':')[1];
  final sec = duration.split(':')[2];

  return ((int.parse(hours) * 60 * 1000) +
          (int.parse(min) * 60 * 1000) +
          (int.parse(sec) * 1000))
      .toInt();
}

bool getProgressSuccess(int progress) {
  if (progress == 100) {
    return true;
  } else {
    return false;
  }
}

int calculateSuccessAnswers(List<dynamic> questions) {
  int count = 0;
  for (dynamic question in questions) {
    if (question['is_validate_by_user'] == false) {
      count++;
    }
  }
  return count;
}

bool isMediaExist(List<dynamic> media) {
  if (media.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}

dynamic findQuizById(
  List<dynamic> quizes,
  String quizId,
) {
  int index = quizes.indexOf((quiz) => quiz["id"] == quizId);
  return quizes[index];
}

String? randomColorsFromRange() {
  // return color variable from a range of colors hexadecimal
  List<String> colors = [
    '#725DFF',
    '#F341D0',
    '#FF8C67',
    '#FFC653',
    '#007CFF',
    '#0092DF',
    '#00916A',
    '#44BEA4',
    '#1D1927',
    '#3FF0B9',
    '#AC2275',
    '#39B6FF',
  ];
  int index = math.Random().nextInt(colors.length);
  return colors[index];
}
