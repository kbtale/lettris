import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/styles/glassmorphic_container.dart';
import '../../../../core/styles/neumorphic_button.dart';
import '../../domain/services/dictionary_service.dart';

class WordSetsScreen extends ConsumerWidget {
  const WordSetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryService = ref.watch(dictionaryServiceProvider);
    final wordSets = dictionaryService.getWordSets();
    final activeSet = dictionaryService.getActiveWordSet();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade900,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with back button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Word Sets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () => _showAddWordSetDialog(context, dictionaryService),
                    ),
                  ],
                ),
              ),
              // Word sets list
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: wordSets.length,
                  itemBuilder: (context, index) {
                    final wordSet = wordSets[index];
                    final isActive = wordSet.id == activeSet?.id;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GlassmorphicContainer(
                        blur: 10,
                        opacity: 0.1,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: (isActive ? Colors.green : Colors.blue).withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                        child: ListTile(
                          leading: Icon(
                            wordSet.isOfficial ? Icons.verified : Icons.description,
                            color: wordSet.isOfficial ? Colors.blue : Colors.grey,
                            size: 32,
                          ),
                          title: Text(
                            wordSet.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                wordSet.description,
                                style: TextStyle(
                                  color: Colors.grey.shade300,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${wordSet.words.length} words',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          trailing: isActive
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 28,
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.blue,
                                    size: 28,
                                  ),
                                  onPressed: () async {
                                    await dictionaryService.setActiveWordSet(wordSet.id);
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                  },
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showAddWordSetDialog(
      BuildContext context, DictionaryService dictionaryService) async {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    final wordsController = TextEditingController();

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Add Word Set',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: wordsController,
              style: const TextStyle(color: Colors.white),
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Words (one per line)',
                labelStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          NeumorphicButton(
            onPressed: () {
              final words = wordsController.text
                  .split('\n')
                  .map((w) => w.trim().toLowerCase())
                  .where((w) => w.isNotEmpty)
                  .toSet();

              final wordSet = WordSet(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                name: nameController.text,
                description: descriptionController.text,
                isOfficial: false,
                words: words,
              );

              dictionaryService.addWordSet(wordSet);
              Navigator.pop(context);
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
