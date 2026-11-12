class GetQuizModel {
  String quiz;
  String keyWord;
  String answer;
  String topic;

  GetQuizModel({
    required this.quiz,
    required this.keyWord,
    required this.answer,
    required this.topic
  });
  factory GetQuizModel.fromJson(Map<String, dynamic> json) {
    return GetQuizModel(
      quiz: json['quiz'],
      keyWord: json['key_word'],
      answer: json['answer'],
      topic: json['topic']
    );
  }
}
