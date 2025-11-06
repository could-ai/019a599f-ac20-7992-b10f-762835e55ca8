import 'package:flutter/material.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nexora Market'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFF6C63FF),
          labelColor: const Color(0xFF6C63FF),
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'Freelancers'),
            Tab(text: 'Products'),
            Tab(text: 'Services'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildFreelancersTab(),
          _buildProductsTab(),
          _buildServicesTab(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: const Color(0xFF6C63FF),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Start Selling',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildFreelancersTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        final services = ['UI/UX Design', 'Web Development', 'Content Writing', 'Video Editing', 'SEO Marketing'];
        final prices = ['\$50/hr', '\$75/hr', '\$30/hr', '\$40/hr', '\$45/hr'];
        final ratings = ['4.9', '5.0', '4.8', '4.7', '4.9'];
        
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF6C63FF),
                    child: Text(
                      'F${index + 1}',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Freelancer ${index + 1}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (index % 3 == 0)
                              const Icon(Icons.verified, size: 16, color: Colors.blue),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          services[index % services.length],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 14, color: Color(0xFFFFD700)),
                            const SizedBox(width: 4),
                            Text(
                              '${ratings[index % ratings.length]} (${50 + index * 10} reviews)',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    prices[index % prices.length],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF6C63FF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Professional designer with 5+ years experience. Specialized in mobile apps and web design. Fast delivery guaranteed.',
                style: TextStyle(fontSize: 13, color: Colors.black87),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat, size: 18),
                      label: const Text('Chat'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF6C63FF),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.work, size: 18),
                      label: const Text('Hire'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6C63FF),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProductsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        final products = ['Wireless Headphones', 'Smart Watch', 'Laptop Stand', 'Phone Case', 'USB Cable'];
        final prices = ['\$79.99', '\$199.99', '\$34.99', '\$14.99', '\$9.99'];
        
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.inventory_2_outlined,
                      size: 60,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index % products.length],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Color(0xFFFFD700)),
                        const SizedBox(width: 4),
                        Text(
                          '4.${5 + (index % 4)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        const Spacer(),
                        Text(
                          prices[index % prices.length],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildServicesTab() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10,
      itemBuilder: (context, index) {
        final services = [
          'Professional Logo Design',
          'Website Development',
          'Social Media Marketing',
          'Video Production',
          'SEO Optimization',
        ];
        final descriptions = [
          'Custom logo design with unlimited revisions',
          'Full-stack web development from scratch',
          'Grow your brand with targeted campaigns',
          'Professional video editing and effects',
          'Rank higher on search engines',
        ];
        final prices = ['Starting at \$150', 'Starting at \$500', 'Starting at \$200', 'Starting at \$300', 'Starting at \$250'];
        
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.design_services,
                  size: 40,
                  color: Color(0xFF6C63FF),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      services[index % services.length],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      descriptions[index % descriptions.length],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.verified_user, size: 14, color: Colors.green),
                        const SizedBox(width: 4),
                        Text(
                          prices[index % prices.length],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6C63FF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}