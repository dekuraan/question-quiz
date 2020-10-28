class Fish {
  Fish(this.question, this.answer);
  final String question;
  final String answer;

  Map<String, dynamic> toJson() => {
        'q': question,
        'a': answer,
      };
  Fish.fromJson(Map<String, dynamic> json)
      : question = json['q'],
        answer = json['a'];
}
