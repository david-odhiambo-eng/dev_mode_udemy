class GetQuizModel {
  String quiz;
  String keyWord;
  String answer;

  GetQuizModel({
    required this.quiz,
    required this.keyWord,
    required this.answer,
  });
  factory GetQuizModel.fromJson(Map<String, dynamic> json) {
    return GetQuizModel(
      quiz: json['quiz'],
      keyWord: json['key_word'],
      answer: json['answer'],
    );
  }
}
