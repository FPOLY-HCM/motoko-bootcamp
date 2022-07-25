import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";

actor {
  // Challenge 1
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if (n > 255) {
      return 0;
    };
    return Nat8.fromNat(n);
  };
}