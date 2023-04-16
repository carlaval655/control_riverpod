import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'image_model.dart';
import 'image_notifier.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}



class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Riverpod Image Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Riverpod Image Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer(
                builder: (context, watch, _) {
                  final imageUrl = ref.watch(imageNotifierProvider) as ImageModel;
                  return Image.network(imageUrl.imageUrl);
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(imageNotifierProvider.notifier).updateImage();
                },
                child: const Text('Update Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
