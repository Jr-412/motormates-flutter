import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Rodrigo Salinas', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header con Cover y Avatar superpuesto
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomLeft,
              children: [
                // Portada
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Image.asset(
                    'assets/images/profile_cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Avatar (Caja redondeada con borde, como en Android)
                Positioned(
                  bottom: -40,
                  left: 20,
                  child: Container(
                    width: 84,
                    height: 84,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 4,
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/toretto_feed.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50), // Espacio para compensar el avatar superpuesto

            // Información del usuario
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Rodrigo Salinas',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '@rodrigo',
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Fan de los deportivos y los track days. Compartiendo las mejores experiencias sobre ruedas.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 16),

                  // Botones de acción (Seguir / Mensaje)
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Seguir',
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomButton(
                          text: 'Enviar Mensaje',
                          isOutlined: true,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Estadísticas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatItem('12', 'Reseñas'),
                _buildStatItem('45', 'Seguidores'),
                _buildStatItem('32', 'Siguiendo'),
              ],
            ),
            const SizedBox(height: 16),

            // Tabs simulados (Diseño básico)
            Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTabItem(context, 'Reseñas', isActive: true),
                  _buildTabItem(context, 'Garaje', isActive: false),
                ],
              ),
            ),

            // Contenido simulado de Reseñas
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Text('Tus reseñas aparecerán aquí'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildTabItem(BuildContext context, String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: isActive
            ? Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 3))
            : null,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.white : Colors.grey,
        ),
      ),
    );
  }
}