// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

QuizModel quizModelFromJson(String str) => QuizModel.fromJson(json.decode(str));

String quizModelToJson(QuizModel data) => json.encode(data.toJson());

class QuizModel {
    List<Quizz> quizz;

    QuizModel({
      required this.quizz,
    });

    factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        quizz: List<Quizz>.from(json["quizz"].map((x) => Quizz.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "quizz": List<dynamic>.from(quizz.map((x) => x.toJson())),
    };
}

class Quizz {
    int id;
    String image;
    String titre;
    String description;
    int categorieId;
    int historiqueId;
    int niveauId;
    DateTime createdAt;
    DateTime updatedAt;

    Quizz({
        required this.id,
        required this.image,
        required this.titre,
        required this.description,
        required this.categorieId,
        required this.historiqueId,
        required this.niveauId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Quizz.fromJson(Map<String, dynamic> json) => Quizz(
        id: json["id"],
        image: json["image"],
        titre: json["titre"],
        description: json["description"],
        categorieId: json["categorie_id"],
        historiqueId: json["historique_id"],
        niveauId: json["niveau_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "titre": titre,
        "description": description,
        "categorie_id": categorieId,
        "historique_id": historiqueId,
        "niveau_id": niveauId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
    static fromMap(Quizz quizz) {}
}


AddQuiz addQuizFromJson(String str) => AddQuiz.fromJson(json.decode(str));

String addQuizToJson(AddQuiz data) => json.encode(data.toJson());

class AddQuiz {
    String titre;
    String description;
    int categorieId;
    int historiqueId;
    int niveauId;
    String image;

    AddQuiz({
      required  this.titre,
        required this.description,
    required this.categorieId,
        required this.historiqueId,
        required this.niveauId,
        required this.image,
    });

    factory AddQuiz.fromJson(Map<String, dynamic> json) => AddQuiz(
        titre:json["titre"],
        description: json["description"],
        categorieId: json["categorie_id"],
        historiqueId: json["historique_id"],
        niveauId: json["niveau_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "titre": titre,
        "description": description,
        "categorie_id": categorieId,
        "historique_id": historiqueId,
        "niveau_id": niveauId,
    };
}
