import 'package:cat_fact_2/bloc/bloc.dart';
import 'package:cat_fact_2/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_fact_2/bloc/event.dart';
import 'package:cat_fact_2/bloc/state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cat Facts'),
      ),
      body: BlocBuilder<CatBloc, CatState>(
        builder: (context, state) {
          if (state == CatLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CatLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "state.catFact.",
                  height: 200,
                  width: 200,
                ),
                const SizedBox(height: 16),
                Text(
                  state.catFact.text,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  DateFormatter.formatDate(state.catFact.createdAt),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CatBloc>(context).add(FetchCatFact());
                  },
                  child: const Text('Another fact!'),
                ),
              ],
            );
          } else if (state is CatError) {
            return const Center(
              child: Text('Failed to load cat fact'),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
