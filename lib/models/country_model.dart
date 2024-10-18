// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Country {
  final String commonName; 
  final String officialName; 
  final String capital;
 final String currencyName; 
  final String currencySymbol;
  final double area;
  final String flagUrl;
  Country({
    required this.commonName,
    required this.officialName,
    required this.capital,
    required this.currencyName,
    required this.currencySymbol,
    required this.area,
    required this.flagUrl,
  });
 

  Country copyWith({
    String? commonName,
    String? officialName,
    String? capital,
    String? currencyName,
    String? currencySymbol,
    double? area,
    String? flagUrl,
  }) {
    return Country(
      commonName: commonName ?? this.commonName,
      officialName: officialName ?? this.officialName,
      capital: capital ?? this.capital,
      currencyName: currencyName ?? this.currencyName,
      currencySymbol: currencySymbol ?? this.currencySymbol,
      area: area ?? this.area,
      flagUrl: flagUrl ?? this.flagUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commonName': commonName,
      'officialName': officialName,
      'capital': capital,
      'currencyName': currencyName,
      'currencySymbol': currencySymbol,
      'area': area,
      'flagUrl': flagUrl,
    };
  }

 factory Country.fromMap(Map<String, dynamic> map) {
  return Country(
    commonName: map['name']['common'] as String? ?? '', // القيمة الافتراضية
    officialName: map['name']['official'] as String? ?? '', // القيمة الافتراضية
    capital: (map['capital'] as List<dynamic>).isNotEmpty 
             ? (map['capital'] as List<dynamic>)[0] as String 
             : '', // القيمة الافتراضية
    currencyName: map['currencies']?.values.first['name'] as String? ?? '', // القيمة الافتراضية
    currencySymbol: map['currencies']?.values.first['symbol'] as String? ?? '', // القيمة الافتراضية
    area: (map['area'] as num).toDouble(), // تحويل إلى double
    flagUrl: map['flags']['png'] as String? ?? '', // القيمة الافتراضية
  );
}


  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) => Country.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Country(commonName: $commonName, officialName: $officialName, capital: $capital, currencyName: $currencyName, currencySymbol: $currencySymbol, area: $area, flagUrl: $flagUrl)';
  }

  @override
  bool operator ==(covariant Country other) {
    if (identical(this, other)) return true;
  
    return 
      other.commonName == commonName &&
      other.officialName == officialName &&
      other.capital == capital &&
      other.currencyName == currencyName &&
      other.currencySymbol == currencySymbol &&
      other.area == area &&
      other.flagUrl == flagUrl;
  }

  @override
  int get hashCode {
    return commonName.hashCode ^
      officialName.hashCode ^
      capital.hashCode ^
      currencyName.hashCode ^
      currencySymbol.hashCode ^
      area.hashCode ^
      flagUrl.hashCode;
  }
}
