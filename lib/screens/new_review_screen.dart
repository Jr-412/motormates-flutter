import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class NewReviewScreen extends StatefulWidget {
  const NewReviewScreen({super.key});

  @override
  State<NewReviewScreen> createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Nueva reseña', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.close), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabecera del vehículo que se está reseñando
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(12),
                    // --- Agregamos la imagen real del carro aquí ---
                    image: const DecorationImage(
                      image: AssetImage('assets/images/porsche_flutter.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Porsche 911 GT3',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('2024 · Deportivo', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            const Text('¿Cómo calificarías este auto?', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // Selector de estrellas
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  iconSize: 40,
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const SizedBox(height: 32),

            const Text('Tu experiencia', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 12),

            // Input Multilínea (Text Area)
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Cuéntanos sobre la conducción, el confort, el diseño...',
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            const SizedBox(height: 40),

            CustomButton(
              text: 'Publicar reseña',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
