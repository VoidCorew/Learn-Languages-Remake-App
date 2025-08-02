import 'package:flutter/material.dart';

class VoiceRecordingTask extends StatefulWidget {
  // final Lesson lesson;
  const VoiceRecordingTask({super.key});

  @override
  State<VoiceRecordingTask> createState() => _VoiceRecordingTaskState();
}

class _VoiceRecordingTaskState extends State<VoiceRecordingTask> {
  int? selectedIndex;
  final List<String> answers = ['Carotte', 'Pomme', 'Banane', 'Tomate'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1'),
        actions: [
          Image.asset('assets/images/flags/france.png', width: 24, height: 24),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    color: Colors.deepOrange[300],
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        children: [
                          Text(
                            'What is this item?',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ClipOval(
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Image.asset(
                                  'assets/images/flags/france.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          // const SizedBox(height: 30),
                          // GridView.builder(
                          //   shrinkWrap: true,
                          //   physics: NeverScrollableScrollPhysics(),
                          //   itemCount: answers.length,
                          //   itemBuilder: (context, index) {
                          //     final isSelected = selectedIndex == index;
                          //     return Material(
                          //       color: Colors.transparent,
                          //       borderRadius: BorderRadius.circular(20),
                          //       child: InkWell(
                          //         borderRadius: BorderRadius.circular(20),
                          //         onTap: () {
                          //           setState(() {
                          //             if (selectedIndex == index) {
                          //               selectedIndex = null;
                          //             } else {
                          //               selectedIndex = index;
                          //             }
                          //           });
                          //         },
                          //         child: Container(
                          //           padding: const EdgeInsets.all(10),
                          //           decoration: BoxDecoration(
                          //             color: isSelected
                          //                 ? Colors.grey[200]
                          //                 : Colors.white,
                          //             borderRadius: BorderRadius.circular(20),
                          //             border: isSelected
                          //                 ? Border.all(
                          //                     color: Colors.black54,
                          //                     width: 2,
                          //                   )
                          //                 : null,
                          //           ),
                          //           child: Text(
                          //             'Carotte',
                          //             textAlign: TextAlign.center,
                          //             style: TextStyle(
                          //               fontFamily: 'Nunito',
                          //               fontSize: 18,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     );
                          //   },
                          //   gridDelegate:
                          //       SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 2,
                          //         mainAxisSpacing: 10,
                          //         crossAxisSpacing: 10,
                          //         childAspectRatio: 3,
                          //       ),
                          // ),
                          const SizedBox(height: 60),

                          // const SizedBox(height: 20),

                          // Container(
                          //   decoration: BoxDecoration(
                          //     border: BoxBorder.all(color: Colors.red),
                          //   ),
                          //   child: Row(
                          //     children: [
                          //       Row(
                          //         mainAxisSize: MainAxisSize.min,
                          //         children: [
                          //           Container(
                          //             padding: const EdgeInsets.all(16.0),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(30),
                          //             ),
                          //             child: CircularProgressIndicator(),
                          //           ),
                          //           const SizedBox(width: 15),
                          //           const Text(
                          //             '0:15',
                          //             style: TextStyle(
                          //               fontFamily: 'Nunito',
                          //               fontSize: 20,
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(
                            Icons.skip_next_rounded,
                            color: Colors.deepOrangeAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.mic, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Tap to say',
                  style: TextStyle(fontSize: 20, fontFamily: 'Nunito'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
