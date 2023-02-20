class Producto {
  int id;
  String nombre;
  String img;
  int precio;
  String fechaCracion;

  Producto({
    required this.id,
    required this.nombre,
    required this.img,
    required this.precio,
    required this.fechaCracion,
  });

  factory Producto.fromJson(Map json) {
    return Producto(
        id: json["id"],
        nombre: json["nombre"],
        img: json["img"],
        precio: json["precio"],
        fechaCracion: json["fechaCracion"]);
  }
}
