import List "mo:base/List";
import Principal "mo:base/Principal";

import Animal "animal";
import Person "custom";

actor {
  public type Person = Person.Person;
  public type Animal = Animal.Animal;
  public type List<T> = ?(T, List<T>);

  // Challenge 1
  let person : Person = {
    name = "Ngo Quoc Dat";
    age = 19;
    address = "Ho Chi Minh";
    phone = 0372124043;
  };

  public func fun() : async Person {
    return person;
  };

  // Challenge 4
  public func create_animal_then_takes_a_break(specie : Text, energy : Nat) : async Animal {
    var animal : Animal = {
      specie = specie;
      energy = energy;
    };
    animal := Animal.animal_sleep(animal);
    return animal;
  };

  // Challenge 5
  var animals : List<Animal> = null;

  // Challenge 6
  public func push_animal(animal : Animal) : async () {
    animals := List.push(animal, animals);
  };

  public func get_animals() : async List<Animal> {
    return animals;
  };

  // Challenge 11
  public shared({caller}) func is_anonymous() : async Bool {
    return Principal.toText(caller) == "2vxsx-fae";
  };
}