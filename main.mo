import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Blob "mo:base/Blob";
import Float "mo:base/Float";
import Random "mo:base/Random";


actor {
    var question: Text = "Avidina un numero entre el 1 y el ";
    var randomNumber :Nat = 1;
    var maximo :Nat =1;
    let seed : Blob = "\14\C9\72\09\03\D4\D5\72\82\95\E5\43\AF\FA\A9\44\49\2F\25\56\13\F3\6E\C7\B0\87\DC\76\08\69\14\CF";
    let random = Random.Finite(seed);

    public func A_maximo_rango(number : Nat) : async Text {
        maximo := number;
        return "Registrado hasta donde se genera el numero aleatorio!!";
    };

    public query func B_juego() : async Text { 
      question # Nat.toText(maximo);
    };

     public func C_gerena_random() : async Text {
          randomNumber := switch (random.binomial(Nat8.fromNat(maximo))) {
            case(?value) Nat8.toNat(value);
            case(null) 0;
          };
        return "Ahora intenta advinar el numero!!"//Nat.toText(randomNumber);
    };   

    public func D_adivina_el_numero(number : Nat) : async Text {
        if (number == randomNumber) {
            return "¡Ganaste! El número era " # Nat.toText(randomNumber);
        } else if (number < randomNumber) {
            return "Demasiado bajo, inténtalo de nuevo.";
        } else {
            return "Demasiado alto, inténtalo de nuevo.";
        }
    };
}