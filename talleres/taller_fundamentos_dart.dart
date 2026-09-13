// Taller de fundamentos de la programacion


void main() {
  parte1FichaEstudiante();
  parte2NullSafety();
  parte3Funciones();
  parte4Colecciones();
  parte5ControlDeFlujo();
  parte6ClasesYPoo();
  retoIntegradorTareas();
}

// 1) Variables y tipos
void parte1FichaEstudiante() {
  print('\n 1)  Ficha digital de estudiante');

  String nombre = 'juan jose agudelo';
  int edad = 19;
  double promedio = 3.7;
  bool matriculaActiva = true;
  String programa = 'tecnologia en Desarrollo de Software';

  print('Ficha del estudiante');
  print('Nombre: $nombre');
  print('Edad: $edad años');
  print('Programa: $programa');
  print('Promedio acumulado: $promedio');
  print('Estado de matrícula: ${matriculaActiva ? "Activa" : "Inactiva"}');

  // 1) 
  // Si la edad se guardara como String en vez de int, cualquier cálculo
  // por ejemplo, saber si es mayor de edad, o promediar edades de un
  // grupo requeriría convertir el texto a número con int.parse() antes
  // de poder operar. Eso agrega un paso extra y un riesgo real, si el
  // dato viene mal formado como con espacios, letras, vacío, int.parse() lanza
  // una excepción en tiempo de ejecución. Guardarlo directamente como
  // int evita esa conversión y detecta errores de tipo desde que se
  // escribe el código, no cuando el programa ya está corriendo.
}

// 2)  Null safety 
void parte2NullSafety() {
  print('\n 2)  Null safety');

  // El apodo es nullable porque no todos los estudiantes lo tienen
  // registrado, es información opcional del sistema.
  String? apodo = 'juan';
  String? apodoSinRegistrar;

  void mostrarApodo(String? valor) {
    if (valor != null) {
      print('Apodo registrado: $valor');
    } else {
      print('Este estudiante no tiene apodo registrado.');
    }
  }

  mostrarApodo(apodo);
  mostrarApodo(apodoSinRegistrar);

  // Ejemplo del operador !
  String apodoConfirmado = apodo!; // válido porque apodo no es null aquí
  print('Uso seguro de "!": $apodoConfirmado');

  // 2) 
  // Justificación: nombre, edad y programa son datos que el
  // sistema exige para que la matrícula exista, así que no deberían
  // ser nullable, su ausencia sería un error de datos, no un caso
  // normal. El apodo, en cambio, es un dato opcional del mundo real,
  // es perfectamente válido que un estudiante nunca lo haya registrado,
  // por eso se modela como String?.
  //
  // Si se usa el operador ! sobre una variable que sí es null por
  // ejemplo, apodoSinRegistrar!, el analizador de Dart en DartPad NO
  // marca error al escribir el código, porque el tipo declarado es
  // String y ! "promete" al compilador que en ese punto no es null.
  // El error aparece en tiempo de ejecución, se lanza una excepción
  // (Null check operator used on a null value) apenas se ejecuta esa línea.

}

// 3)  Funciones 
void parte3Funciones() {
  print('\n 3) Funciones');

  List<double> notasSemestre = [5, 3.5, 3, 3, 4];
  List<double> notasVacias = [];

  print('¿Aprueba con 3.5?: ${estudianteAprueba(3.5)}');
  print('¿Aprueba con 2.9?: ${estudianteAprueba(2.9)}');

   print('Promedio del semestre: ${calcularPromedio(notasSemestre).toStringAsFixed(2)}');
  print('Promedio con lista vacía: ${calcularPromedio(notasVacias)}');

  // 3) 
  // calcularPromedio() sí podría fallar si la lista llega vacía, porque
  // dividir la suma (0) entre la cantidad de notas (0) produciría una
  // división por cero (NaN en Dart, ya que trabajamos con double). Por
  // eso la función valida explícitamente ese caso antes de dividir y
  // devuelve 0.0 junto con un mensaje, en lugar de dejar que el error
  // se propague silenciosamente como NaN o not a number.
}

// Función flecha: es una sola expresión booleana, ideal para "=>"
bool estudianteAprueba(double nota) => nota >= 3.0;

// Función con validación de lista vacía
double calcularPromedio(List<double> notas) {
  if (notas.isEmpty) {
    print('Advertencia: no hay notas para promediar.');
    return 0.0;
  }
  double suma = notas.fold(0.0, (acumulado, nota) => acumulado + nota);
  return suma / notas.length;
}

// 4)  Colecciones 
void parte4Colecciones() {
  print('\n 4) Colecciones');

  // List: los asistentes del día pueden repetirse por error de registro,
  // y el orden de llegada importa -> List permite duplicados y mantiene orden.
  List<String> asistentesDelDia = [
    'juan jose agudelo',
    'Julian betancurt',
    'juan guillermo',
    'Andrés alomia',
  ];
  print('Asistentes del día: $asistentesDelDia');
  print('Total de registros de asistencia: ${asistentesDelDia.length}');

  // Set: los lenguajes que un estudiante ya conoce no deberían repetirse
  // -> Set garantiza unicidad automáticamente.
  Set<String> lenguajesConocidos = {'Dart', 'Python', 'Java'};
  lenguajesConocidos.add('Python'); // intento de duplicado
  print('Lenguajes conocidos (sin duplicados): $lenguajesConocidos');

  // Map: se necesita buscar rápido la nota de un estudiante por su nombre
  // -> Map asocia una clave (nombre) con un valor (nota) en O(1) aprox.
  Map<String, double> notasPorEstudiante = {
    'juan jose agudelo': 3.7,
    'Julian betancurt': 3.8,
    'Andrés alomia': 2.9,
  };
  print('Nota de Julian betancurt: ${notasPorEstudiante['Julian betancurt']}');

  // 4)
  // Si se usara una List en vez de un Set para los lenguajes conocidos,
  // el valor repetido ('Python') sí quedaría guardado dos veces:
  List<String> lenguajesComoLista = ['Dart', 'Python', 'Java'];
  lenguajesComoLista.add('Python');
  print('Comprobación con List (permite duplicado): $lenguajesComoLista');
  // Esto rompe la intención del modelo de que un lenguaje conocido no debería
  // contarse dos veces y obligaría a validar manualmente los duplicados
  // antes de insertar, algo que Set resuelve de forma nativa.
}

// 5)  Control de flujo 
void parte5ControlDeFlujo() {
  print('\n 5)  Control de flujo');

  // Problema A)  clasificación de rendimiento con for
  print('Problema A)  clasificación de rendimiento');
  List<double> notasCurso = [1.8, 3.0, 4.7, 2.5, 3.9, 4.9, 3.4, 2.0];

  int reprobados = 0;
  int aprobados = 0;
  int sobresalientes = 0;

  for (double nota in notasCurso) {
    if (nota < 3.0) {
      reprobados++;
    } else if (nota < 4.5) {
      aprobados++;
    } else {
      sobresalientes++;
    }
  }

  print('Reprobados: $reprobados');
  print('Aprobados: $aprobados');
  print('Sobresalientes: $sobresalientes');

  // Problema B)  intentos de contraseña con while
  print(' Problema B)  intentos de contraseña ');
  const String claveCorrecta = 'solyyuli';
  List<String> intentosSimulados = ['123456789', 'hola_mundo', '1036'];

  int maxIntentos = 3;
  int intentoActual = 0;
  bool accesoConcedido = false;

  while (intentoActual < maxIntentos && !accesoConcedido) {
    String claveIngresada = intentosSimulados[intentoActual];
    intentoActual++;

    if (claveIngresada == claveCorrecta) {
      accesoConcedido = true;
      print('Intento $intentoActual: acceso concedido.');
    } else {
      print('Intento $intentoActual: clave incorrecta.');
    }
  }

  if (!accesoConcedido) {
    print('Acceso bloqueado tras $maxIntentos intentos fallidos.');
  }

  // 5) 
  // El problema A se resuelve mejor con for porque la cantidad de
  // elementos a recorrer se conoce de antemano que son la lista completa de notas, 
  // for está diseñado para iterar sobre una colección finita
  // y conocida, un elemento a la vez, hasta agotarla. El problema B, en
  // cambio, depende de una condición que puede cambiar en cualquier
  // momento durante la ejecución que es que la clave sea correct y no de un
  // número fijo de elementos a recorrer. while es más natural cuando la
  // repetición depende de una condición lógica que se evalúa en cada
  // vuelta, y no de un contador predecible desde el inicio.
}

// 6)  Clases y POO 
class Estudiante {
  String nombre;
  int semestre;
  List<double> notas;

  Estudiante(this.nombre, this.semestre, this.notas);

  double get promedio {
    if (notas.isEmpty) return 0.0;
    return notas.fold(0.0, (a, b) => a + b) / notas.length;
  }

  bool estaAlDia() {
    // Se considera "al día" si tiene notas registradas y su promedio
    // es de aprobación (>= 3.0).
    return notas.isNotEmpty && promedio >= 3.0;
  }

  void mostrarEstado() {
    String estado = estaAlDia() ? 'al día' : 'NO al día';
    print(
      '$nombre (semestre $semestre) — promedio: ${promedio.toStringAsFixed(2)} — $estado',
    );
  }
}

void parte6ClasesYPoo() {
  print('\n 6)  Clases y POO');

  List<Estudiante> estudiantes = [
    Estudiante('juan jose agudelo', 4, [4.5, 4.0, 3.8]),
    Estudiante('Julian betancurt', 6, [3.9, 4.2, 4.0]),
    Estudiante('Andrés alomia', 3, [2.0, 2.5, 2.8]), // no está al día
    Estudiante('juan guillermo', 2, []), // sin notas registradas
  ];

  for (Estudiante e in estudiantes) {
    e.mostrarEstado();
  }

  // 6) 
  // Modelarlo como clase agrupa nombre, semestre y notas en una sola
  // unidad coherente por estudiante, así que es imposible que se
  // desincronicen entre sí. Con tres listas paralelas que son nombres,
  // semestres, promedios, hay que confiar en que la posición i de cada
  // lista siempre corresponda a la misma persona, basta con un solo
  // insert(), remove() o sort() aplicado a una sola lista y no a las
  // otras para romper esa correspondencia sin que el compilador lo
  // detecte. La clase también permite agregar comportamiento propio
  // (como estaAlDia()) junto a los datos, en vez de tener esa lógica
  // suelta en otra parte del programa operando sobre índices.
}

// Reto integrador)  Sistema de gestión de tareas 
enum Prioridad { baja, media, alta }

class Tarea {
  String titulo;
  Prioridad prioridad;
  bool completada;

  Tarea(this.titulo, this.prioridad, {this.completada = false});

  void marcarCompletada() {
    completada = true;
  }

  String get etiquetaPrioridad {
    switch (prioridad) {
      case Prioridad.alta:
        return 'ALTA';
      case Prioridad.media:
        return 'MEDIA';
      case Prioridad.baja:
        return 'BAJA';
    }
  }

  @override
  String toString() {
    String estado = completada ? '[x]' : '[ ]';
    return '$estado $titulo — $etiquetaPrioridad';
  }
}

void retoIntegradorTareas() {
  print('\n RETO INTEGRADOR)  Gestión de tareas');

  List<Tarea> tareas = [
    Tarea('Subir taller de Dart a GitHub', Prioridad.alta),
    Tarea('Quiz conceptual (SO y tipos de app)', Prioridad.media),
    Tarea('Revisar nuevos trabajos', Prioridad.media),
    Tarea('estudiar integrales', Prioridad.baja),
    Tarea('Preparar taller de calculo', Prioridad.alta),
  ];

  // Marcar una tarea como completada después de creada
  tareas[1].marcarCompletada();

  print('Listado completo de tareas');
  for (Tarea t in tareas) {
    print(t);
  }

  int pendientes = tareas.where((t) => !t.completada).length;
  print('\nTareas pendientes: $pendientes de ${tareas.length}');

  // Bonus) conteo por nivel de prioridad
  Map<Prioridad, int> conteoPorPrioridad = {
    Prioridad.alta: 0,
    Prioridad.media: 0,
    Prioridad.baja: 0,
  };
  for (Tarea t in tareas) {
    conteoPorPrioridad[t.prioridad] = conteoPorPrioridad[t.prioridad]! + 1;
  }
  print('\n Conteo por prioridad ');
  print('Alta: ${conteoPorPrioridad[Prioridad.alta]}');
  print('Media: ${conteoPorPrioridad[Prioridad.media]}');
  print('Baja: ${conteoPorPrioridad[Prioridad.baja]}');

  // Para pensar (Reto integrador):
  // El diseño sí resistiría agregar una fecha límite opcional: bastaría
  // con añadir un campo DateTime? fechaLimite a la clase Tarea (nullable,
  // porque no toda tarea tendría una fecha obligatoria) sin tocar el
  // resto del programa, ya que la lógica de pendientes, iteración y
  // conteo por prioridad no depende de ese campo. Si se quisiera, además,
  // ordenar o alertar por vencimiento, se agregarían métodos nuevos
  // (por ejemplo, estaVencida()) sin modificar los ya existentes, eso
  // es justamente la ventaja de haber modelado Tarea como clase desde
  // el inicio en vez de listas paralelas.
}
