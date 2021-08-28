// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

List<Chat> chatFromJson(String str) => List<Chat>.from(json.decode(str).map((x) => Chat.fromJson(x)));

String chatToJson(List<Chat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chat {
    Chat({
        required this.id,
        required this.username,
        required this.message,
        required this.profilePic,
        required this.sentAt,
        required this.hasRead,
        required this.isOnline,
        required this.isReplied,
        required this.messageCount,
    });

    int id;
    String username;
    String message;
    String profilePic;
    DateTime sentAt;
    bool hasRead;
    bool isOnline;
    bool isReplied;
    int messageCount;

    factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        username: json["username"],
        message: json["message"],
        profilePic: json["profile_pic"],
        sentAt: DateTime.parse(json["sent_at"]),
        hasRead: json["has_read"],
        isOnline: json["is_online"],
        isReplied: json["is_replied"],
        messageCount: json["message_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "message": message,
        "profile_pic": profilePic,
        "sent_at": sentAt.toIso8601String(),
        "has_read": hasRead,
        "is_online": isOnline,
        "is_replied": isReplied,
        "message_count": messageCount,
    };
}
