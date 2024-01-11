// To parse this JSON data, do
//
//     final quizHistorique = quizHistoriqueFromJson(jsonString);

import 'dart:convert';

QuizHistorique quizHistoriqueFromJson(String str) => QuizHistorique.fromJson(json.decode(str));

String quizHistoriqueToJson(QuizHistorique data) => json.encode(data.toJson());

class QuizHistorique {
    List<Quizzeshistorical> quizzeshistorical;

    QuizHistorique({
        required this.quizzeshistorical,
    });

    factory QuizHistorique.fromJson(Map<String, dynamic> json) => QuizHistorique(
        quizzeshistorical: List<Quizzeshistorical>.from(json["quizzeshistorical"].map((x) => Quizzeshistorical.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "quizzeshistorical": List<dynamic>.from(quizzeshistorical.map((x) => x.toJson())),
    };
}

class Quizzeshistorical {
    int id;
    DateTime date;
    String responseTime;
    int score;
    String titre;
    DateTime createdAt;
    DateTime updatedAt;

    Quizzeshistorical({
        required this.id,
        required this.date,
        required this.responseTime,
        required this.score,
        required this.titre,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Quizzeshistorical.fromJson(Map<String, dynamic> json) => Quizzeshistorical(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        responseTime: json["response_time"],
        score: json["score"],
        titre: json["titre"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "response_time": responseTime,
        "score": score,
        "titre": titre,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
