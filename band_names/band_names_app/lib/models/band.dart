class Band {
  String id;
  String name;
  int votes;

  Band({required this.id, required this.name, required this.votes});

  factory Band.fromMap(Map<String, dynamic> input) => Band(
        id: input['id'],
        name: input['name'],
        votes: input['votes'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'votes': votes,
      };
}
