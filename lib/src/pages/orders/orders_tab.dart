import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as appData;

import 'components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => OrderTile(
                order: appData.orders[index],
              ),
          separatorBuilder: (_, index) => const SizedBox(height: 10),
          itemCount: appData.orders.length),
    );
  }
}
