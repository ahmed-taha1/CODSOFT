import '../../models/question.dart';

List<Question> flutterQuestions = [
  Question(
      questionText: "What are the main building blocks of Flutter UIs?",
      answersTxt: ["Blocks", "Functions", "Widgets", "Components"],
      answerIndex: 2),
  Question(
      questionText: "How are Flutter UIs build?",
      answersTxt: [
        'By combining widgets in code',
        'By combining widgets in visual editor',
        'By defining widgets in config files',
        'By using Xcode for iOS and Android Studio for Android',
      ],
      answerIndex: 0),
  Question(
      questionText: 'What\'s the purpose of a StatefulWidget?',
      answersTxt: [
        'Update data as UI changes',
        'Ignore data changes',
        'Render UI that does not depend on data',
        'Update UI as data changes',
      ],
      answerIndex: 3),
  Question(
      questionText:
      'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
      answersTxt: [
        'StatelessWidget',
        'StatefulWidget',
        'Both are equally good',
        'None of the above',
      ],
      answerIndex: 0),
  Question(
      questionText: 'What happens if you change data in a StatelessWidget?',
      answersTxt: [
        'The UI is updated',
        'The closest StatefulWidget is updated',
        'The UI is not updated',
        'Any nested StatefulWidgets are updated',
      ],
      answerIndex: 2),
  Question(
      questionText: 'How should you update data inside of StatefulWidgets?',
      answersTxt: [
        'By calling updateData()',
        'By calling updateUI',
        'By calling updateState()',
        'By calling setState()',
      ],
      answerIndex: 3),
];
