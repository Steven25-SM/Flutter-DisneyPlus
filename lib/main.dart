import 'package:flutter/material.dart';

void main() => runApp(const DisneyLandingApp());

const navy = Color(0xFF040714);
const panel = Color(0xFF111827);
const blue = Color(0xFF0063E5);

class DisneyLandingApp extends StatelessWidget {
  const DisneyLandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney+ | Perú - Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: blue, brightness: Brightness.dark),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
      ),
      home: const DisneyLandingPage(),
    );
  }
}

class DisneyLandingPage extends StatefulWidget {
  const DisneyLandingPage({super.key});

  @override
  State<DisneyLandingPage> createState() => _DisneyLandingPageState();
}

class _DisneyLandingPageState extends State<DisneyLandingPage> {
  final plansKey = GlobalKey();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _scrollToPlans() {
    final target = plansKey.currentContext;
    if (target != null) {
      Scrollable.ensureVisible(target, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void _notice(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: navy,
              surfaceTintColor: navy,
              titleSpacing: 18,
              title: const DisneyLogo(size: 29),
              actions: [
                OutlinedButton(
                  onPressed: () => _notice('Pantalla de inicio de sesión pendiente.'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                  ),
                  child: const Text('INICIAR SESIÓN', style: TextStyle(fontSize: 10, letterSpacing: 0.7)),
                ),
                const SizedBox(width: 16),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _hero(),
                  _sectionTitle('Un mundo de historias te espera', 'Tus películas, series y deportes favoritos, en un solo lugar.'),
                  _brands(),
                  const SizedBox(height: 38),
                  _plans(),
                  _catalog(),
                  _benefits(),
                  _faqs(),
                  _footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _hero() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF11234E), Color(0xFF07112D), navy]),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/hero_disney.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const ColoredBox(color: Color(0xFF182B52)),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xAA040714), navy], stops: [0, .55, 1]),
                  ),
                ),
                const Positioned(bottom: 12, left: 0, right: 0, child: Center(child: DisneyLogo(size: 57))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 6, 24, 36),
            child: Column(
              children: [
                const Text('Tus historias favoritas,\nen un solo lugar', textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, height: 1.13, fontWeight: FontWeight.w800, color: Colors.white)),
                const SizedBox(height: 14),
                const Text('Películas, series originales y deportes en vivo. Disfruta donde quieras.',
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 15, height: 1.5, color: Colors.white70)),
                const SizedBox(height: 22),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    filled: true,
                    fillColor: const Color(0xFF30343F),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 17),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!emailController.text.contains('@')) {
                        _notice('Ingresa un correo electrónico válido.');
                      } else {
                        _scrollToPlans();
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: blue, foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                    child: const Text('SUSCRÍBETE AHORA', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: 0.6)),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Se requiere una suscripción. Contenido sujeto a disponibilidad.',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Colors.white54)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 22),
    child: Column(children: [
      Text(title, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w800)),
      const SizedBox(height: 10),
      Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, height: 1.5)),
    ]),
  );

  Widget _brands() {
    const brands = [
      'brand_disney.png',
      'brand_pixar.png',
      'brand_marvel.png',
      'brand_starwars.png',
      'brand_natgeo.png',
      'brand_espn.png',
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 22, 18, 0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 9,
          mainAxisSpacing: 9,
          childAspectRatio: 1.53,
        ),
        itemCount: brands.length,
        itemBuilder: (context, i) => Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color(0xFF1F2B46),
            border: Border.all(color: Colors.white24),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Image.asset(
            'assets/images/${brands[i]}',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(Icons.movie_outlined, color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }

  Widget _plans() => Padding(
    key: plansKey,
    padding: const EdgeInsets.fromLTRB(20, 40, 20, 22),
    child: Column(children: [
      const Text('Elige tu plan', style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
      const SizedBox(height: 7),
      const Text('Selecciona la experiencia ideal para ti.', textAlign: TextAlign.center),
      const SizedBox(height: 18),
      _planCard('Disney+ Estándar', 'Películas, series y favoritos para disfrutar.', ['Hasta 2 pantallas simultáneas', 'Contenido de Disney, Pixar, Marvel y más']),
      const SizedBox(height: 12),
      _planCard('Disney+ Premium', 'Más opciones para compartir y disfrutar.', ['Hasta 4 pantallas simultáneas', 'Acceso a deportes y programación según el plan'], highlighted: true),
      const SizedBox(height: 10),
      const Text('Consulta los precios y condiciones vigentes en la web oficial.', textAlign: TextAlign.center,
        style: TextStyle(fontSize: 11, color: Colors.white54)),
    ]),
  );

  Widget _planCard(String name, String description, List<String> perks, {bool highlighted = false}) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(19),
    decoration: BoxDecoration(
      color: panel,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: highlighted ? const Color(0xFF378DFF) : Colors.white24, width: highlighted ? 2 : 1),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (highlighted) const Padding(padding: EdgeInsets.only(bottom: 9), child: Text('MÁS BENEFICIOS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF80B9FF)))),
      Text(name, style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      Text(description),
      const SizedBox(height: 14),
      ...perks.map((p) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Row(children: [
        const Icon(Icons.check, color: Color(0xFF70A7FF), size: 19),
        const SizedBox(width: 9),
        Expanded(child: Text(p, style: const TextStyle(fontSize: 13))),
      ]))),
      const SizedBox(height: 12),
      SizedBox(width: double.infinity, child: FilledButton(
        onPressed: () => _notice('Esta es una maqueta de interfaz: suscripción no conectada.'),
        style: FilledButton.styleFrom(backgroundColor: blue, padding: const EdgeInsets.symmetric(vertical: 14)),
        child: const Text('ELEGIR PLAN', style: TextStyle(fontWeight: FontWeight.bold)),
      )),
    ]),
  );

  Widget _catalog() => Padding(
    padding: const EdgeInsets.fromLTRB(20, 26, 0, 20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(right: 20),
        child: Text('Historias para todos',
          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 15),
      SizedBox(height: 174, child: ListView(scrollDirection: Axis.horizontal, children: const [
        PosterImage(imagePath: 'assets/images/poster_disney.jpg'),
        PosterImage(imagePath: 'assets/images/poster_marvel.jpg'),
        PosterImage(imagePath: 'assets/images/poster_starwars.jpg'),
        PosterImage(imagePath: 'assets/images/poster_pixar.jpg'),
      ])),
    ]),
  );

  Widget _benefits() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 30),
    child: Column(children: [
      const Icon(Icons.devices, size: 68, color: Color(0xFF9DBDFF)),
      const SizedBox(height: 16),
      _sectionTitle('Cuándo y dónde quieras', 'Disfruta tus favoritos en el celular, tablet, computadora o televisor compatible.'),
    ]),
  );

  Widget _faqs() {
    const questions = <String, String>{
      '¿Qué incluye Disney+?': 'Películas, series, originales y deportes según tu plan y disponibilidad regional.',
      '¿Cómo puedo pagar?': 'Disney+ Perú informa opciones como tarjetas, PayPal y proveedores de TV participantes.',
      '¿Dónde puedo ver Disney+?': 'En dispositivos móviles, navegadores y televisores o consolas compatibles.',
    };
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 30, 18, 35),
      child: Column(children: [
        const Text('Preguntas frecuentes', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 18),
        ...questions.entries.map((e) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor: const Color(0xFF1B1D29),
            collapsedBackgroundColor: const Color(0xFF1B1D29),
            iconColor: Colors.white,
            collapsedIconColor: Colors.white,
            title: Text(e.key, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
            children: [Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 18), child: Align(alignment: Alignment.centerLeft, child: Text(e.value, style: const TextStyle(height: 1.5))))],
          ),
        ))),
      ]),
    );
  }

  Widget _footer() => const Padding(
    padding: EdgeInsets.fromLTRB(22, 20, 22, 38),
    child: Column(children: [
      DisneyLogo(size: 36),
      SizedBox(height: 18),
      Text('Privacidad  ·  Términos de uso  ·  Centro de ayuda', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
      SizedBox(height: 12),
      Text('Diseño demostrativo con fines educativos. No afiliado a Disney.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54, fontSize: 11)),
    ]),
  );
}

class DisneyLogo extends StatelessWidget {
  final double size;
  const DisneyLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) => Text('Disney+',
    style: TextStyle(fontSize: size, color: Colors.white, fontFamily: 'serif', fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, letterSpacing: -2));
}

class PosterImage extends StatelessWidget {
  final String imagePath;
  const PosterImage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) => Container(
    width: 125,
    margin: const EdgeInsets.only(right: 11),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: const Color(0xFF1F2B46),
    ),
    child: Image.asset(
      imagePath,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.white70, size: 42),
      ),
    ),
  );
}
