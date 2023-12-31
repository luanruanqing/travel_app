class Travel {
  int? _totalSize;
  late List<TravelModel> _travels;
  List<TravelModel> get travels => _travels;

  Travel({ required totalSize, required travels}){
    this._totalSize = totalSize;
    this._travels = travels;
  }

  Travel.fromJson(dynamic json) {
    _totalSize = json["total_size"];
    if (json['travels'] != null) {
      _travels = <TravelModel>[];
      json['travels'].forEach((v) {
        _travels.add(TravelModel.fromJson(v));
      });
    }
  }
}

class TravelModel {
  int? id;
  String? destination;
  String? description;
  int? locationId;
  String? createdAt;
  String? updatedAt;
  late List<Images> _images;
  List<Images> get images => _images;
  Location? location;

  TravelModel({
    required id,
    required destination,
    required description,
    required locationId,
    required createdAt,
    required updatedAt,
    required images,
    required location,
  })
  {this.id = id;
  this.destination = destination;
  this.description = description;
  this.locationId = locationId;
  this.createdAt = createdAt;
  this.updatedAt = updatedAt;
  this._images = images;
  this.location = location;
  }

  TravelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destination = json['destination'];
    description = json['description'];
    locationId = json['location_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['destination'] = this.destination;
    data['description'] = this.description;
    data['location_id'] = this.locationId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['images'] = this.images.map((v) => v.toJson()).toList();
    data['location'] = this.location?.toJson();
    return data;
  }
}

class Images {
  int? id;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  Images({this.id, this.imageUrl, this.createdAt, this.updatedAt});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? description;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
        this.name,
        this.latitude,
        this.longitude,
        this.description,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
