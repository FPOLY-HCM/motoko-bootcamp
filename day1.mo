import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";

actor {
  // Challenge 1
  public func add(n : Nat, m : Nat) : async Nat {
    return n + m;
  };

  // Challenge 2
  public func square(n : Nat) : async Nat {
    return n * n;
  };

  // Chanllenge 3
  public func days_to_second(n : Nat) : async Nat {
    return n * 24 * 60 * 60;
  };

  // Challenge 4
  var counter : Nat = 0;

  public func increment_counter(n : Nat) : async Nat {
    counter += n;
    return counter;
  };

  public func clear_counter() : async Nat {
    counter := 0;
    return  counter;
  };

  // Challenge 5
  public func divide(n : Nat, m : Nat) : async Bool {
    return n % m == 0;
  };

  // Challenge 6
  public func is_even(n : Nat) : async Bool {
    return n % 2 == 0;
  };

  // Challenge 7
  public func sum_of_array(array : [Nat]) : async Nat {
    var sum : Nat = 0;
    for (value in array.vals()) {
      sum += value;
    };
    return sum;
  };

  // Challenge 8
  public func maximum(array : [Nat]) : async Nat {
    var max : Nat = 0;
    for (value in array.vals()) {
      if (value > max) {
        max := value;
      };
    };
    return max;
  };

  // Challenge 9
  public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
    let newArray = Buffer.Buffer<Nat>(3);
    for (value in array.vals()) {
      if (value != n) {
        newArray.add(value);
      };
    };
    return newArray.toArray();
  };

  // Challenge 10
  // private func swap(array : [Nat], i : Nat, j : Nat) : async [Nat] {
  //   let newArray : [var Nat] = Array.thaw(array);
  //   let tmp = newArray[i];
  //   newArray[i] := newArray[j];
  //   newArray[j] := tmp;
  //   return Array.freeze<Nat>(newArray);
  // };

  public func selection_sort(array : [Nat]) : async [Nat] {
    var sorted : [var Nat] = Array.thaw<Nat>(array);
    let size = sorted.size();
    for (i in Iter.range(0, size - 1)) {
      var min : Nat = i;
      for (j in Iter.range(i + 1, size - 1)) {
        if (sorted[j] < sorted[min]) {
          min := j;
        };
      };
      var temp : Nat = sorted[min];
      sorted[min] := sorted[i];
      sorted[i] := temp;
    };
    return Array.freeze<Nat>(sorted);
  };
}