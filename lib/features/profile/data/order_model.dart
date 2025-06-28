class OrderModel {
  final String item;
  final double amount;
  final String image;
  final String status;
  final String date;
  int quantity;

  OrderModel({
    required this.item,
    required this.amount,
    required this.image,
    required this.status,
    required this.date,
    required this.quantity,
  });
}
