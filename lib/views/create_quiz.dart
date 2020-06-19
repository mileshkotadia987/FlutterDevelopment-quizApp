import 'package:flutter/material.dart';
import 'package:quizzler/services/database.dart';
import 'package:quizzler/views/add_question.dart';
import 'package:quizzler/widgets/widgets.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription, quizId;
  DatabaseService databaseService = DatabaseService();
  bool isLoading = false;

  createQuizOnline() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
      quizId = randomAlphaNumeric(16);
      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizImage": quizImageUrl,
        "quizTitle": quizTitle,
        "quizDescription": quizDescription
      };
      await databaseService.addQuizData(quizMap, quizId).then((val) {
        setState(() {
          isLoading = false;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return AddQuestion(quizId);
          }));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: isLoading
          ? Container(
              child: Center(child: CircularProgressIndicator()),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "enter image url" : null;
                      },
                      decoration: InputDecoration(hintText: "Quiz image url"),
                      onChanged: (val) {
                        quizImageUrl = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "enter image title" : null;
                      },
                      decoration: InputDecoration(hintText: "Quiz image Title"),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    TextFormField(
                      validator: (val) {
                        return val.isEmpty ? "enter image description" : null;
                      },
                      decoration:
                          InputDecoration(hintText: "Quiz image Description"),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuizOnline();
                        },
                        child: blueButton(context: context,label: "Create Quiz")),
                    SizedBox(
                      height: 30.0,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
