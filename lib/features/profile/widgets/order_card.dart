import 'package:flutter/material.dart';
import 'package:flutter_profile_task/core/constants/app_colors.dart';
import 'package:flutter_profile_task/features/profile/data/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Order status + date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Order: ${order.status}',
              style: TextStyle(color: AppColors.orangeDark.withAlpha(90), fontWeight: FontWeight.w500),
            ),
            Text(
              order.date,
              style: TextStyle(color: AppColors.orangeDark.withAlpha(90)),
            ),
          ],
        ),

        /// Line Separator
        const SizedBox(height: 4),
        const Divider(
          color: Colors.grey,
          thickness: 0.3,
        ),

        /// Card Content
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  order.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              /// Product Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(order.item,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: AppColors.terracotta,
                              )),
                        ),

                        /// Icons (delete + plus)
                        Row(
                          children: [
                            Icon(Icons.delete_outline, color: AppColors.terracotta, size: 20),
                            const SizedBox(width: 8),
                            Icon(Icons.add_circle_outline, color: AppColors.terracotta, size: 20),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'In a lorem ipsum desc lorem ipsum desc lorem...',
                      style: TextStyle(color: Colors.grey),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${order.amount.toStringAsFixed(2)}'),
                        Text('${order.quantity}x uds.'),
                        Text('Total: \$${(order.amount * order.quantity).toStringAsFixed(2)}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
