// To parse this JSON data, do
//
//     final film = filmFromJson(jsonString);

import 'dart:convert';

List<Film> filmFromJson(String str) => List<Film>.from(json.decode(str).map((x) => Film.fromJson(x)));

String filmToJson(List<Film> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Film {
    Film({
        required this.id,
        required this.username,
        required this.uploads,
        required this.profilePic,
        required this.uploadedAt,
        required this.hasViewed,
    });

    int id;
    String username;
    List<String> uploads;
    String profilePic;
    DateTime uploadedAt;
    bool hasViewed;

    factory Film.fromJson(Map<String, dynamic> json) => Film(
        id: json["id"],
        username: json["username"],
        uploads: List<String>.from(json["uploads"].map((x) => x)),
        profilePic: json["profile_pic"],
        uploadedAt: DateTime.parse(json["uploaded_at"]),
        hasViewed: json["has_viewed"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "uploads": List<dynamic>.from(uploads.map((x) => x)),
        "profile_pic": profilePic,
        "uploaded_at": uploadedAt.toIso8601String(),
        "has_viewed": hasViewed,
    };
}
