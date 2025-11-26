import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favourite_place/providers/user_places.dart';
import 'package:favourite_place/widgets/image_input.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddScreenState();
  }
}

class _AddScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  File? _selectedImage;

  void _savePlace() {
    final enteredTitle = _titleController.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }

    ref
        .read(UserPlacesProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place...'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              controller: _titleController,
            ),
            const SizedBox(height: 10),
            ImageInput(
              onPickImage: (image) {
                _selectedImage = image;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text('Add Place'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
