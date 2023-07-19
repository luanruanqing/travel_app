class Travel {
  int? _totalSize;
  int? _totalSizeImage;
  int? _totalSizeReviews;
  int? _ratingTravel;
  late List<TravelModel> _travels;
  List<TravelModel> get travels => _travels;

  Travel({required totalSize,
    required totalSizeImage,
    required totalSizeReviews,
    required ratingTravel,
    required travels,
    required images,
    required location,
    required reviews,
    }) {
    this._totalSize = totalSize;
    this._totalSizeImage = _totalSizeImage;
    this._totalSizeReviews = _totalSizeReviews;
    this._ratingTravel = ratingTravel;
    this._travels = travels;
  }

  Travel.fromJson(dynamic json) {
    _totalSize = json["total_size"];
    _totalSizeImage = json["total_size_image"];
    _totalSizeReviews = json["total_size_reviews"];
    _ratingTravel = json["rating_travel"];
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
  late List<ImageModel> _images;
  List<ImageModel> get images => _images;

  TravelModel({
    required id,
    required destination,
    required description,
    required locationId,
    required createdAt,
    required updatedAt
})
      {this.id = id;
      this.destination = destination;
      this.description = description;
      this.locationId = locationId;
      this.createdAt = createdAt;
      this.updatedAt = updatedAt;
      this._images = images;
      }

  TravelModel.fromJson(dynamic json)
  {
    id = json["id"];
    destination = json["destination"];
    description = json["description"];
    locationId = json["location_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    if (json['images'] != null) {
      _images = <ImageModel>[];
      json['images'].forEach((v) {
        _images.add(ImageModel.fromJson(v));
      });
    }
  }

  Map<String,dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["destination"] = destination;
    data["description"] = description;
    data["location_id"] = locationId;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class ImageModel {
  int? id;
  String? imageUrl;
  String? createdAt;
  String? updatedAt;

  ImageModel(this.id,this.imageUrl,this.createdAt,this.updatedAt);

  ImageModel.fromJson(dynamic json)
  {
    id = json["id"];
    imageUrl = json["image_url"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String,dynamic> toJson()
  {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["image_url"] = imageUrl;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
