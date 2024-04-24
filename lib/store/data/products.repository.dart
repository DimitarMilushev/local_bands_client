import 'package:dio/dio.dart';
import 'package:local_bands_client/shared/dio.provider.dart';
import 'package:local_bands_client/store/models/product.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products.repository.g.dart';

@riverpod
ProductsRepository productsRepository(ProductsRepositoryRef ref) =>
    ProductsRepository(client: ref.read(dioProvider));

class ProductsRepository {
  final Dio client;
  ProductsRepository({required this.client});

  Future<List<ProductModel>> getAllProducts() async {
    // final response = await client.get('/store/products');
    // final products = ProductsDto.fromJson({"products": response.data});
    // return products.products;

    return products;
  }

  Future<ProductModel> getProductById(int id) {
    //TODO: implement
    return Future.delayed(Duration(seconds: 2),
        () => products.firstWhere((element) => element.id == id));
  }
}

const products = [
  ProductModel(
      id: 1,
      name: "Banda #1",
      description: "Lorem ipsum",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
        "https://www.diskokids.co.uk/cdn/shop/files/IMG_9746_97501e8b-d7c9-4ed2-b676-4cc4ba49c8c2.jpg?v=1708606826",
        "https://threadheads.com.au/cdn/shop/files/HideThePainHarold-CustomDesign-Mockup_2e627725-7d34-43d5-ac86-f5c66a684cf6.jpg?v=1696219540&width=2048"
      ],
      price: 20,
      views: 211,
      isFavorite: false),
  ProductModel(
      id: 2,
      name: "Banda #2",
      description: "Lorem ipsum",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 5,
      views: 211,
      isFavorite: true),
  ProductModel(
      id: 3,
      name: "Banda #3",
      description: "Lorem ipsum",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 14,
      views: 24,
      isFavorite: false),
  ProductModel(
      id: 4,
      name: "Banda #4",
      description: "Lorem ipsum",

      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 33,
      views: 24,
      isFavorite: false),
  ProductModel(
      id: 1,
      name: "Banda #1",
      description: "Lorem ipsum",

      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 20,
      views: 11,
      isFavorite: false),
  ProductModel(
      id: 2,
      name: "Banda #2",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 5,
      views: 11,
      description: "Lorem ipsum",

      isFavorite: true),
  ProductModel(
      id: 3,
      name: "Banda #3",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 14,
      views: 211,
      description: "Lorem ipsum",

      isFavorite: false),
  ProductModel(
      id: 4,
      name: "Banda #4",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      views: 211,
      description: "Lorem ipsum",

      price: 33,
      isFavorite: false),
  ProductModel(
      id: 1,
      name: "Banda #1",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      description: "Lorem ipsum",
      price: 20,
      views: 211,
      isFavorite: false),
  ProductModel(
      id: 2,
      description: "Lorem ipsum",
      name: "Banda #2",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 5,
      views: 211,
      isFavorite: true),
  ProductModel(
      id: 3,
      description: "Lorem ipsum",
      name: "Banda #3",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 14,
      views: 211,
      isFavorite: false),
  ProductModel(
      id: 4,
      description: "Lorem ipsum",
      name: "Banda #4",
      photos: [
        "https://th.bing.com/th/id/R.2c9997728a8afbf087531bd468f69bb8?rik=46LuJ%2fwUO3%2fNdA&riu=http%3a%2f%2fmusicisimmortal.weebly.com%2fuploads%2f8%2f8%2f5%2f4%2f8854548%2f725737_orig.jpg&ehk=Uq41%2bx8GzTtFH5f%2btMJ%2fFOTwwB2weJrMK%2bsrTBSv3os%3d&risl=&pid=ImgRaw&r=0"
      ],
      price: 33,
      views: 211,
      isFavorite: false),
];
