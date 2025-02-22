class Todos {
  int id;
  String title;
  String description;
  DateTime time;

  Todos({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
  });
}

List<Todos> sampleTodos = [
  Todos(
      id: 0,
      title: 'Greetings',
      description: 'Welcome to To-do',
      time: DateTime.now()),
  Todos(
      id: 1,
      title: 'Tour',
      description: 'You can edit a lot with this app',
      time: DateTime.now()),
  Todos(
      id: 2,
      title: 'Create',
      description: "Create Your Todos by typing",
      time: DateTime.now())
];
