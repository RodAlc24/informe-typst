#import "@local/informe:1.0.3": conf

#show: conf.with(
  // Título del documento:
  titulo: "Plantilla",

  // Asignatura, tema, departamento...
  asignatura: "Plantilla",

  // Nombre y correo de los autores:
  autores: (
    ("Nombre", "email@example.com"),
  ),

  // Número de pareja (opcional):
  // pareja: "1",

  // Número de grupo (opcional):
  // grupo: "2301",

  // Fecha, si no se especifica se usa por defecto con el formato MM/YYYY:
  // fecha: "Mayo 2025",

  // Resumen, aparece antes del índice (opcional):
  // resumen: [
  //
  // ],

  // Marca de agua, en gris y en diagonal (opcional):
  // marca_de_agua: "Borrador"
)

= Introducción
#lorem(200)

