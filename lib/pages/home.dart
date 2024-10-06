import 'package:flutter/material.dart';
import 'package:portafolio/constants/nav_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // AppBar
          AppBar(
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < navTitles.length; i++)
                  Text(navTitles[i],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyanAccent,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.blueAccent,
                            offset: Offset(0, 0),
                          ),
                        ],
                      )),
              ],
            ),
          ),
          // Profile
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.cyanAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.cyanAccent),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SOFTWARE DEVELOPER',
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.w300,
                                color: Colors.cyanAccent,
                                shadows: [
                                  Shadow(
                                    blurRadius: 20.0,
                                    color: Colors.blueAccent,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              )),
                          SizedBox(height: 8),
                          Text(
                              'Con más líneas de código que horas de sueño, me muevo en el umbral donde la tecnología y la creatividad colisionan. Mi misión: optimizar el caos digital y reprogramar el futuro. Como desarrollador full-stack, no solo construyo aplicaciones, hackeo la realidad para diseñar sistemas eficientes y escalables, adaptándome a la velocidad del cambio. El ciberespacio es mi lienzo y el código, mi pincel.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w200,
                                color: Colors.white,
                              )),
                          SizedBox(height: 8),
                        ]),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.cyanAccent),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    height: 100,
                    child: const Center(child: Text("Sección 2")),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.cyanAccent),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.cyanAccent.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(0, 0),
                        ),
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 10,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    height: 100,
                    child: const Center(child: Text("Sección 3")),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
