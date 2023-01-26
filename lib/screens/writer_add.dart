import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/writer.dart';

class StudentAdd extends StatefulWidget {
  List<Writer> writers;

  StudentAdd(this.writers);

  @override
  State<StudentAdd> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  var formKey = GlobalKey<FormState>();
  var writer = Writer("", "", "01 Ocak 1899");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Yazar"),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButtom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Yazar Adı"),
      onSaved: (newValue) {
        writer.firstName = newValue;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Yazar Soyadı"),
      onSaved: (newValue) {
        writer.lastName = newValue;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Doğum Tarihi"),
      onSaved: (newValue) {
        writer.dateOfBirth = newValue!;
      },
    );
  }

  Widget buildSubmitButtom() {
    return ElevatedButton(
      onPressed: () {
        formKey.currentState!.save();
        widget.writers.add(writer);
        Navigator.pop(context);
      },
      child: const Text("Kaydet"),
    );
  }
}


//validate konuları
// güncelleme ve silme
