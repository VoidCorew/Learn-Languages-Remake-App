import 'package:learn_langs_app/models/models.dart';

final Map<String, Lesson> lessonsData = {
  'Japanese_N5_Alphabet': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Alphabet',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you say "Hello" in Japanese?',
        options: ['こんにちは', 'さようなら', 'ありがとう', 'すみません'],
        correctAnswer: 'こんにちは',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which character is "a" in Hiragana?',
        options: ['い', 'あ', 'う', 'え'],
        correctAnswer: 'あ',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'What sound does "か" represent?',
        options: ['sa', 'ka', 'ta', 'na'],
        correctAnswer: 'ka',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which is the Hiragana for "shi"?',
        options: ['ち', 'に', 'し', 'ひ'],
        correctAnswer: 'し',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Pronounce the word "こんにちは"',
        correctAnswer: 'konnichiwa',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Pronounce the syllable "ま"',
        correctAnswer: 'ma',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen to the audio and write the Hiragana you hear',
        correctAnswer: 'は',
        audioPath: 'sounds/japanese/n5/hiragana_ha.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the word you hear',
        correctAnswer: 'おはよう',
        audioPath: 'sounds/japanese/n5/ohayou.mp3',
      ),
    ],
  ),
  'Japanese_N5_Basic Grammar': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Basic Grammar',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'What is the function of "は" (wa) in a sentence?',
        options: [
          'Marks the object',
          'Marks the subject/topic',
          'Indicates past tense',
          'Means "and"',
        ],
        correctAnswer: 'Marks the subject/topic',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Choose the correct sentence: "I am a student"',
        options: ['わたしは学生です', 'わたしが学生です', 'わたしに学生です', 'わたしを学生です'],
        correctAnswer: 'わたしは学生です',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'What does "です" (desu) mean?',
        options: ['Was', 'Am/Is/Are', 'And', 'But'],
        correctAnswer: 'Am/Is/Are',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which particle is used to indicate location?',
        options: ['を', 'に', 'と', 'で'],
        correctAnswer: 'に',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say the sentence: "Watashi wa gakusei desu"',
        correctAnswer: 'わたしは学生です',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Pronounce: "Kore wa pen desu"',
        correctAnswer: 'これはペンです',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the sentence you hear',
        correctAnswer: 'それは本です',
        audioPath: 'sounds/japanese/n5/grammar_sorewa_hon_desu.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen to the question and write the answer: "お名前は？"',
        correctAnswer: '〇〇です',
      ),
    ],
  ),
  'Japanese_N5_Pronouns': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Pronouns',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'What does "わたし" mean?',
        options: ['You', 'He', 'I', 'She'],
        correctAnswer: 'I',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which word means "you"?',
        options: ['あなた', 'わたし', 'かれ', 'かのじょ'],
        correctAnswer: 'あなた',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'What is "かれ"?',
        options: ['She', 'He', 'We', 'They'],
        correctAnswer: 'He',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which pronoun means "we"?',
        options: ['わたし', 'わたしたち', 'あなたたち', 'かれら'],
        correctAnswer: 'わたしたち',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Watashi wa Tanaka desu"',
        correctAnswer: 'わたしは田中です',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Anata no namae wa?"',
        correctAnswer: 'あなたの名前は？',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the pronoun you hear',
        correctAnswer: 'かのじょ',
        audioPath: 'sounds/japanese/n5/pronoun_kanojo.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen to the sentence and write the pronoun used',
        correctAnswer: 'われわれ',
        audioPath: 'sounds/japanese/n5/pronoun_wareware.mp3',
      ),
    ],
  ),
  'Japanese_N5_Articles and Counters': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Articles and Counters',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'Which counter is used for flat objects like paper?',
        options: ['つ', 'まい', 'ほん', 'だい'],
        correctAnswer: 'まい',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which counter is used for machines (e.g. computers)?',
        options: ['ほん', 'だい', 'こ', 'びき'],
        correctAnswer: 'だい',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you say "three books"?',
        options: ['さんほん', 'さんまい', 'さんだい', 'さんこ'],
        correctAnswer: 'さんほん',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which counter is used for small objects?',
        options: ['つ', 'こ', 'ひき', 'まい'],
        correctAnswer: 'こ',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Ichi-satsu no hon"',
        correctAnswer: '一冊の本',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Ni-dai no terebi"',
        correctAnswer: '二台のテレビ',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the number and counter you hear',
        correctAnswer: 'ごまい',
        audioPath: 'sounds/japanese/n5/counters_gomai.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the counter used for "three cats"',
        correctAnswer: 'びき',
        audioPath: 'sounds/japanese/n5/counters_sanbiki.mp3',
      ),
    ],
  ),
  'Japanese_N5_Simple Sentences': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Simple Sentences',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you say "This is a pen"?',
        options: ['それはペンです', 'これはペンです', 'あれはペンです', 'ここはペンです'],
        correctAnswer: 'これはペンです',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Choose the correct translation: "That is a book"',
        options: ['これは本です', 'そこは本です', 'あれは本です', 'どれは本です'],
        correctAnswer: 'あれは本です',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you ask "What is this?"',
        options: ['なんですか？', 'どこですか？', 'これはなんですか？', 'どうですか？'],
        correctAnswer: 'これはなんですか？',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'Which sentence means "I am not a teacher"?',
        options: ['せんせいです', 'せんせいではありません', 'せんせいでした', 'せんせいでしょう'],
        correctAnswer: 'せんせいではありません',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Kore wa tēburu desu"',
        correctAnswer: 'これはテーブルです',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Are wa kuruma desu ka?"',
        // correctAnswer: 'あれは車ですか？',
        correctAnswer: 'Are wa kuruma desu ka?',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the sentence you hear',
        correctAnswer: 'これはいすです',
        audioPath: 'sounds/japanese/n5/sentences_korewa_isu_desu.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the question asked',
        correctAnswer: 'それは何ですか？',
        audioPath: 'sounds/japanese/n5/sentences_sorewa_nan_desu_ka.mp3',
      ),
    ],
  ),
  'Japanese_N5_Numbers and Dates': Lesson(
    language: 'Japanese',
    level: 'N5',
    topic: 'Numbers and Dates',
    tasks: [
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you say "five" in Japanese?',
        options: ['いち', 'さん', 'ご', 'なな'],
        correctAnswer: 'ご',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'What is "juu"?',
        options: ['One', 'Five', 'Ten', 'Three'],
        correctAnswer: 'Ten',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'How do you say "Monday"?',
        options: ['げつようび', 'かようび', 'すいようび', 'きんようび'],
        correctAnswer: 'げつようび',
      ),
      Task(
        type: TaskType.multipleChoice,
        question: 'What is the correct way to say "July 7th"?',
        options: ['しちがつしちにち', 'なながつしちにち', 'しちがつななのか', 'なながつななのか'],
        correctAnswer: 'しちがつしちにち',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say: "Today is Wednesday"',
        correctAnswer: 'きょうは水曜日です',
      ),
      Task(
        type: TaskType.voiceRecording,
        question: 'Say the number: 23',
        correctAnswer: 'にじゅうさん',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the date you hear',
        correctAnswer: '12月25日',
        audioPath: 'sounds/japanese/n5/dates_juunigatsu_nijuugo_nichi.mp3',
      ),
      Task(
        type: TaskType.listeningWriting,
        question: 'Listen and write the number spoken',
        correctAnswer: '84',
        audioPath: 'sounds/japanese/n5/numbers_hachijuu_yon.mp3',
      ),
    ],
  ),
};

  // 'German_A1_Articles': Lesson(
  //   language: 'German',
  //   level: 'A1',
  //   topic: 'Articles',
  //   tasks: [
  //     Task(
  //       type: TaskType.multipleChoice,
  //       question: 'What is the article for the word "Mädchen"?',
  //       options: ['der', 'die', 'das'],
  //       correctAnswer: 'das',
  //     ),
  //   ],
  // ),