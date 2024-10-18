// import 'package:arabic_speaking_countries/blocs/bloc/country_event.dart';
// import 'package:arabic_speaking_countries/blocs/bloc/country_state.dart';
// import 'package:arabic_speaking_countries/services/country_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:arabic_speaking_countries/models/country_model.dart';

// class CountryBloc extends Bloc<CountryEvent, CountryState> {
//   CountryBloc() : super(CountryInitial()) {
//     on<GetCountries>((event, emit) async {
//       emit(CountryLoading());
//       try {
//         List<Country> result = await getCountries();
//         emit(CountrySuccess(countries: result));
//       } catch (e) {
//         print("Error: $e");
//         emit(CountryError());
//       }
//     });

//     on<SelectCountry>((event, emit) {
//       emit(CountryDetails(selectedCountry: event.selectedCountry));
//     });
//   }
// }
import 'package:arabic_speaking_countries/blocs/bloc/country_event.dart';
import 'package:arabic_speaking_countries/blocs/bloc/country_state.dart';
import 'package:arabic_speaking_countries/services/country_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_speaking_countries/models/country_model.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  CountryBloc() : super(CountryInitial()) {
    on<GetCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        List<Country> countries = await getCountries(); 
         if (countries is List<Country>) {
         emit(CountrySuccess(countries: countries));
        } else {
          emit(CountryError());
        }
        
      } catch (e) {
        print("Error: $e");
        emit(CountryError());
      }
    });

    on<SelectCountry>((event, emit) {
      emit(CountryDetails(selectedCountry: event.selectedCountry));
    });
  }
}
