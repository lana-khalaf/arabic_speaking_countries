import 'package:arabic_speaking_countries/blocs/bloc/country_bloc.dart';
import 'package:arabic_speaking_countries/blocs/bloc/country_event.dart';
import 'package:arabic_speaking_countries/blocs/bloc/country_state.dart';
import 'package:arabic_speaking_countries/views/country_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_speaking_countries/models/country_model.dart';

class LargerCountriesPage extends StatelessWidget {
  final double currentArea;

  const LargerCountriesPage({Key? key, required this.currentArea}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountryBloc()..add(GetCountries()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Mask Group (1).png'), 
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 27),
                    child: Row(
                      children: [
                        InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/images/back.png',height: 60,),
                    ),
                    Spacer(),
                        Text(
                          "Larger Arabic Speaking Countries",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 19, 23, 46),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 35),
                  BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CountrySuccess) {
                        final largerCountries = state.countries.where((country) => country.area > currentArea).toList();
                     if (largerCountries.isEmpty) {
        return Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info_outline,
                  size: 60,
                  color: Colors.blueGrey,
                ),
                SizedBox(height: 16),
                Text(
                  "No countries larger than the specified area",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 19, 23, 46),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Please check other criteria.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        );
      }       return Expanded(
                          child: ListView.builder(
                            itemCount: largerCountries.length,
                            itemBuilder: (context, index) {
                              final Country country = largerCountries[index];
                              return InkWell(
                                onTap: () {
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: InkWell(
                                     onTap: () {
        Navigator.push(
           context,
         MaterialPageRoute(
              builder: (context) => CountryDetailPage(country: country),
          ),
         );
     },
                                    child: Row(
                                      children: [
                                        ClipOval(
                                          child: Image.network(
                                            country.flagUrl,
                                            width: 40,
                                            height: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(width: 10), 
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                country.officialName,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 19, 23, 46), 
                                                ),
                                              ),
                                              SizedBox(height: 4),
                                              Text(
                                                country.commonName,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state is CountryError) {
                        return Center(child: Text("Error loading countries", style: TextStyle(color: Colors.red)));
                      } else {
                        return Center(child: Text("No countries available", style: TextStyle(color: Colors.grey)));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
