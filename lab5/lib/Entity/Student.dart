class Person {
  final String id;
  final String name;
  final int age;
  Person({required this.id, required this.name, this.age = 0});

  String printMessage() => "Hello Person";
}

class Teacher extends Person {
  final String subject;
  Teacher({
    required super.id,
    required super.name,
    required super.age,
    required this.subject,
  });

  @override
  String printMessage() => "Hello Teacher";

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      subject: json['subject'] as String,
    );
  }
}

class Data<T> {
  final T value;
  Data(this.value);
}

class Student extends Person {
  final double gpa;
  Student({
    required super.id,
    required super.name,
    required super.age,
    this.gpa = 0,
  });

  @override
  String printMessage() => "Hello Student";

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String,
      name: json['name'] as String,
      age: json['age'] as int,
      gpa: (json['gpa'] as num).toDouble(),
    );
  }
}

void main() {
  var base = [2, 5, 8, 9, 4];
  var x = [
    ...base,
    for (var i in base)
      if (i % 2 == 0) i,
    for (var i in base)
      if (i % 2 != 0) i,
  ];
  print(x);

  Data<Student> data = Data(
    Student.fromJson({
      "id": "sv01",
      "name": "Nguyen Van A",
      "age": 20,
      "gpa": 3.5,
    }),
  );
  Teacher teacher = Teacher.fromJson({
    "id": "gv01",
    "name": "Tran Thi B",
    "age": 30,
    "subject": "Toan cao cap",
  });
  Student student = Student.fromJson({
    "id": "sv01",
    "name": "Nguyen Van A",
    "age": 20,
    "gpa": 3.5,
  });
}

class Student1 implements Person {
  @override
  final String id;
  @override
  final String name;
  @override
  final int age;
  Student1({required this.id, required this.name, this.age = 0});

  @override
  String printMessage() => "Hello Student";
}
