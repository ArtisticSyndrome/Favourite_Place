import 'package:flutter/material.dart';
//
import 'package:favourite_place/widgets/place_list.dart';
import 'package:favourite_place/screens/add_place.dart';
//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_place/providers/user_places.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(UserPlacesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your favourite Places'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AddPlaceScreen()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlaceList(places: userPlaces),
      ),
    );
  }
}
