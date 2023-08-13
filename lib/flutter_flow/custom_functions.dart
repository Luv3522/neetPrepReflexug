import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/auth/firebase_auth/auth_util.dart';

int numberOfQuestins(
  List<dynamic> listOfNumber,
  int indexNumber,
) {
  return listOfNumber[indexNumber];
}

int getOffsetInt(int num) {
  return (num - (num % 10));
}

int printInteger(int str) {
  /// print('testing---');
  /// print(str);
  return str;
}

int? getQuesUserAnswer(
  dynamic userAnswers,
  String questionId,
) {
  List<String> splittedBase64 = [];
  String queId = '';

  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  String decoded = stringToBase64Url.decode(questionId);

  /// print(decoded.split(':'));
  splittedBase64 = decoded.split(':');
  queId = splittedBase64[1];

  /// print('question id');
  /// print(queId);
  /// print(userAnswers[queId]);

  if ((userAnswers != null) && (userAnswers[queId] != null)) {
    return int.parse(userAnswers[queId]);
  } else {
    return null;
  }
}

bool? getQuesUserAnswerCheck(
  dynamic userAnswers,
  String questionId,
  String correctOptionIndex,
) {
  List<String> splittedBase64 = [];
  String queId = '';

  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  String decoded = stringToBase64Url.decode(questionId);

  /// print(decoded.split(':'));
  splittedBase64 = decoded.split(':');
  queId = splittedBase64[1];

  /// print('question id');
  /// print(queId);
  /// print(userAnswers[queId]);

  if ((userAnswers[queId] != null)) {
    /// print(correctOptionIndex);
    /// print(userAnswers[queId] == correctOptionIndex);
    return userAnswers[queId] == correctOptionIndex;
  } else {
    return null;
  }
}

List<dynamic> getJsonList(List<dynamic> questionList) {
  List<dynamic> newList = questionList;

  return newList;
}

List<String> getUniqueString(
  String name,
  String strId,
  List<String> newList,
) {
  String str = strId;
  newList.add(str);
  return newList;
}

String getString(
  String strName,
  String strId,
) {
  return strId;
}

List<String> removeStrFromList(
  String name,
  String strId,
  List<String> updatedList,
) {
  String str = strId;
  updatedList.remove(str);
  return updatedList;
}

List<String> getUpdatedList(
  List<String> subTopicList,
  List<dynamic> subTopicJson,
  String tag,
) {
  if (tag == 'add') {
    for (int i = 0; i < subTopicJson.length; i++) {
      String str = subTopicJson[i]['node']['id'];
      if (!subTopicList.contains(str)) {
        subTopicList.add(str);
      }
    }
  }

  if (tag == 'remove') {
    for (int i = 0; i < subTopicJson.length; i++) {
      String str = subTopicJson[i]['node']['id'];
      subTopicList.remove(str);
    }
  }

  print(subTopicList.length);
  return subTopicList;
}

bool topicVisibility(
  List<String> chapterString,
  List<dynamic> chapterJson,
  String tag,
) {
  int flag = 0;
  for (int i = 0; i < chapterJson.length; i++) {
    String str = chapterJson[i]['node']['id'];
    if (!chapterString.contains(str)) {
      flag = 1;
    }
  }

  if (flag == 1) {
    /// print('unchecked');
    return true;
  } else {
    return false;
  }
}

String converHtmlIntoString(String htmlString) {
  /// print(htmlString);

  if (htmlString
      .contains(RegExp(r'<span class="math-tex">\\\(.*?\\\)</span>'))) {
    return htmlString.replaceAllMapped(
        RegExp(r'<span class="math-tex">\\\((.*?)\\\)</span>',
            caseSensitive: false),
        (Match m) => "<tex>${m[1]}</tex>");
  } else {
    return htmlString;
  }
}

List<int> getAnswerListInInteger(List<int> testQueAnsList) {
  List<int> newList = [];
  for (int i = 0; i < testQueAnsList.length; i++) {
    if (testQueAnsList[i] != 100) {
      newList.add(testQueAnsList[i]);
    }
  }

  /// print(newList);
  return newList;
}

List<int> getNumberOfTabs(
  int currentIndex,
  List<dynamic> listForLength,
) {
  List<int> newList = [];
  for (int i = currentIndex; i < listForLength.length; i++) {
    newList.add(++currentIndex);
  }
  return newList;
}

List<dynamic> getupdatedBookmarkRemove(
  List<dynamic> statusList,
  dynamic jsonValue,
  int position,
) {
  for (int i = 0; i < statusList.length; i++) {
    if (i == position) {
      statusList[i]['bookmarkQuestion'] = null;
      break;
    }
  }
  return statusList;
}

int getIntFromBase64(String idInBase64) {
  List<String> splittedBase64 = [];

  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  // String encoded = stringToBase64Url.encode(idInBase64);
  String decoded = stringToBase64Url.decode(idInBase64);

  /// print(decoded.split(':'));
  splittedBase64 = decoded.split(':');

  return int.parse(splittedBase64[1]);
}

DateTime? getDate(
  DateTime currentDateTime,
  int? numberOfDays,
) {
  return (numberOfDays != null)
      ? currentDateTime.add(Duration(days: numberOfDays))
      : null;
}

List<dynamic> getupdatedBookmark(
  List<dynamic> statusList,
  dynamic jsonValue,
  int position,
) {
  for (int i = 0; i < statusList.length; i++) {
    if (i == position) {
      statusList[i]['bookmarkQuestion'] = jsonValue;
      break;
    }
  }
  return statusList;
}

String? getBase64OfUserId(int userIdInt) {
  String userIdStr = "User:" + userIdInt.toString();
  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  String encoded = stringToBase64Url.encode(userIdStr);

  /// print(encoded);
  return encoded;
}

List<dynamic> getUpdatedQuestionsStatusList(
  List<dynamic> oldAnswerList,
  int intdexNumber,
  int answer,
) {
  oldAnswerList[intdexNumber]['userAnswer'] = {"userAnswer": answer};
  return oldAnswerList;
}

int getTotalOfAllStatus(
  List<dynamic> queStatusList,
  String category,
) {
  int result = 0;

  // for bookmarks total
  if (category == 'bookmark') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['bookmarkQuestion'] != null) {
        result++;
      }
    }
  }

  // for unAttempt total
  if (category == 'unattempt') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] == null) {
        result++;
      }
    }
  }

  // for correcr answer total
  if (category == 'correct') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] != null) {
        if (queStatusList[i]['userAnswer']['userAnswer'] ==
            queStatusList[i]['correctOptionIndex']) {
          result++;
        }
      }
    }
  }

  // for incorrecr answer total
  if (category == 'incorrect') {
    for (int i = 0; i < queStatusList.length; i++) {
      if (queStatusList[i]['userAnswer'] != null) {
        if (queStatusList[i]['userAnswer']['userAnswer'] !=
            queStatusList[i]['correctOptionIndex']) {
          result++;
        }
      }
    }
  }

  return result;
}

List<int> getTestQuestionsAnswerList(
  int lengthOfCustomTest,
  dynamic userAnswers,
  List<String> questionIds,
) {
  List<int> newList = [];
  late int? userAnswer;
  for (int i = 0; i < lengthOfCustomTest; i++) {
    if ((userAnswer = getQuesUserAnswer(userAnswers, questionIds[i])) != null) {
      newList.add(userAnswer!);
    } else {
      newList.add(100);
    }
  }

  return newList;
}

List<int> insertValueInListInSpecificPosition(
  List<int> queAnsList,
  int position,
  int element,
) {
  // queAnsList.insert(position, element);
  queAnsList[position] = element;

  /// print(queAnsList);
  return queAnsList;
}

String convertQuestionAndAnsIntoMapJson(
  List<int> question,
  List<int> answer,
) {
  List<String> resultList = [];
  for (int i = 0; i < question.length; i++) {
    resultList.add('\\"${question[i]}\\": \\"${answer[i]}\\"');
  }

  String result = '{';
  result += resultList.join(", ");
  result += ('}');

  /// print(result);
  return result;
}

List<int> getQuestionIdListInInteger(
  List<dynamic> queList,
  List<int> testQueAnsList,
) {
  List<int> newList = [];
  for (int i = 0; i < queList.length; i++) {
    if (testQueAnsList[i] != 100) {
      String idStr = queList[i]['id'];
      Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
      String decoded = stringToBase64Url.decode(idStr);
      newList.add(int.parse(decoded.split(':')[1]));
    }
  }

  /// print(newList);
  return newList;
}

List<int> getSecondsPerQueList(
  List<int> secondsList,
  int sewconds,
) {
  secondsList.add(sewconds);

  /// print(secondsList);
  return secondsList;
}

List<int> getSecondsInEachPage(
  int lengthOfCustomTest,
  dynamic userQuestionWiseDurationInSec,
  List<String> questionIds,
) {
  List<int> newList = [];
  late int? userQueDuration;
  for (int i = 0; i < lengthOfCustomTest; i++) {
    if ((userQueDuration =
            getQuesUserAnswer(userQuestionWiseDurationInSec, questionIds[i])) !=
        null) {
      newList.add(userQueDuration!);
    } else {
      newList.add(13000);
    }
  }

  return newList;
}

List<int> insertSeconsInList(
  List<int> queAnsList,
  int position,
  int element,
) {
  if (queAnsList[position] == 13000) {
    queAnsList[position] = element;
  } else {
    queAnsList[position] = queAnsList[position] + element;
  }

  /// print(queAnsList);
  return queAnsList;
}

List<int> getSecondsListInInt(List<int> testQueAnsList) {
  List<int> newList = [];
  for (int i = 0; i < testQueAnsList.length; i++) {
    if (testQueAnsList[i] != 13000) {
      newList.add(testQueAnsList[i]);
    }
  }

  /// print(newList);
  return newList;
}

dynamic getJsonForIdsOfList(
  List<String> subOrTopIdsList,
  String tag,
) {
  List<int> newList = [];

  if (tag == 'subjectId') {
    if (subOrTopIdsList.length != 0) {
      for (int i = 0; i < subOrTopIdsList.length; i++) {
        String idStr = subOrTopIdsList[i];
        Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
        String decoded = stringToBase64Url.decode(idStr);
        newList.add(int.parse(decoded.split(':')[1]));
      }
    }
  } else {
    if (subOrTopIdsList.length != 0) {
      for (int i = 0; i < subOrTopIdsList.length; i++) {
        String idStr = subOrTopIdsList[i];
        Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
        String decoded = stringToBase64Url.decode(idStr);
        newList.add(int.parse(decoded.split(':')[1]));
      }
    }
  }

  /// print(newList);

  return newList;
}

int seeMinAndSec(int minSec) {
  /// print("Hello");
  /// print(minSec);
  return minSec;
}

String checkString(String str) {
  /// print('testing---');
  /// print(str);
  return str;
}

int getAnswerForPreviousTest(
  dynamic testResponse,
  String questionId,
  int correctAnswer,
  int currentIndex,
) {
  List<String> splittedBase64 = [];
  String queId = '';

  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  // String encoded = stringToBase64Url.encode(idInBase64);
  String decoded = stringToBase64Url.decode(questionId);

  /// print(decoded.split(':'));
  splittedBase64 = decoded.split(':');
  queId = splittedBase64[1];

  /// print('question id');
  /// print(queId);
  /// print(testResponse["data"]["testAttempt"]["userAnswers"][queId]);

  if (testResponse["data"]["testAttempt"]["userAnswers"][queId] != null) {
    int userAnswers =
        int.parse(testResponse["data"]["testAttempt"]["userAnswers"][queId]);
    if ((userAnswers == correctAnswer) && (userAnswers == currentIndex)) {
      return 1; //green
    } else if ((userAnswers != currentIndex) &&
        (correctAnswer != currentIndex)) {
      return 3; // gray
    } else if (correctAnswer == currentIndex) {
      return 1; // green
    } else {
      return 2; // red
    }
  } else if (correctAnswer == currentIndex) {
    return 1; // green
  } else {
    return 3; // gray
  }

  /// return 0;
}

String getCreatedTime(String dateInString) {
  String date = '19:02:13';
  DateTime parseDt = DateTime.parse(date);
  final DateFormat formatter = DateFormat('Hm');
  final String formatted = formatter.format(parseDt);

  return formatted;
}

String getImgInStr(String img) {
  return img;
}

int getIntegerAmount(String amount) {
  /// print(double.parse(amount));
  return int.parse(amount.split('.')[0]);
}

int getPageNumber(int pageNum) {
  return pageNum * 10;
}

List<int> getQuestionsStatus(
  dynamic userAnswers,
  List<dynamic> questionsList,
) {
  return questionsList.map((e) {
    List<String> splittedBase64 = [];
    String queId = '';

    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String decoded = stringToBase64Url.decode(e["id"]);

    /// print(decoded.split(':'));
    splittedBase64 = decoded.split(':');
    queId = splittedBase64[1];

    if (userAnswers[queId] == null) {
      return -1;
    } else if (userAnswers[queId] != null &&
        e["correctOptionIndex"] == userAnswers[queId]) {
      return 1;
    } else {
      return 0;
    }
  }).toList();
}

List<int> convertQuestionsStatus(dynamic testAttemptDetails) {
  final dynamic questionsStatus = testAttemptDetails["queStatusArr"];
  return questionsStatus
      .map((e) => int.parse(e.toString()))
      .cast<int>()
      .toList();
}

int getOffsetListQueIndex(int num) {
  return (num % 10);
}

List<dynamic>? testQueTempList(int listLength) {
  return List.generate(listLength, (_) => {});
}

String? getOptionCorrectPercentage(
  dynamic questionNode,
  int optionIndex,
) {
  switch (optionIndex) {
    case 0:
      return questionNode['analytics']['option1Percentage']?.toString();
    case 1:
      return questionNode['analytics']['option2Percentage']?.toString();
    case 2:
      return questionNode['analytics']['option3Percentage']?.toString();
    case 3:
      return questionNode['analytics']['option4Percentage']?.toString();
    default:
      return "";
  }
}

List<int>? get1toNArr(int size) {
  return new List<int>.generate(size, (i) => i + 1);
}

String? getBase64forCourse(int? courseId) {
  String courseIdStr = "Course:" + courseId.toString();
  Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
  String encoded = stringToBase64Url.encode(courseIdStr);

  /// print(encoded);
  return encoded;
}

dynamic packageJSON(
  String? name,
  String? phoneN,
) {
  // create a json from given 2 arguments
  return {
    'name': name,
    'phone': phoneN,
  };
}

String? calcDiscount(
  String? act,
  String? dis,
) {
  // calculate discount percentage when actual price and discounted price are given
  if (act == null || dis == null) {
    return null;
  }
  final double actPrice = double.parse(act);
  final double disPrice = double.parse(dis);
  final double discount = (actPrice - disPrice) / actPrice * 100;
  return discount.toStringAsFixed(0);
}

String? getCreationDate(String date) {
  String createdTime = date.substring(4, date.indexOf(':') + 3);
  return createdTime;
}

String formatDate(
  String fromDate,
  String toFormat,
) {
  /// TODO: fix this up; currently the following is based on very restricted expectation of time data coming from graphql
  DateFormat inputFormat = DateFormat(
      "EEE MMM dd yyyy HH:mm:ss 'GMT+0000 (Coordinated Universal Time)'");
  DateTime t = DateTime.tryParse(fromDate) ?? inputFormat.parse(fromDate);

  return DateFormat(toFormat).format(t);
}
