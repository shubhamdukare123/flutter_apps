import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _QuizApp(),
    );
  }
}

class _QuizApp extends StatefulWidget {
  const _QuizApp();

  @override
  State<_QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<_QuizApp> {
  List allQuestions = [
    {
      "question": "Who is founder of Microsoft?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 1,
    },
    {
      "question": "Who is founder of Apple?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 0,
    },
    {
      "question": "Who is founder of C language?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 2,
    },
    {
      "question": "Who is founder of Linux?",
      "options": [
        "Steve Jobs",
        "Bill Gates",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 3,
    },
    {
      "question": "Who is founder of Java?",
      "options": [
        "Steve Jobs",
        "James Gosling",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 1,
    },
    {
      "question": "Who is founder of Core2web?",
      "options": [
        "Steve Jobs",
        "Shashi Bagal",
        "Dennis Ritchie",
        "Linus Torvalds"
      ],
      "correctOption": 1,
    }
  ];

  int currentIndex = 0;
  int selectedIndex = -1;
  bool questionPage = true;
  int score = 0;

  WidgetStatePropertyAll<Color?> giveColor(int optionIndex) {
    if (optionIndex == allQuestions[currentIndex]["correctOption"] &&
        selectedIndex != -1) {
      return const WidgetStatePropertyAll(Colors.green);
    }

    if (selectedIndex == optionIndex) {
      return const WidgetStatePropertyAll(Colors.red);
    }
    return const WidgetStatePropertyAll(null);
  }

  Scaffold isQuestion() {
    if (questionPage) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              children: [
                const SizedBox(width: 120),
                Text(
                  "Question : ${currentIndex + 1}/${allQuestions.length} ",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.cyan),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              allQuestions[currentIndex]["question"],
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  selectedIndex = 0;
                  if (selectedIndex ==
                      allQuestions[currentIndex]["correctOption"]) {
                    score++;
                  }
                  setState(() {});
                },
                   style: ButtonStyle(
                  backgroundColor: giveColor(0),
                ),
                child: Text(
                  allQuestions[currentIndex]["options"][0],
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
             
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  selectedIndex = 1;
                  if (selectedIndex ==
                      allQuestions[currentIndex]["correctOption"]) {
                    score++;
                  }
                  setState(() {});
                },
                 style: ButtonStyle(
                  backgroundColor: giveColor(1),
                ),
                child: Text(
                  allQuestions[currentIndex]["options"][1],
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
               
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  selectedIndex = 2;
                  if (selectedIndex ==
                      allQuestions[currentIndex]["correctOption"]) {
                    score++;
                  }
                  setState(() {});
                },
                style: ButtonStyle(
                  backgroundColor: giveColor(2),
                ),
                child: Text(
                  allQuestions[currentIndex]["options"][2],
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
                
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  selectedIndex = 3;
                  if (selectedIndex ==
                      allQuestions[currentIndex]["correctOption"]) {
                    score++;
                  }
                  setState(() {});
                },
                 style: ButtonStyle(
                  backgroundColor: giveColor(3),
                ),
                child: Text(
                  allQuestions[currentIndex]["options"][3],
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
               
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (currentIndex == allQuestions.length - 1) {
              questionPage = false;
              setState(() {});
            }

            if (currentIndex < allQuestions.length - 1 && selectedIndex != -1) {
              currentIndex++;
              selectedIndex = -1;
              setState(() {});
            }
          },
          child: const Icon(Icons.forward, color: Colors.blue, size: 35),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text(
            "Result",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.green,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
                height: 400,
                "assets/trophy.png"),
            const SizedBox(height: 30),
            const Text(
              "Congratulations for completing Quiz...!",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
            ),
            const SizedBox(height: 30),
            Text(
              "Score: $score/${allQuestions.length}",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Colors.yellow[900]),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                currentIndex = 0;
                selectedIndex = -1;
                score = 0;
                questionPage = true;
                setState(() {});
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.yellow),
              ),
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                ),
              ),
              
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestion();
  }
}
