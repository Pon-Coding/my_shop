class ProductModel {
  late int id;
  late String name;
  late String image;
  late double price;
  late int color;
  late int qty;

  ProductModel({
    this.id = 0,
    this.name = "No Name",
    this.image = "No Image",
    this.price = 0.0,
    this.color = 0,
    this.qty = 0,
    
  });
}

List<ProductModel> productList = [
  ProductModel(
    id: 1,
    name: "Dragon Ball",
    image: "assets/images/shoe2.png",
    price: 250,
    color: 0xFFcdc7be,
    qty: 1,
  ),
  ProductModel(
    id: 2,
    name: "CG-Air 23",
    image: "assets/images/shoe3.png",
    price: 110,
    color: 0xFF232b33,
    qty: 1,
  ),
  ProductModel(
    id: 3,
    name: "Groc-Band",
    image: "assets/images/shoe4.png",
    price: 99,
    color: 0xFF8e6b48,
    qty: 1,
  ),
  ProductModel(
    id: 4,
    name: "White-CS3",
    image: "assets/images/shoe5.png",
    price: 45,
    color: 0xFF7a1140,
    qty: 1,
  ),
  ProductModel(
    id: 5,
    name: "Nike-ED6",
    image: "assets/images/shoe6.png",
    price: 780,
    color: 0xFF224832,
    qty: 1,
  ),
  ProductModel(
    id: 6,
    name: "Classic A1",
    image: "assets/images/shoe7.png",
    price: 78,
    color: 0xFF49272b,
    qty: 1,
  ),
];


