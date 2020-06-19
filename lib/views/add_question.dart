import 'package:flutter/material.dart';
import 'package:quizzler/services/database.dart';
import 'package:quizzler/widgets/widgets.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  AddQuestion(this.quizId);
  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();
  String question, option1, option2, option3, option4;
  bool isLoading=false;
  DatabaseService databaseService=DatabaseService();

  uploadQuestionData()async{
    if(_formKey.currentState.validate()){
      setState(() {
        isLoading=true;
      });
      Map<String,String> mapQuestion={
        "question":question,
        "option1":option1,
        "option2":option2,
        "option3":option3,
        "option4":option4
      };
      await databaseService.addQuestionData(mapQuestion, widget.quizId).then((val){
        setState(() {
          isLoading=false;
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
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator(),),
      ) : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "enter question" : null;
                },
                decoration: InputDecoration(hintText: "question"),
                onChanged: (val) {
                  question = val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "enter option 1" : null;
                },
                decoration:
                    InputDecoration(hintText: "option 1(correct answer)"),
                onChanged: (val) {
                  option1 = val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "enter option 2" : null;
                },
                decoration: InputDecoration(hintText: "option 2"),
                onChanged: (val) {
                  option2 = val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "enter option 3" : null;
                },
                decoration: InputDecoration(hintText: "option 3"),
                onChanged: (val) {
                  option3 = val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              TextFormField(
                validator: (val) {
                  return val.isEmpty ? "enter option 4" : null;
                },
                decoration: InputDecoration(hintText: "option 4"),
                onChanged: (val) {
                  option4 = val;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              Spacer(),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: blueButton(
                        context: context,
                        label: "Submit",
                        buttonWidth: MediaQuery.of(context).size.width / 2 - 36),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      uploadQuestionData();
                    },
                    child: blueButton(
                        context: context,
                        label: "Add Question",
                        buttonWidth:
                            MediaQuery.of(context).size.width / 2 - 36),
                  )
                ],
              ),
              SizedBox(
                height: 40.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
