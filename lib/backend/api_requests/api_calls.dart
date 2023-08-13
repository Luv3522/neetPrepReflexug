import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Practice Group Code

class PracticeGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static GetPracticeTestsToShowSubjectsInThePracticeTabCall
      getPracticeTestsToShowSubjectsInThePracticeTabCall =
      GetPracticeTestsToShowSubjectsInThePracticeTabCall();
  static GetPracticeTestsToShowChapterWiseCall
      getPracticeTestsToShowChapterWiseCall =
      GetPracticeTestsToShowChapterWiseCall();
  static GetPracticeTestDetailsForAnExampleSubjectAnatomyCall
      getPracticeTestDetailsForAnExampleSubjectAnatomyCall =
      GetPracticeTestDetailsForAnExampleSubjectAnatomyCall();
  static ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall
      resetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall =
      ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall();
  static GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall
      getPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall =
      GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall();
  static GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall
      getStatusOfAllPracticeQuestionsForATestForAGivenUserCall =
      GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall();
  static CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall
      createAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall =
      CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall();
  static CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall
      createQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall =
      CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall();
  static CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall
      createOrDeleteBookmarkForAPracticeQuestionByAUserCall =
      CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall();
  static GetQuestionIssueListForIssueReportingCall
      getQuestionIssueListForIssueReportingCall =
      GetQuestionIssueListForIssueReportingCall();
}

class GetPracticeTestsToShowSubjectsInThePracticeTabCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetPracticeModeTestList(\$id: ID!) {\\n  course(id: \$id) {\\n    tests(orderBy: [SEQID, ID], where: {allowPracticeMode: true}) {\\n      edges {\\n        node {\\n          id\\n          name\\n          numQuestions\\n          durationInMin\\n        }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\"id\\": \\"${courseId}\\"}",
  "operationName": "GetPracticeModeTestList"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Practice Tests to show subjects in the practice tab',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic practiceTests(dynamic response) => getJsonField(
        response,
        r'''$.data.course.tests.edges[:].node''',
        true,
      );
}

class GetPracticeTestsToShowChapterWiseCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetPracticeModeTestList(\$id:ID) {\\n  course(id: \$id) {\\n    subjects{\\n      edges{\\n        node{\\n          topics(orderBy: [SEQID, ID]){\\n            edges{\\n              node{\\n                name\\n                questionSets (orderBy:SEQID){\\n                  edges{\\n                    node{\\n                      id\\n                      name\\n                      sections\\n                      numQuestions\\n                    }\\n                  }\\n                }\\n              }\\n            }\\n          }\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetPracticeModeTestList"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Practice Tests to show chapter wise',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic topicNodes(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node.topics.edges[:].node''',
        true,
      );
  dynamic topicNames(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node.topics.edges[:].node.name''',
        true,
      );
}

class GetPracticeTestDetailsForAnExampleSubjectAnatomyCall {
  Future<ApiCallResponse> call({
    String? testId = '',
  }) {
    final body = '''
{
  "query": "query GetTestDetail(\$id:ID){\\n    test(id:\$id) {\\n    name\\n    numQuestions\\n    sections\\n    sectionNumQues\\n  }\\n}",
  "variables": "{\\"id\\":  \\"${testId}\\"}",
  "operationName": "GetTestDetail"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Practice Test details for an example subject Anatomy ',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic sections(dynamic response) => getJsonField(
        response,
        r'''$.data.test.sections''',
        true,
      );
  dynamic sectionNumQues(dynamic response) => getJsonField(
        response,
        r'''$.data.test.sectionNumQues''',
        true,
      );
  dynamic test(dynamic response) => getJsonField(
        response,
        r'''$.data.test''',
      );
}

class ResetAttemptsOfAPracticeTestShownOnClickingOnTheThreeDotsBesidesTestNameCall {
  Future<ApiCallResponse> call({
    int? selectedId,
    String? authToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName:
          'Reset Attempts of a Practice Test shown on clicking on the three dots besides test name ',
      apiUrl: '${PracticeGroup.baseUrl}/api/v1/user/deleteQuestionSetAttempt',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'ignoreTopic': 1,
        'selectedId': selectedId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPracticeQuestionsForATestGivenIdOffsetAndFirstNQuestionsCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    int? first = 400,
    int? offset = 0,
  }) {
    final body = '''
{
  "query": "query GetChunkParticularTest(\$id: ID!, \$first: Int!, \$offset: Int!) {\\n  test(id: \$id) {\\n    id\\n    numQuestions\\n    questions(orderBy: [SEQASC],first: \$first, offset:\$offset) {\\n      edges {\\n        node {\\n          id\\n          question\\n          ncert\\n          options\\n          correctOptionIndex\\n         explanation\\n         explanationWithoutAudio\\n questionDetails(last: 1) {\\n edges { \\n node { \\n year \\n exam}}} \\n bookmarkQuestion {\\n            id\\n          }\\n          userAnswer {\\n            id\\n            userAnswer\\n          }\\n                topics(first: 1) {\\n            edges {\\n              node {\\n                id\\n                name\\n              }\\n              id\\n              cursor\\n            }\\n          }\\n          analytics {\\n            correctPercentage\\n            correctAnswerCount\\n            incorrectAnswerCount\\n            option1Percentage\\n            option2Percentage\\n            option3Percentage\\n            option4Percentage\\n          }\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\"id\\":  \\"${testId}\\",\\n\\"first\\":${first},\\n  \\"offset\\": ${offset}\\n}",
  "operationName": "GetChunkParticularTest"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Practice Questions for a test given id offset and first n questions',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic testQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node''',
        true,
      );
  dynamic questionExams(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.questionDetails.edges[:].node.exam''',
        true,
      );
  dynamic testHtmlQuestionsArr(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.question''',
        true,
      );
  dynamic testQuestionIdArr(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.id''',
        true,
      );
  dynamic testHtmlExplanationsArr(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.explanationWithoutAudio''',
        true,
      );
  dynamic testQuestionCorrectPercentages(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.analytics.correctPercentage''',
        true,
      );
  dynamic testQuestionCorrectOptionIndices(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.correctOptionIndex''',
        true,
      );
  dynamic testHtmlFullExplanationsArr(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.explanation''',
        true,
      );
  dynamic testIsNcert(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.ncert''',
        true,
      );
  dynamic testIsExam(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.questionDetails.edges''',
        true,
      );
  dynamic testExamYear(dynamic response) => getJsonField(
        response,
        r'''$.data.test.questions.edges[:].node.questionDetails.edges[:].node.year''',
        true,
      );
}

class GetStatusOfAllPracticeQuestionsForATestForAGivenUserCall {
  Future<ApiCallResponse> call({
    int? testIdInt,
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "query GetQuestionsStatus(\$testId: String) {\\n    allQuestions(testId: \$testId, strict: true, removeHooks: true) {\\n        edges {\\n            node {\\n                id\\n                correctOptionIndex\\n                userAnswer {\\n                    userAnswer\\n                }\\n                bookmarkQuestion {\\n                    id\\n                }\\n            }\\n        }\\n    }\\n}\\n",
  "variables": "{\\n  \\"testId\\": \\"${testIdInt}\\"\\n}",
  "operationName": "GetQuestionsStatus"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Status of all Practice Questions for a test for a given user',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic allQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.allQuestions.edges[:].node''',
        true,
      );
}

class CreateAnswerForAPracticeQuestionByAUserWithSpecificMarkedOptionCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? userId = '',
    int? userAnswer,
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "mutation createAnswer(\$input: createAnswerInput!) {\\n    createAnswer(input: \$input) {\\n        clientMutationId\\n    \\t\\tquestion{\\n          userAnswer{\\n            userAnswer\\n          }\\n        }\\n    }\\n}",
  "variables": "{\\n  \\"input\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"userId\\": \\"${userId}\\",\\n    \\"userAnswer\\": ${userAnswer}\\n  }\\n}",
  "operationName": "createAnswer"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Create answer for a practice question by a user with specific marked option ',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateQuestionIssueReportedByAUserForAQuestionAndForAnIssueTypeCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? userId = '',
    String? typeId = '',
    String? authToken = '',
    String? description = '',
    String? testId = '',
  }) {
    final body = '''
{
  "query": "mutation postCustomerIssue(\$createCustomerIssueInput: createCustomerIssueInput!) {\\n    createCustomerIssue(input: \$createCustomerIssueInput) {\\n        clientMutationId\\n    }\\n}",
  "variables": "{\\n  \\"createCustomerIssueInput\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"testId\\": \\"${testId}\\",\\n    \\"typeId\\": \\"${typeId}\\",\\n    \\"description\\": \\"${description}\\",\\n    \\"userId\\": \\"${userId}\\"\\n  }\\n}",
  "operationName": "postCustomerIssue"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Create question issue reported by a user for a question and for an issue type',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrDeleteBookmarkForAPracticeQuestionByAUserCall {
  Future<ApiCallResponse> call({
    String? questionId = '',
    String? userId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "mutation CreateBookmarkQuestionMutation(\$input: createOrDeleteBookmarkQuestionInput!) {\\n    createOrDeleteBookmarkQuestion(input: \$input) {\\n        clientMutationId\\n    \\t\\tquestion{\\n          bookmarkQuestion{\\n            userId\\n          }\\n        }\\n    }\\n}",
  "variables": "{\\n  \\"input\\": {\\n    \\"questionId\\": \\"${questionId}\\",\\n    \\"userId\\": \\"${userId}\\"\\n  }\\n}",
  "operationName": "CreateBookmarkQuestionMutation"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create or delete bookmark for a practice question by a user',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetQuestionIssueListForIssueReportingCall {
  Future<ApiCallResponse> call() {
    final body = '''
{
  "query": "query GetCustomerIssue(\$focusArea: FocusArea!) {\\n    getCustomerIssueTypes(focusArea: \$focusArea, removeExplanationIssue: true) {\\n        code\\n        id\\n        displayName\\n        description\\n        focusArea\\n    }\\n}",
  "variables": "{\\n  \\"focusArea\\": \\"question\\"\\n}",
  "operationName": "GetCustomerIssue"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get question issue list for Issue reporting',
      apiUrl: '${PracticeGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PracticeGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic questionIssueTypes(dynamic response) => getJsonField(
        response,
        r'''$.data.getCustomerIssueTypes''',
        true,
      );
}

/// End Practice Group Code

/// Start Test Group Code

class TestGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall
      listOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall =
      ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall();
  static GetTestDetailsForSingleTestForTheStartTestPageCall
      getTestDetailsForSingleTestForTheStartTestPageCall =
      GetTestDetailsForSingleTestForTheStartTestPageCall();
  static GetPreviousYearTestsInTestsTabCall getPreviousYearTestsInTestsTabCall =
      GetPreviousYearTestsInTestsTabCall();
  static GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall
      getSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall =
      GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall();
  static CreateCustomTestAsPerSelectedParametersCall
      createCustomTestAsPerSelectedParametersCall =
      CreateCustomTestAsPerSelectedParametersCall();
  static UpdateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall
      updateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall =
      UpdateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall();
  static GetCompletedTestAttemptDataWithTestResultForATestAttemptCall
      getCompletedTestAttemptDataWithTestResultForATestAttemptCall =
      GetCompletedTestAttemptDataWithTestResultForATestAttemptCall();
  static CreateTestAttemptForATestByAUserCall
      createTestAttemptForATestByAUserCall =
      CreateTestAttemptForATestByAUserCall();
}

class ListOfCustomCreatedTestsByTheUserOrderedByDateOfCreationDescendingCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? first = 10,
    int? offset = 0,
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetCustomTests(\$first: Int!, \$offset: Int!, \$courseId: ID!) {\\n  course(id: \$courseId) {\\n    customTests(orderBy: [IDDESC], first: \$first, offset: \$offset) {\\n      edges {\\n        node {\\n          id\\n          name\\n          durationInMin\\n          numQuestions\\n          resumeAttempt {\\n            id\\n          }\\n          completedAttempt {\\n            id\\n            completed\\n          }\\n        }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\n  \\"first\\": ${first},\\n  \\"offset\\": ${offset}\\n,\\n  \\"courseId\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCustomTests"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'List of custom created tests by the user ordered by date of creation descending ',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic myCustomTestNodes(dynamic response) => getJsonField(
        response,
        r'''$.data.course.customTests.edges''',
        true,
      );
  dynamic myCustomTests(dynamic response) => getJsonField(
        response,
        r'''$.data.course.customTests.edges[:].node''',
        true,
      );
}

class GetTestDetailsForSingleTestForTheStartTestPageCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    String? testId = '',
  }) {
    final body = '''
{
  "query": "query GetTest(\$id: ID!) {test(id: \$id){id\\n          name\\n          durationInMin\\n          numQuestions\\n          canReview\\n          startedAt\\n          canStart\\n          positiveMarks\\n          resumeAttempt {\\n            id\\n          }\\n          completedAttempt {\\n            id\\n            completed\\n          }\\n        }\\n }\\n",
  "variables": "{\\"id\\": \\"${testId}\\"}",
  "operationName": "GetTest"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get test details for single test for the start test page',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic completedAttemptId(dynamic response) => getJsonField(
        response,
        r'''$.data.test.completedAttempt.id''',
      );
  dynamic numQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.test.numQuestions''',
      );
  dynamic durationInMin(dynamic response) => getJsonField(
        response,
        r'''$.data.test.durationInMin''',
      );
  dynamic testName(dynamic response) => getJsonField(
        response,
        r'''$.data.test.name''',
      );
  dynamic testId(dynamic response) => getJsonField(
        response,
        r'''$.data.test.id''',
      );
  dynamic test(dynamic response) => getJsonField(
        response,
        r'''$.data.test''',
      );
  dynamic resumeAttemptId(dynamic response) => getJsonField(
        response,
        r'''$.data.test.resumeAttempt.id''',
      );
  dynamic positiveMarksPerQ(dynamic response) => getJsonField(
        response,
        r'''$.data.test.positiveMarks''',
      );
  dynamic canReview(dynamic response) => getJsonField(
        response,
        r'''$.data.test.canReview''',
      );
  dynamic canStart(dynamic response) => getJsonField(
        response,
        r'''$.data.test.canStart''',
      );
  dynamic startedAt(dynamic response) => getJsonField(
        response,
        r'''$.data.test.startedAt''',
      );
}

class GetPreviousYearTestsInTestsTabCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "query GetPracticeModeTestList(\$id: ID!) {me{\\nid\\n}\\n  course(id: \$id) {\\n    tests(orderBy: [STARTEDAT, SEQID, ID]) {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          numQuestions\\n          positiveMarks\\n          durationInMin\\n   resumeAttempt {\\n            id\\n          }\\n   completedAttempt {\\n            id\\n            completed\\n          }\\n     }\\n      }\\n    }\\n  }\\n}\\n",
  "variables": "{\\"id\\": \\"${courseId}\\"}",
  "operationName": "GetPracticeModeTestList"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get previous year tests in tests tab',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic previousTest(dynamic response) => getJsonField(
        response,
        r'''$.data.course.tests.edges[:].node''',
        true,
      );
}

class GetSubjectsAndChaptersForTheCustomTestCreationUsingQuestionsFromChosenSubjectsAndChaptersCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetCourseSubjectAndTopicList(\$id: ID!) {\\n  course(id: \$id) {\\n    subjects {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          topics(orderBy: SEQID) {\\n            total\\n            edges {\\n              node {\\n                id\\n                name\\n                duplicateChapter{\\n origId}\\n              }\\n            }\\n          }\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCourseSubjectAndTopicList"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get subjects and chapters for the custom test creation using questions from chosen subjects and chapters',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic subjectWithChapters(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node''',
        true,
      );
  dynamic chapters(dynamic response) => getJsonField(
        response,
        r'''$.data.course.subjects.edges[:].node.topics.edges[:].node''',
        true,
      );
}

class CreateCustomTestAsPerSelectedParametersCall {
  Future<ApiCallResponse> call({
    int? numQuestions,
    dynamic? topicIdsJson,
    dynamic? subjectIdsJson,
    int? includeBookmarks,
    String? authToken = '',
    String? selectedExam = 'BOTH',
    int? durationInMin,
    int? courseId,
  }) {
    final topicIds = _serializeJson(topicIdsJson);
    final subjectIds = _serializeJson(subjectIdsJson);
    final body = '''
{
  "num_questions": ${numQuestions},
  "topic_ids": ${topicIds},
  "subject_ids": ${subjectIds},
  "include_bookmarks": ${includeBookmarks},
  "selected_exam": "${selectedExam}",
  "duration_in_min": ${durationInMin},
  "course_id": ${courseId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create custom test as per selected parameters',
      apiUrl: '${TestGroup.baseUrl}/create_custom_test',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateTestAttemptForATestByAUserBasedOnQuestionsAttemptedAndTimeSpendEtcCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? authToken = '',
    String? testAttemptId = '',
    String? userAnswersJsonStr = '',
    String? userQuestionWiseDurationInSecJsonStr = '',
    String? visitedQuestionsJsonStr = '',
    String? markedQuestionsJsonStr = '',
    int? elapsedDurationInSec,
    int? currentQuestionOffset,
    bool? completed,
  }) {
    final body = '''
{
  "query": "mutation updateTestAttempt(\$updateTestAttemptInput: updateTestAttemptInput!) {\\n  updateTestAttempt(input: \$updateTestAttemptInput) {\\n    clientMutationId\\n,    newTestAttempt{\\n     id, result\\n    }\\n    }\\n}\\n",
  "variables": "{\\n  \\"updateTestAttemptInput\\": {\\n    \\"id\\":\\"${testAttemptId}\\",\\n    \\"values\\": {\\n    \\t\\"testId\\": \\"${testId}\\",\\n      \\"userId\\": \\"${userId}\\",\\n      \\"userAnswers\\": ${userAnswersJsonStr},\\n      \\"userQuestionWiseDurationInSec\\":${userQuestionWiseDurationInSecJsonStr} ,\\n      \\"visitedQuestions\\": ${visitedQuestionsJsonStr},\\n      \\"markedQuestions\\": ${markedQuestionsJsonStr},\\n      \\"elapsedDurationInSec\\": ${elapsedDurationInSec},\\n      \\"currentQuestionOffset\\": ${currentQuestionOffset},\\n      \\"completed\\": ${completed}\\n   }\\n  }\\n}",
  "operationName": "updateTestAttempt"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'update test attempt for a test by a user based on questions attempted and time spend etc ',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetCompletedTestAttemptDataWithTestResultForATestAttemptCall {
  Future<ApiCallResponse> call({
    String? testAttemptId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "query GetTestAttemptDetailsQuery(\$id: ID!) {\\n  testAttempt(id: \$id) {\\n    id\\n    result\\n    userQuestionWiseDurationInSec\\n    userAnswers\\n    createdAt\\n    completed\\n    detail {\\n      showAnswer\\n     queStatusArr\\n    }\\n    test {\\n      id\\n      name\\n      durationInMin\\n      resultMsgHtml\\n      canReview\\n      reviewAt\\n      numQuestions\\n      positiveMarks\\n      maxMarks\\n questions(first: 400, orderBy: SEQASC){\\n edges{\\n node{\\n id\\n, question\\n correctOptionIndex\\n explanation\\n explanationWithoutAudio\\n analytics{\\n correctPercentage, option1Percentage, option2Percentage, option3Percentage, option4Percentage}}}}       myRank {\\n        rank\\n        testAttemptId\\n        id\\n      }\\n      toppers {\\n        total\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${testAttemptId}\\"\\n}",
  "operationName": "GetTestAttemptDetailsQuery"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get completed test attempt data with test result for a test attempt',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic correctAnswerCount(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.result.correctAnswerCount''',
      );
  dynamic incorrectAnswerCount(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.result.incorrectAnswerCount''',
      );
  dynamic totalMarks(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.result.totalMarks''',
      );
  dynamic rank(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.myRank.rank''',
      );
  dynamic toppers(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.toppers.total''',
      );
  dynamic questionsList(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.questions.edges[:].node''',
        true,
      );
  dynamic userAnswers(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.userAnswers''',
      );
  dynamic showAnswer(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.detail.showAnswer''',
      );
  dynamic testName(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.name''',
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.createdAt''',
      );
  dynamic completed(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.completed''',
      );
  dynamic questionsStatus(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.detail.queStatusArr''',
        true,
      );
  dynamic numQuestions(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.numQuestions''',
      );
  dynamic testAttemptDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.detail''',
      );
  dynamic questionIdsList(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.questions.edges[:].node.id''',
        true,
      );
  dynamic durationInMin(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.durationInMin''',
      );
  dynamic userQuestionWiseDurationInSec(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.userQuestionWiseDurationInSec''',
      );
  dynamic canReview(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.canReview''',
      );
  dynamic reviewAt(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.reviewAt''',
      );
  dynamic testId(dynamic response) => getJsonField(
        response,
        r'''$.data.testAttempt.test.id''',
      );
}

class CreateTestAttemptForATestByAUserCall {
  Future<ApiCallResponse> call({
    String? testId = '',
    String? userId = '',
    String? authToken = '',
  }) {
    final body = '''
{
  "query": "mutation createTestAttempt(\$createTestAttemptInput: createTestAttemptInput!) {\\n  createTestAttempt(input: \$createTestAttemptInput) {\\n    clientMutationId\\n    newTestAttempt {\\n      id\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"createTestAttemptInput\\": {\\n    \\"testId\\": \\"${testId}\\",\\n    \\"userId\\": \\"${userId}\\"\\n  }\\n}",
  "operationName": "createTestAttempt"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create test attempt for a test by a user',
      apiUrl: '${TestGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...TestGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic testAttemptId(dynamic response) => getJsonField(
        response,
        r'''$.data.createTestAttempt.newTestAttempt.id''',
      );
}

/// End Test Group Code

/// Start Notes Group Code

class NotesGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall
      getCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall =
      GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall();
}

class GetCourseNotesWhichHaveExternalUrlAsLinksForDownloadingPdfCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetCoursePdfList(\$id: ID!) {\\n  course(id: \$id) {\\n    notes {\\n      total\\n      edges {\\n        node {\\n          id\\n          name\\n          externalURL\\n          free\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCoursePdfList"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get Course Notes which have external url as links for downloading pdf ',
      apiUrl: '${NotesGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...NotesGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic notes(dynamic response) => getJsonField(
        response,
        r'''$.data.course.notes.edges[:].node''',
        true,
      );
}

/// End Notes Group Code

/// Start Signup Group Code

class SignupGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static LoggedInUserInformationAndCourseAccessCheckingApiCall
      loggedInUserInformationAndCourseAccessCheckingApiCall =
      LoggedInUserInformationAndCourseAccessCheckingApiCall();
  static GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall
      googleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall =
      GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall();
  static GetUserAnswerCountCall getUserAnswerCountCall =
      GetUserAnswerCountCall();
}

class LoggedInUserInformationAndCourseAccessCheckingApiCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
    int? courseIdInt,
    String? altCourseIds = '',
  }) {
    final body = '''
{
  "query": "query GetMe {\\n  me {\\n    profile {\\n      id\\n      displayName\\n      picture\\n      email\\n    }\\n    userCourses(where: {courseId: [${courseIdInt}, ${altCourseIds}]}) {\\n      edges {\\n        node {\\n          expiryAt\\n        }\\n      }\\n    }\\n  }\\n}",
  "variables": "",
  "operationName": "GetMe"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Logged in user information and course access checking api ',
      apiUrl: '${SignupGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
    );
  }

  dynamic me(dynamic response) => getJsonField(
        response,
        r'''$.data.me''',
      );
  dynamic courses(dynamic response) => getJsonField(
        response,
        r'''$.data.me.userCourses.edges''',
        true,
      );
}

class GoogleLoginServerCallWithCodeReceivedFromGoogleAuthenticationCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? email = '',
    String? name = '',
    String? picture = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName:
          'Google login server call with code received from google authentication',
      apiUrl: '${SignupGroup.baseUrl}/authenticate/googleAuth',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
      },
      params: {
        'token': token,
        'email': email,
        'name': name,
        'picture': picture,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic user(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class GetUserAnswerCountCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) {
    final body = '''
{
"operationName": "userAnalytics",
"query" : "query userAnalytics {\\n  me{\\n    profileAnalytic{\\n      ansCount\\n    }\\n  }\\n}\\n",
"variables" : ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Answer Count',
      apiUrl: '${SignupGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...SignupGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Signup Group Code

/// Start Payment Group Code

class PaymentGroup {
  static String baseUrl = 'https://www.neetprep.com';
  static Map<String, String> headers = {};
  static CreatePaymentForAUserForACourseAndCourseOfferAndGetChecksumCall
      createPaymentForAUserForACourseAndCourseOfferAndGetChecksumCall =
      CreatePaymentForAUserForACourseAndCourseOfferAndGetChecksumCall();
  static GetCoursePriceAndCourseOffersToSelectFromToStartPaymentCall
      getCoursePriceAndCourseOffersToSelectFromToStartPaymentCall =
      GetCoursePriceAndCourseOffersToSelectFromToStartPaymentCall();
  static PaymentSuccessBackendProcessingCallToEnableCourseCall
      paymentSuccessBackendProcessingCallToEnableCourseCall =
      PaymentSuccessBackendProcessingCallToEnableCourseCall();
}

class CreatePaymentForAUserForACourseAndCourseOfferAndGetChecksumCall {
  Future<ApiCallResponse> call({
    int? txnAmount,
    String? email = '',
    String? mobile = '',
    String? course = '',
    String? courseOfferId = '',
    String? authToken = '',
    int? userid,
  }) {
    return ApiManager.instance.makeApiCall(
      callName:
          'Create payment for a user for a course and course offer and get checksum',
      apiUrl: '${PaymentGroup.baseUrl}/api/v1/generate_txn_token',
      callType: ApiCallType.POST,
      headers: {
        ...PaymentGroup.headers,
        'Authorization': 'Bearer ${authToken}',
      },
      params: {
        'TXN_AMOUNT': txnAmount,
        'EMAIL': email,
        'MOBILE': mobile,
        'COURSE': course,
        'COURSE_OFFER_ID': courseOfferId,
        'USERID': userid,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic paymentId(dynamic response) => getJsonField(
        response,
        r'''$.payment_id''',
      );
  dynamic orderId(dynamic response) => getJsonField(
        response,
        r'''$.order_id''',
      );
  dynamic checksum(dynamic response) => getJsonField(
        response,
        r'''$.checksum''',
      );
  dynamic mid(dynamic response) => getJsonField(
        response,
        r'''$.mid''',
      );
  dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.amount''',
      );
  dynamic txnToken(dynamic response) => getJsonField(
        response,
        r'''$.txnToken''',
      );
  dynamic callbackUrl(dynamic response) => getJsonField(
        response,
        r'''$.callbackUrl''',
      );
  dynamic isStaging(dynamic response) => getJsonField(
        response,
        r'''$.isStaging''',
      );
  dynamic restrictAppInvoke(dynamic response) => getJsonField(
        response,
        r'''$.restrictAppInvoke''',
      );
}

class GetCoursePriceAndCourseOffersToSelectFromToStartPaymentCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
  }) {
    final body = '''
{
  "query": "query GetCourseDetail(\$id: ID!) {\\n    course(id: \$id) {\\n        id\\n        name\\n        description\\n        fee\\n        discountedFee\\n        discountPercentage\\n        public\\n        expiryAt\\n        image\\n        bestSeller\\n        origFee\\n        feeTitle\\n        feeDesc\\n        type\\n        offers:defaultOffers {\\n              edges {\\n                node {\\n                id\\n                  title\\n                  description\\n                  fee\\n                  discountPercentage\\n                  discountedFee\\n                  expiryAt\\n                  durationInDays\\n                }\\n            }\\n        }\\n    }\\n}",
  "variables": "{\\n  \\"id\\": \\"${courseId}\\"\\n}",
  "operationName": "GetCourseDetail"
}''';
    return ApiManager.instance.makeApiCall(
      callName:
          'Get course price and course offers to select from to start payment',
      apiUrl: '${PaymentGroup.baseUrl}/graphql',
      callType: ApiCallType.POST,
      headers: {
        ...PaymentGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic course(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  dynamic courseOffers(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node''',
        true,
      );
  dynamic offerDiscountedFees(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.discountedFee''',
        true,
      );
  dynamic offerFees(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.fee''',
        true,
      );
  dynamic offerTitles(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.title''',
        true,
      );
  dynamic offerDurations(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.durationInDays''',
        true,
      );
  dynamic offerdispercent(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.discountPercentage''',
        true,
      );
  dynamic offersExpiryAt(dynamic response) => getJsonField(
        response,
        r'''$.data.course.offers.edges[:].node.expiryAt''',
        true,
      );
  dynamic defaultFee(dynamic response) => getJsonField(
        response,
        r'''$.data.course.fee''',
      );
  dynamic defaultDiscountPrice(dynamic response) => getJsonField(
        response,
        r'''$.data.course.discountedFee''',
      );
  dynamic defaultDisPercent(dynamic response) => getJsonField(
        response,
        r'''$.data.course.discountPercentage''',
      );
  dynamic defaultName(dynamic response) => getJsonField(
        response,
        r'''$.data.course.name''',
      );
  dynamic defaultExpiryAt(dynamic response) => getJsonField(
        response,
        r'''$.data.course.expiryAt''',
      );
  dynamic defaultId(dynamic response) => getJsonField(
        response,
        r'''$.data.course.id''',
      );
}

class PaymentSuccessBackendProcessingCallToEnableCourseCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    int? paymentId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Payment Success Backend Processing call to enable course',
      apiUrl: '${PaymentGroup.baseUrl}/reflex_payment_response.json',
      callType: ApiCallType.POST,
      headers: {
        ...PaymentGroup.headers,
      },
      params: {
        'redirect_domain': "mib.neetprep.com",
        'orderId': orderId,
        'paymentId': paymentId,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic paymentResponse(dynamic response) => getJsonField(
        response,
        r'''$.payment_response''',
      );
  dynamic paymentResponseStatus(dynamic response) => getJsonField(
        response,
        r'''$.payment_response.STATUS''',
      );
}

/// End Payment Group Code

/// Start Misc Group Code

class MiscGroup {
  static String baseUrl = 'https://mib.neetprep.com/';
  static Map<String, String> headers = {};
  static GetCoursesForSwitchingCall getCoursesForSwitchingCall =
      GetCoursesForSwitchingCall();
}

class GetCoursesForSwitchingCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Courses for switching',
      apiUrl: '${MiscGroup.baseUrl}/files/courses.json',
      callType: ApiCallType.GET,
      headers: {
        ...MiscGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic courseIdInts(dynamic response) => getJsonField(
        response,
        r'''$[:].courseId''',
        true,
      );
  dynamic courseNames(dynamic response) => getJsonField(
        response,
        r'''$[:].courseName''',
        true,
      );
  dynamic altCourseIdInts(dynamic response) => getJsonField(
        response,
        r'''$[:].courseIdInts''',
        true,
      );
}

/// End Misc Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
