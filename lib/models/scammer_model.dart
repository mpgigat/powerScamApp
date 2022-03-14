import 'dart:convert';

// // To parse this JSON data, do
//
//     final scammerResponse = scammerResponseFromJson(jsonString);


ScammerResponse scammerResponseFromJson(String str) => ScammerResponse.fromJson(json.decode(str));

String scammerResponseToJson(ScammerResponse data) => json.encode(data.toJson());

class ScammerResponse {
    ScammerResponse({
        required this.scammer,
    });

    List<Scammer> scammer;

    factory ScammerResponse.fromJson(Map<String, dynamic> json) => ScammerResponse(
        scammer: List<Scammer>.from(json["scammer"].map((x) => Scammer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "scammer": List<dynamic>.from(scammer.map((x) => x.toJson())),
    };
}

class Scammer {
    Scammer({
        required this.id,
        required this.user,
        required this.name,
        required this.platform,
        required this.rated,
        required this.state,
        this.alias,
        this.comments,
        this.associatedImages,
        required this.createdAt,
    });

    String id;
    User user;
    String name;
    String platform;
    int rated;
    int state;
    List<dynamic>? alias;
    List<dynamic>? comments;
    List<dynamic>? associatedImages;
    DateTime createdAt;

    factory Scammer.fromJson(Map<String, dynamic> json) => Scammer(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        name: json["name"],
        platform: json["platform"],
        rated: json["rated"],
        state: json["state"],
        
        // alias: List<dynamic>.from(json["alias"].map((x) => x)),
        // comments: List<dynamic>.from(json["comments"].map((x) => x)),
        // associatedImages: List<dynamic>.from(json["associatedImages"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "name": name,
        "platform": platform,
        "rated": rated,
        "state": state,
        // "alias": List<dynamic>.from(alias.map((x) => x)),
        // "comments": List<dynamic>.from(comments.map((x) => x)),
        // "associatedImages": List<dynamic>.from(associatedImages.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
    };
}

class User {
    User({
        required this.id,
        required this.alias,
    });

    String id;
    String alias;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        alias: json["alias"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "alias": alias,
    };
}
