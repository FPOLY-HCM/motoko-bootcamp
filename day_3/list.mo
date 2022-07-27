module {
  public type List<T> = ?(T, List<T>);

  // Challenge 7
  public func is_null<T>(l : List<T>) : Bool {
    switch l {
      case null return true;
      case _ return false;
    };
  }

  // Challenge 8
  public func last<T>(l : List<T>) : ?T {
    switch l {
      case null { null };
      case (?(x, null)) { ?x };
      case (?(_, t)) { last<T>(t) };
    }
  }

  // Challenge 9
  public func size<T>(l : List<T>) : Nat {
    func rec(l : List<T>, n : Nat) : Nat {
      switch l {
        case null { n };
        case (?(_, t)) { rec(t, n + 1) };
      }
    };
    rec(l,0)
  }

  // Challenge 10
  public func get<T>(l : List<T>, n : Nat) : ?T {
    switch (n, l) {
      case (_, null) { null };
      case (0, (?(h, t))) { ?h };
      case (_, (?(_, t))) { get<T>(t, n - 1) };
    }
  };
}