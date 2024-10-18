import 'package:arabic_speaking_countries/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  const CountryEvent();

  @override
  List<Object?> get props => [];
}

class GetCountries extends CountryEvent {}

class SelectCountry extends CountryEvent {
  final Country selectedCountry;
  const SelectCountry({required this.selectedCountry});

  @override
  List<Object?> get props => [selectedCountry];
}
