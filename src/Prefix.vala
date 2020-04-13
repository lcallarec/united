namespace United {

    public class Prefix {

        public const int8 YOTTA  = 8;
        public const int8 ZETA   = 7;
        public const int8 EXA    = 6;
        public const int8 PETA   = 5;
        public const int8 TERA   = 4;
        public const int8 GIGA   = 3;
        public const int8 MEGA   = 2;
        public const int8 KILO   = 1; 
        public const int8 NONE   = 0;
        public const int8 MILLI  = -1;
        public const int8 MICRO  = -2;
        public const int8 NANO   = -3;
        public const int8 PICO   = -4;
        public const int8 FEMTO  = -5;
        public const int8 ATTO   = -6;
        public const int8 ZEPTO  = -7;
        public const int8 YOCTO  = -8;

        public int8 value;

        public Prefix(int8 value = Prefix.NONE) {
            this.value = value;
        }

        public int8 distance_from(Prefix prefix) {
            return prefix.value - this.value;
        }
        public string to_string() {
            var result = "";
            switch (this.value) {
                case Prefix.YOTTA:
                    result = "Y";
                    break;
                case Prefix.ZETA:
                    result = "Z";
                    break;
                case Prefix.EXA:
                    result = "E";
                    break;
                case Prefix.PETA:
                    result = "P";
                    break;
                case Prefix.TERA:
                    result = "T";
                    break;
                case Prefix.GIGA:
                    result = "G";
                    break;
                case Prefix.MEGA:
                    result = "M";
                    break;
                case Prefix.KILO:
                    result = "k";
                    break;
                case Prefix.NONE:
                    result = "";
                    break;
                case Prefix.MILLI:
                    result = "m";
                    break;
                case Prefix.MICRO:
                    result = "μ";
                    break;
                case Prefix.NANO:
                    result = "n";
                    break;
                case Prefix.PICO:
                    result = "p";
                    break;
                case Prefix.FEMTO:
                    result = "f";
                    break;
                case Prefix.ATTO:
                    result = "a";
                    break;
                case Prefix.ZEPTO:
                    result = "z";
                    break;
                case Prefix.YOCTO:
                    result = "y";
                    break;
            }

            return result;
        }
       
        public bool equals(int8 value) {
            return this.value == value;
        }

        public static Prefix from_string(string prefix) {
            var result = new Prefix(Prefix.NONE);
            switch (prefix) {
                case "Y":
                    result = new Prefix(Prefix.YOTTA);
                    break;
                case "Z":
                    result = new Prefix(Prefix.ZETA);
                    break;
                case "E":
                    result = new Prefix(Prefix.EXA);
                    break;
                case "P":
                    result = new Prefix(Prefix.PETA);
                    break;
                case "T":
                    result = new Prefix(Prefix.TERA);
                    break;
                case "G":
                    result = new Prefix(Prefix.GIGA);
                    break;
                case "M":
                    result = new Prefix(Prefix.MEGA);
                    break;
                case "k":
                    result = new Prefix(Prefix.KILO);
                    break;
                case "":
                    result = new Prefix(Prefix.NONE);
                    break;
                case "m":
                    result = new Prefix(Prefix.MILLI);
                    break;
                case "μ":
                    result = new Prefix(Prefix.MICRO);
                    break;
                case "n":
                    result = new Prefix(Prefix.NANO);
                    break;
                case "p":
                    result = new Prefix(Prefix.PICO);
                    break;
                case "f":
                    result = new Prefix(Prefix.FEMTO);
                    break;
                case "a":
                    result = new Prefix(Prefix.ATTO);
                    break;
                case "z":
                    result = new Prefix(Prefix.ZEPTO);
                    break;
                case "y":
                    result = new Prefix(Prefix.YOCTO);
                    break;
            }

            return result;
        }
    }

    //  public enum BinaryPrefix {
    //      YOTTA,
    //      ZETA,
    //      EXA,
    //      PETA,
    //      TERA,
    //      GIGA,
    //      MEGA,
    //      KILO;

    //      public string to_string() {
    //          var result = "";
    //          switch (this) {
    //              case YOTTA:
    //                  result = "Yi";
    //                  break;
    //              case ZETA:
    //                  result = "Zi";
    //                  break;
    //              case EXA:
    //                  result = "Ei";
    //                  break;
    //              case PETA:
    //                  result = "Pi";
    //                  break;
    //              case TERA:
    //                  result = "Ti";
    //                  break;
    //              case GIGA:
    //                  result = "Gi";
    //                  break;
    //              case MEGA:
    //                  result = "Mi";
    //                  break;
    //              case KILO:
    //                  result = "ki";
    //                  break;
    //              case NONE:
    //                  result = "i";
    //                  break;
    //              case MILLI:
    //                  result = "mi";
    //                  break;
    //              case MICRO:
    //                  result = "μi";
    //                  break;
    //              case NANO:
    //                  result = "ni";
    //                  break;
    //              case PICO:
    //                  result = "pi";
    //                  break;
    //              case FEMTO:
    //                  result = "fi";
    //                  break;
    //              case ATTO:
    //                  result = "ai";
    //                  break;
    //              case ZEPTO:
    //                  result = "zi";
    //                  break;
    //              case YOCTO:
    //                  result = "yi";
    //                  break;
    //          }

    //          return result;
    //      }
       
       
    //      public static BinaryPrefix from_string(string prefix) {
    //          var result = Prefix.NONE;
    //          switch (prefix) {
    //              case "Yi":
    //                  result = Prefix.YOTTA;
    //                  break;
    //              case "Zi":
    //                  result = Prefix.ZETA;
    //                  break;
    //              case "Ei":
    //                  result = Prefix.EXA;
    //                  break;
    //              case "Pi":
    //                  result = Prefix.PETA;
    //                  break;
    //              case "Ti":
    //                  result = Prefix.TERA;
    //                  break;
    //              case "Gi":
    //                  result = Prefix.GIGA;
    //                  break;
    //              case "Mi":
    //                  result = Prefix.MEGA;
    //                  break;
    //              case "ki":
    //                  result = Prefix.KILO;
    //                  break;
    //              case "i":
    //                  result = Prefix.NONE;
    //                  break;
    //              case "mi":
    //                  result = Prefix.MILLI;
    //                  break;
    //              case "μi":
    //                  result = Prefix.MICRO;
    //                  break;
    //              case "ni":
    //                  result = Prefix.NANO;
    //                  break;
    //              case "pi":
    //                  result = Prefix.PICO;
    //                  break;
    //              case "fi":
    //                  result = Prefix.FEMTO;
    //                  break;
    //              case "ai":
    //                  result = Prefix.ATTO;
    //                  break;
    //              case "zi":
    //                  result = Prefix.ZEPTO;
    //                  break;
    //              case "yi":
    //                  result = Prefix.YOCTO;
    //                  break;
    //          }

    //          return result;
    //      }
    //  }
}
