import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nexora Chat'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF6C63FF),
              child: Text(
                'U${index + 1}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text('User ${index + 1}'),
            subtitle: Row(
              children: [
                if (index % 3 == 0) ..[
                  const Icon(Icons.lock, size: 14, color: Colors.green),
                  const SizedBox(width: 4),
                ],
                Expanded(
                  child: Text(
                    index % 2 == 0
                        ? 'Hey! Want to grab coffee? ☕'
                        : 'Thanks for the payment! 💰',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${index + 9}:${30 + index} AM',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                if (index % 3 != 0) ..[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF6C63FF),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${index % 5 + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF6C63FF),
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}