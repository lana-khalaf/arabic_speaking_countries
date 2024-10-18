import 'package:arabic_speaking_countries/blocs/bloc/country_bloc.dart';
import 'package:arabic_speaking_countries/blocs/bloc/country_event.dart';
import 'package:arabic_speaking_countries/blocs/bloc/country_state.dart';
import 'package:arabic_speaking_countries/views/country_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:arabic_speaking_countries/models/country_model.dart';

class CountryListPage extends StatelessWidget {
  CountryListPage({super.key});
  static String id = 'CountryListPage';

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
                    padding: const EdgeInsets.only(top: 27,),
                    child: Text(
                      "Arabic Speaking Countries",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 19, 23, 46),
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CountrySuccess) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.countries.length,
                            itemBuilder: (context, index) {
                              final Country country = state.countries[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CountryDetailPage(country: country),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
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
