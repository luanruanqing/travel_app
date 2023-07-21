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
  num? rating;
  String? createdAt;
  String? updatedAt;
  late List<Images> _images;
  List<Images> get images => _images;
  late List<Services> _services;
  List<Services> get services => _services;
  Location? location;
  late List<Reviews> _reviews;
  List<Reviews> get review => _reviews;

  HotelModel({
    required id,
    required locationId,
    required address,
    required name,
    required price,
    required description,
    required rating,
    required createdAt,
    required updatedAt,
    required images,
    required services,
    required location,
    required reviews,
  })
  {this.id = id;
  this.locationId = locationId;
  this.address = address;
  this.name = name;
  this.price = price;
  this.description = description;
  this.rating = rating;
  this.createdAt = createdAt;
  this.updatedAt = updatedAt;
  this._images = images;
  this._services = services;
  this.location = location;
  this._reviews = review;
  }

  HotelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locationId = json['location_id'];
    address = json['address'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    rating = json['rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['services'] != null) {
      _services = <Services>[];
      json['services'].forEach((v) {
        _services.add(Services.fromJson(v));
      });
    }
    if (json['images'] != null) {
      _images = <Images>[];
      json['images'].forEach((v) {
        _images.add(Images.fromJson(v));
      });
    }
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    if (json['reviews'] != null) {
      _reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        _reviews.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location_id'] = this.locationId;
    data['address'] = this.address;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['rating'] = this.rating;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['location'] = this.location?.toJson();
    data['images'] = this.images.map((v) => v.toJson()).toList();
    data['reviews'] = this.review.map((v) => v.toJson()).toList();
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

class Reviews {
  int? id;
  int? hotelId;
  int? travelId;
  int? roomId;
  int? flightId;
  int? userId;
  String? reviewText;
  String? rating;
  String? like;
  String? dislike;
  String? createdAt;
  String? updatedAt;

  Reviews(
      {this.id,
        this.hotelId,
        this.travelId,
        this.roomId,
        this.flightId,
        this.userId,
        this.reviewText,
        this.rating,
        this.like,
        this.dislike,
        this.createdAt,
        this.updatedAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotel_id'];
    travelId = json['travel_id'];
    roomId = json['room_id'];
    flightId = json['flight_id'];
    userId = json['user_id'];
    reviewText = json['review_text'];
    rating = json['rating'];
    like = json['like'];
    dislike = json['dislike'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hotel_id'] = this.hotelId;
    data['travel_id'] = this.travelId;
    data['room_id'] = this.roomId;
    data['flight_id'] = this.flightId;
    data['user_id'] = this.userId;
    data['review_text'] = this.reviewText;
    data['rating'] = this.rating;
    data['like'] = this.like;
    data['dislike'] = this.dislike;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? thumbnail;
  String? description;
  String? createdAt;
  String? updatedAt;

  Services(
      {this.id,
        this.name,
        this.thumbnail,
        this.description,
        this.createdAt,
        this.updatedAt});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['thumbnail'] = this.thumbnail;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
