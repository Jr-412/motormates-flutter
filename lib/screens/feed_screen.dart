import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos quemados para el feed
    final List<Map<String, String>> mockVehicles = [
      {
        'title': 'Porsche 911 GT3',
        'subtitle': '2024 · Deportivo',
        'image': 'assets/images/porsche_flutter.webp',
      },
      {
        'title': 'Toyota Land Cruiser',
        'subtitle': '2022 · SUV',
        'image': 'assets/images/toyota_flutter.jpg', 
      },
      {
        'title': 'Ford Mustang \'67',
        'subtitle': '1967 · Clásico',
        'image': 'assets/images/mustang_flutter.webp', // Requiere que tengas mustang.png en assets/images
      },
      {
        'title': 'Tesla Model 3',
        'subtitle': '2024 · Eléctrico',
        'image': 'assets/images/tesla_flutter.jpg', // Requiere que tengas tesla.png en assets/images
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('MotorMates', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications_none), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: mockVehicles.length,
        itemBuilder: (context, index) {
          final vehicle = mockVehicles[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Theme.of(context).colorScheme.surface,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Autor arriba de la foto del vehículo ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                          backgroundImage: const AssetImage('assets/images/toretto_feed.png'),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Usuario',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  // Imagen del vehículo dinámica
                  Container(
                    height: 180,
                    width: double.infinity,
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    // Si falla al cargar la imagen dinámica (porque no la tienes),
                    // puedes envolver esto en un errorBuilder para que muestre un ícono
                    child: Image.asset(
                      vehicle['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.directions_car, size: 64, color: Colors.grey),
                        );
                      },
                    ),
                  ),

                  // Textos inferiores de la tarjeta
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle['title']!,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          vehicle['subtitle']!,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurfaceVariant),
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
  }
}
