import Cycles "mo:base/ExperimentalCycles";
import HashMap "mo:base/HashMap";
import List "mo:base/List";
import Principal "mo:base/Principal";
import Text "mo:base/Text";

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
    return Principal.isAnonymous(caller);
  };

  // Challenge 12
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

  // Challenge 13 + 14
  public shared({caller}) func add_favorite_number(n : Nat) : async Text {
    if (favoriteNumber.get(caller) == null) {
      favoriteNumber.put(caller, n);
      return "You've successfully registered your number";
    };
    return "You've already registered your number"
  };

  public shared({caller}) func show_favorite_number() : async ?Nat {
    return favoriteNumber.get(caller);
  };

  // Challenge 15
  public shared({caller}) func update_favorite_number(n : Nat) : async ?Nat {
    return favoriteNumber.replace(caller, n);
  };

  public shared({caller}) func delete_favorite_number() : async ?Nat {
    return favoriteNumber.remove(caller);
  };

  // Challenge 16
  public func deposit_cycles() : async Nat {
    let amount : Nat = Cycles.available();
    return Cycles.accept(amount);
  };
}