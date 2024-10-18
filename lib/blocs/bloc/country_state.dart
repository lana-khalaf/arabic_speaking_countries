import 'package:arabic_speaking_countries/models/country_model.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object?> get props => [];
}

class CountryInitial extends CountryState {}

class CountryLoading extends CountryState {}

class CountrySuccess extends CountryState {
  final List<Country> countries;
  const CountrySuccess({required this.countries});

  @override
  List<Object?> get props => [countries];
}

class CountryDetails extends CountryState {
  final Country selectedCountry;
  const CountryDetails({required this.selectedCountry});

  @override
  List<Object?> get props => [selectedCountry];
}

class CountryError extends CountryState {}
