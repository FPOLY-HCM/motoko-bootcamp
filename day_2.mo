import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

actor {
  // Challenge 1
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if (n > 255) {
      return 0;
    };
    return Nat8.fromNat(n);
  };

  // Challenge 2
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return (2 ** n) - 1;
  };

  // Challenge 3
  public func decimals_to_bits(n : Nat) : async Text {
    var bits = "";
    var i = n;
    while (i > 0) {
      if (i % 2 == 1) {
        bits := "1" # bits;
      } else {
        bits := "0" # bits;
      };
      i := i / 2;
    };
    return bits;
  };

  // Challenge 6
  public func is_inside(t : Text, c : Text) : async Bool {
    return Text.contains(t, #text c);
  };

  // Challenge 7
  public func trim_whitespace(t : Text) : async Text {
    return Text.trim(t, #text(" "));
  };

  // Challenge 9
  public func size_in_bytes(t : Text) : async Nat {
    return Text.encodeUtf8(t).size();
  };

  // Challenge 10
  public func bubble_sort(array : [Nat]) : async [Nat] {
    var sorted : [var Nat] = Array.thaw<Nat>(array);
    let size : Nat = sorted.size();
    for (i in Iter.range(0, size - 1)) {
      for (j in Iter.range(0, size - 1 - i - 1)) {
        if (sorted[j] > sorted[j + 1]) {
          let tmp = sorted[j];
          sorted[j] := sorted[j + 1];
          sorted[j + 1] := tmp;
        }
      };
    };
    return Array.freeze<Nat>(sorted);
  };

  // Challenge 12
  public func day_of_the_week(n : Nat) : async ?Text {
    return switch(n) {
      case 1 {
        return ?"Monday";
      };
      case 2 {
        return ?"Tuesday";
      };
      case 3 {
        return ?"Wednesday";
      };
      case 4 {
        return ?"Thurday";
      };
      case 5 {
        return ?"Friday";
      };
      case 6 {
        return ?"Saturday";
      };
      case 7 {
        return ?"Sunday";
      };
      case _ null;
    };
  };
}