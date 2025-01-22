class UsersModel {
  UsersModel({
    required this.results,
    required this.info,
  });

  List<Result> results;
  Info? info;

  UsersModel copyWith({
    List<Result>? results,
    Info? info,
  }) {
    return UsersModel(
      results: results ?? this.results,
      info: info ?? this.info,
    );
  }

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      info: json["info"] == null ? null : Info.fromJson(json["info"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "results": results.map((x) => x.toJson()).toList(),
        "info": info?.toJson(),
      };
}

class Info {
  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  final String? seed;
  final int? results;
  final int? page;
  final String? version;

  Info copyWith({
    String? seed,
    int? results,
    int? page,
    String? version,
  }) {
    return Info(
      seed: seed ?? this.seed,
      results: results ?? this.results,
      page: page ?? this.page,
      version: version ?? this.version,
    );
  }

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      seed: json["seed"],
      results: json["results"],
      page: json["page"],
      version: json["version"],
    );
  }

  Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
      };
}

class Result {
  Result({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    required this.phone,
    required this.cell,
    required this.id,
    required this.picture,
    required this.nat,
  });

  final String? gender;
  final Name? name;
  final Location? location;
  final String? email;
  final Login? login;
  final Dob? dob;
  final Dob? registered;
  final String? phone;
  final String? cell;
  final Id? id;
  final Picture? picture;
  final String? nat;

  Result copyWith({
    String? gender,
    Name? name,
    Location? location,
    String? email,
    Login? login,
    Dob? dob,
    Dob? registered,
    String? phone,
    String? cell,
    Id? id,
    Picture? picture,
    String? nat,
  }) {
    return Result(
      gender: gender ?? this.gender,
      name: name ?? this.name,
      location: location ?? this.location,
      email: email ?? this.email,
      login: login ?? this.login,
      dob: dob ?? this.dob,
      registered: registered ?? this.registered,
      phone: phone ?? this.phone,
      cell: cell ?? this.cell,
      id: id ?? this.id,
      picture: picture ?? this.picture,
      nat: nat ?? this.nat,
    );
  }

  String get fullName => '${name?.first} ${name?.last}';
  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      gender: json["gender"],
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      location:
          json["location"] == null ? null : Location.fromJson(json["location"]),
      email: json["email"],
      login: json["login"] == null ? null : Login.fromJson(json["login"]),
      dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
      registered:
          json["registered"] == null ? null : Dob.fromJson(json["registered"]),
      phone: json["phone"],
      cell: json["cell"],
      id: json["id"] == null ? null : Id.fromJson(json["id"]),
      picture:
          json["picture"] == null ? null : Picture.fromJson(json["picture"]),
      nat: json["nat"],
    );
  }

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "location": location?.toJson(),
        "email": email,
        "login": login?.toJson(),
        "dob": dob?.toJson(),
        "registered": registered?.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id?.toJson(),
        "picture": picture?.toJson(),
        "nat": nat,
      };
}

class Dob {
  Dob({
    required this.date,
    required this.age,
  });

  final DateTime? date;
  final int? age;

  Dob copyWith({
    DateTime? date,
    int? age,
  }) {
    return Dob(
      date: date ?? this.date,
      age: age ?? this.age,
    );
  }

  factory Dob.fromJson(Map<String, dynamic> json) {
    return Dob(
      date: DateTime.tryParse(json["date"] ?? ""),
      age: json["age"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "age": age,
      };
}

class Id {
  Id({
    required this.name,
    required this.value,
  });

  final String? name;
  final String? value;

  Id copyWith({
    String? name,
    String? value,
  }) {
    return Id(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(
      name: json["name"],
      value: json["value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });

  final Street? street;
  final String? city;
  final String? state;
  final String? country;
  final dynamic postcode;
  final Coordinates? coordinates;
  final Timezone? timezone;

  Location copyWith({
    Street? street,
    String? city,
    String? state,
    String? country,
    dynamic postcode,
    Coordinates? coordinates,
    Timezone? timezone,
  }) {
    return Location(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      postcode: postcode ?? this.postcode,
      coordinates: coordinates ?? this.coordinates,
      timezone: timezone ?? this.timezone,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: json["street"] == null ? null : Street.fromJson(json["street"]),
      city: json["city"],
      state: json["state"],
      country: json["country"],
      postcode: json["postcode"],
      coordinates: json["coordinates"] == null
          ? null
          : Coordinates.fromJson(json["coordinates"]),
      timezone:
          json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "street": street?.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates?.toJson(),
        "timezone": timezone?.toJson(),
      };
}

class Coordinates {
  Coordinates({
    required this.latitude,
    required this.longitude,
  });

  final String? latitude;
  final String? longitude;

  Coordinates copyWith({
    String? latitude,
    String? longitude,
  }) {
    return Coordinates(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json["latitude"],
      longitude: json["longitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  Street({
    required this.number,
    required this.name,
  });

  final int? number;
  final String? name;

  Street copyWith({
    int? number,
    String? name,
  }) {
    return Street(
      number: number ?? this.number,
      name: name ?? this.name,
    );
  }

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json["number"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  Timezone({
    required this.offset,
    required this.description,
  });

  final String? offset;
  final String? description;

  Timezone copyWith({
    String? offset,
    String? description,
  }) {
    return Timezone(
      offset: offset ?? this.offset,
      description: description ?? this.description,
    );
  }

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json["offset"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Login {
  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  final String? uuid;
  final String? username;
  final String? password;
  final String? salt;
  final String? md5;
  final String? sha1;
  final String? sha256;

  Login copyWith({
    String? uuid,
    String? username,
    String? password,
    String? salt,
    String? md5,
    String? sha1,
    String? sha256,
  }) {
    return Login(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      password: password ?? this.password,
      salt: salt ?? this.salt,
      md5: md5 ?? this.md5,
      sha1: sha1 ?? this.sha1,
      sha256: sha256 ?? this.sha256,
    );
  }

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json["uuid"],
      username: json["username"],
      password: json["password"],
      salt: json["salt"],
      md5: json["md5"],
      sha1: json["sha1"],
      sha256: json["sha256"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String? title;
  final String? first;
  final String? last;

  Name copyWith({
    String? title,
    String? first,
    String? last,
  }) {
    return Name(
      title: title ?? this.title,
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json["title"],
      first: json["first"],
      last: json["last"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture copyWith({
    String? large,
    String? medium,
    String? thumbnail,
  }) {
    return Picture(
      large: large ?? this.large,
      medium: medium ?? this.medium,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json["large"],
      medium: json["medium"],
      thumbnail: json["thumbnail"],
    );
  }

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
