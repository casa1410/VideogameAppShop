class Usuario {
  final int id;
  final String nombre;
  final String apellido;
  final String email;
  final String contrasena;
  final String numeroTelefono;
  final String direccion;

  Usuario({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.contrasena,
    required this.numeroTelefono,
    required this.direccion,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json["id"],
      nombre: json['nombre'],
      apellido: json['apellido'],
      email: json['email'],
      contrasena: json['contraseña'],
      numeroTelefono: json['numeroTelefono'],
      direccion: json['direccion'],
    );
  }
}
