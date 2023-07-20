class Hotel {
  int? _totalSize;
  late List<HotelModel> _hotel;
  List<HotelModel> get hotels => _hotel;

  Hotel({required totalSize, required hotels}){this._totalSize = totalSize; this._hotel = hotels;}

  Hotel.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    if (json['hotels'] != null) {
      _hotel = <HotelModel>[];
      json['hotels'].forEach((v) {
        _hotel.add(HotelModel.fromJson(v));
      });
    }
  }
}

class HotelModel {
  int? id;
  int? locationId;
  String? address;
  String? name;
  String? price;
  String? description;
  String? createdAt;
  String? updatedAt;
  late List<Images> _images;
  List<Images> get images => _images;
  Location? location;

  HotelModel({
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
  this.locationId = destination;
  this.address = locationId;
  this.name = name;
  this.price = price;
  this.description = description;
  this.createdAt = createdAt;
  this.updatedAt = updatedAt;
  this._images = images;
  this.location = location;
  }

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['location_id'];
    address = json['address'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
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
    data['location_id'] = this.locationId;
    data['address'] = this.address;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['location'] = this.location?.toJson();
    data['images'] = this.images.map((v) => v.toJson()).toList();
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? imageUrl;
  String? latitude;
  String? longitude;
  String? description;
  String? createdAt;
  String? updatedAt;

  Location(
      {this.id,
        this.name,
        this.imageUrl,
        this.latitude,
        this.longitude,
        this.description,
        this.createdAt,
        this.updatedAt});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
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
    data['image_url'] = this.imageUrl;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
