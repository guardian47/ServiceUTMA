import Random "mo:base/Random";


actor PasswordGenerator {
  public func generatePassword(length: Nat): async Text {
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()-_=+";
    var password = "";

    for (i in 0 until length) {
      let randomIndex = Random.nextInt(0, Array.length(chars) - 1);
      let randomChar = chars[randomIndex];
      password += String.fromChar(randomChar);
    };

    return password;
  };
};

