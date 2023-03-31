import 'package:cat_fact_2/model/model.dart';
import 'package:cat_fact_2/utils/date_formater.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FactHistoryScreen extends StatelessWidget {
  final Box<CatFact> catBox = Hive.box<CatFact>('cat_facts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fact History'),
      ),
      body: ValueListenableBuilder(
        valueListenable: catBox.listenable(),
        builder: (context, Box<CatFact> box, _) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final catFact = box.getAt(index);
              return ListTile(
                title: Text(
                  catFact!.text,
                  style: const TextStyle(fontSize: 18),
                ),
                subtitle: Text(
                  DateFormatter.formatDate(catFact!.createdAt),
                  style: const TextStyle(fontSize: 16),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
