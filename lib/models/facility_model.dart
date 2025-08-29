class Facility {
  final String name;
  final String address;
  final String? email;
  final double? latitude;
  final double? longitude;

  const Facility({
    required this.name,
    required this.address,
    this.email,
    this.latitude,
    this.longitude,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      email: json['email']?.isNotEmpty == true ? json['email'] : null,
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  String toString() {
    return 'Facility(name: $name, address: $address, email: $email, lat: $latitude, lng: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Facility &&
        other.name == name &&
        other.address == address &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^ address.hashCode ^ email.hashCode;
  }
}
