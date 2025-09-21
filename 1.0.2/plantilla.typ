#let conf(
  titulo: none,
  asignatura: none,
  autores: (),
  fecha: datetime.today().display("[month]/[year]"),
  grupo: none,
  pareja: none,
  resumen: none,
  marca_de_agua: none,
  doc,
) = {

  let autores_nombres =  ()
  for autor in autores {
    autores_nombres.push(autor.at(0))
  }

  set document(
    title: titulo,
    author: autores_nombres,
    description: asignatura,
    date: auto,
  )

  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 3cm),
    foreground: rotate(-55deg)[#text(100pt, fill: black.transparentize(60%))[#marca_de_agua]],
  )

  set heading(
    numbering: "1.",
  )

  set par(
    justify: true,
    leading: 0.75em,
    spacing: 1.8em,
  )

  set text(
    lang: "es",
    font: "new Computer Modern",
    size: 12pt,
  )

  show heading: set block(below: 1.2em)

  // Portada:
  align(center)[
    #text(17pt)[#smallcaps[*Universidad Autónoma de Madrid*]] \
    #text(17pt)[#smallcaps[Escuela Politécnica Superior]]
    #v(0.5cm)
    #line(length: 90%)
    #text(13pt)[*#asignatura*] \
    #text(22pt)[*#titulo*]
    #line(length: 90%, stroke: 1pt)
    #v(0.5cm)
    #text(17pt)[#smallcaps[Doble grado Matemáticas - Ingeniería Informática]]
    #v(0.5cm)
  ]

  align(center)[_Autores:_]
  grid(
    columns: (1fr, 0.5cm, 1fr),
    align(right)[
      #for autor in autores {
        let (nombre, _) = autor
        nombre + linebreak()
      }
    ],
    align(center)[

    ],
    align(left)[
      #for autor in autores {
        let (_, email) = autor
        link("mailto:" + email) + linebreak()
      }
    ]
  )

  if pareja != none {
    align(center)[_Pareja:_ #pareja]
  }

  if grupo != none {
    align(center)[_Grupo:_ #grupo]
  }

  align(center)[_Fecha:_ #fecha]

  v(1fr)
  figure(
    align(center)[
      #image("eps.svg", width: 35%)
    ]
  )

  v(2cm)
  pagebreak()

  counter(page).update(1)

  set page(header: [
    #set text(10pt)
    #asignatura
    #h(1fr) #titulo \
    #line(length: 100%)],
    numbering: "1"
  )

  // Resume e índice
  if resumen != none {
    heading(outlined: false, numbering: none)[Resumen]
    resumen
  }

  outline()

  pagebreak()

  doc
}
