import 'package:flutter/material.dart';

class VehicleDetailScreen extends StatelessWidget {
  const VehicleDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.surface,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: Image.asset(
                  'assets/images/porsche_flutter.webp', // Reemplazamos el icono por la imagen real
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.directions_car, size: 80, color: Colors.grey),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Porsche',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  const Text(
                    '911 GT3',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2024 · Deportivo',
                    style: TextStyle(
                        fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 16),

                  // Fila de Estrellas (Rating)
                  Row(
                    children: [
                      ...List.generate(5, (index) => Icon(
                        Icons.star, color: Theme.of(context).colorScheme.primary, size: 20
                      )),
                      const SizedBox(width: 8),
                      const Text('5.0', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text(' · 3 reseñas', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Especificaciones (Scroll Horizontal)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSpecCard(context, '502 hp', 'Potencia'),
                        _buildSpecCard(context, '3.4 s', '0-100 km/h'),
                        _buildSpecCard(context, '318 km/h', 'Vel. máxima'),
                        _buildSpecCard(context, 'RWD', 'Tracción'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  const Text(
                    'Reseñas de la comunidad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Reseña quemada
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    // --- Avatar actualizado con imagen ---
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
                      backgroundImage: const AssetImage('assets/images/toretto_feed.png'),
                    ),
                    title: const Text('Rodrigo Salinas', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('El sonido del motor es otro nivel. Se siente pegado al piso en cada curva.'),
                    trailing: const Icon(Icons.favorite_border),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Helper local para extraer código reutilizable
  Widget _buildSpecCard(BuildContext context, String value, String label) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
