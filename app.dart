// creating abstract classes
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print("========");
    describe();
    print("========");
  }
}

class Spacecraft {
  String name;
  DateTime launchDate;

  // Constructor with syntatic sugar for assignment to members
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here
  }

  // Named constructors that forwards
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear =>
    launchDate?.year;

  // Method
  void describe() {
    print("Spacecraft: $name");
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/
      365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

// dart has no interface, instead all classes implicitly define an interface.
// therefore, you can implement any class

class Orbiter extends Spacecraft {
  num altitude;

  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);
}

void main(List<String> args) {
  print("Hello World");
  var name = "Voyager I"; // string
  var year = 1977; // integer
  var antennaDiameter = 3.7; // floating point numbers
  var flybyobjects = ['Jupiter', "Saturn", "Uranus", "Neptune"]; // array
  var image = { // maps/dictionary/interface{} (for golang only)
    'tags' : ['saturn'],
    'url' : '//path/to/saturn.jpg'
  };

  if (year >= 2001) {
    print("21st century");
  } else if (year >= 1901) {
    print("20th century");
  }

  for (var object in flybyobjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while(year < 2016) {
    year += 1;
  }

  var result = fibonacci(20);
  print(result);


  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 15));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

}

/*
  Function to generate fibonacci series
*/

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
}

/*
  async (after function declaration) and async* ... await (before line of action within the function)

  e.g. 
  const oneSecond = Duration(seconds: 1);
  // ···
  Future<void> printWithDelay(String message) async {
    await Future.delayed(oneSecond);
    print(message);
  }
*/

/*
  exception handling

  Raising exception:
  if (astronauts == 0) {
    throw StateError('No astronauts.');
  }

  Catching exception:
  try {
  for (var object in flybyObjects) {
    var description = await File('$object.txt').readAsString();
    print(description);
  }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
 */