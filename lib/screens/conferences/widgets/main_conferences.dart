import 'package:flutter/material.dart';
import 'package:portafolio/core/constants/colors.dart';
import 'package:portafolio/core/widgets/container.dart';
import 'package:url_launcher/url_launcher.dart';

class MainConferences extends StatelessWidget {
  const MainConferences({super.key});

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = (constraints.maxWidth - 20) / 2;
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      5,
                      (index) => SizedBox(
                        width: itemWidth,
                        child: GestureDetector(
                          onTap: () async {
                            final url = Uri.parse(
                                'https://www.youtube.com/watch?v=dQw4w9WgXcQ&index=${index + 1}');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'No se pudo abrir el enlace.',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Card(
                            color: CustomColor.backgroundBase,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(10),
                                  ),
                                  child: Image.network(
                                    'https://images.ctfassets.net/wfutmusr1t3h/76t4nTJivJ65TAkbiwGO8V/7521a12bbb99b329e3895bf9b84cc9ee/660x284_DataRes_Email_Banner_Dark_all3.png?w=1280&q=75',
                                    width: double.infinity,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Conferencia ${index + 1}',
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.textFormColor,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        '3 - 7 Marzo | 10:00 am - 12:30 pm',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Cumple con las necesidades de cumplimiento y controla tu código como nunca antes.',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: CustomColor.textDesc,
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      const Text(
                                        'Enterprise',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
