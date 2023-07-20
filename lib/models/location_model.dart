class Location {
  int? _totalSize;
  late List<LocationModel> _locations;
  List<LocationModel> get locations => _locations;

  Location({required totalSize, required locations}){this._totalSize = totalSize; this._locations = locations;}

  Location.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    if (json['locations'] != null) {
      _locations = <LocationModel>[];
      json['locations'].forEach((v) {
        _locations.add(LocationModel.fromJson(v));
      });
    }
  }
}

class LocationModel {
  int? id;
  String? name;
  String? imageUrl;
  String? latitude;
  String? longitude;
  String? description;
  String? createdAt;
  String? updatedAt;

  LocationModel(
      {this.id,
        this.name,
        this.imageUrl,
        this.latitude,
        this.longitude,
        this.description,
        this.createdAt,
        this.updatedAt});

  LocationModel.fromJson(Map<String, dynamic> json) {
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
