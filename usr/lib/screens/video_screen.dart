import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nexora Video'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Tabs
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('For You', true),
                _buildCategoryChip('Following', false),
                _buildCategoryChip('Education', false),
                _buildCategoryChip('Entertainment', false),
                _buildCategoryChip('Tech', false),
                _buildCategoryChip('Business', false),
              ],
            ),
          ),
          // Video Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return _buildVideoCard(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFFFF0050),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Upload',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (bool value) {},
        backgroundColor: Colors.grey[100],
        selectedColor: const Color(0xFF6C63FF),
        labelStyle: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildVideoCard(int index) {
    final views = ['2.5M', '1.8M', '3.2M', '890K', '5.1M'];
    final titles = [
      'How to earn money online',
      'Best coding tips 2024',
      'Start your freelance career',
      'Master digital marketing',
      'Build your first app',
    ];
    final creators = [
      '@techguru',
      '@codemaster',
      '@freelanceking',
      '@marketingpro',
      '@appdeveloper',
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Thumbnail
            Container(
              color: Colors.grey[300],
              child: Icon(
                Icons.play_circle_outline,
                size: 60,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
            // Gradient Overlay
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      titles[index % titles.length],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      creators[index % creators.length],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.remove_red_eye,
                          size: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${views[index % views.length]} views',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Duration Badge
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  '5:23',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Earning Badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFD700).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.monetization_on, size: 12, color: Colors.white),
                    SizedBox(width: 2),
                    Text(
                      '+5',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}