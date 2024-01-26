// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';

QuestionModel questionModelFromJson(String str) => QuestionModel.fromJson(json.decode(str));

String questionModelToJson(QuestionModel data) => json.encode(data.toJson());

class QuestionModel {
    int status;
    List<Question> questions;

    QuestionModel({
       required this.status,
        required this.questions,
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        status: json["status"],
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    int id;
    String text;
    int number;
    int quizId;
    DateTime createdAt;
    DateTime updatedAt;
    List<Option> options;
    // 
  //bool isSelected = false; 


    Question({
       required this.id,
       required this.text,
       required this.number,
       required this.quizId,
       required this.createdAt,
       required this.updatedAt,
       required this.options,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        text: json["text"],
        number: json["number"],
        quizId: json["quiz_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    );

  

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "number": number,
        "quiz_id": quizId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
     // "isSelected": isSelected, 
    };
}

class Option {
    int id;
    String name;
    String value;
    int questionId;
    DateTime createdAt;
    DateTime updatedAt;

  //bool isSelected = false;

    Option({
        required this.id,
        required this.name,
        required this.value,
        required this.questionId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        questionId: json["question_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
    
      toJson() {}}
AddQuestion addQuestionFromJson(String str) => AddQuestion.fromJson(json.decode(str));

String addQuestionToJson(AddQuestion data) => json.encode(data.toJson());

class AddQuestion {
    int id;
    String text;
    int number;
    int quizId;
    DateTime createdAt;
    DateTime updatedAt;
    List<Option> options;
    // 
  //bool isSelected = false; 


    AddQuestion({
       required this.id,
       required this.text,
       required this.number,
       required this.quizId,
       required this.createdAt,
       required this.updatedAt,
       required this.options,
    });

    factory AddQuestion.fromJson(Map<String, dynamic> json) => AddQuestion(
        id: json["id"],
        text: json["text"],
        number: json["number"],
        quizId: json["quiz_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    );

  

    Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "number": number,
        "quiz_id": quizId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
     // "isSelected": isSelected, 
    };
}

class AddOption {
    int id;
    String name;
    String value;
    int questionId;
    DateTime createdAt;
    DateTime updatedAt;

  //bool isSelected = false;

    AddOption({
        required this.id,
        required this.name,
        required this.value,
        required this.questionId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory AddOption.fromJson(Map<String, dynamic> json) => AddOption(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        questionId: json["question_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );
    
      toJson() {}}
