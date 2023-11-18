import 'lists.dart';

void addTobag(
    {required String brand,
    required String model,
    required String imageUrl,
    required double size,
    required int price}) {
  basket.add([brand, model, imageUrl, size, price]);
}
