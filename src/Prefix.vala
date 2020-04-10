namespace United {

    public enum Prefix {
        YOTTA,
        ZETA,
        EXA,
        PETA,
        TERA,
        GIGA,
        MEGA,
        KILO,
        NONE,
        MILLI,
        MICRO,
        NANO,
        PICO,
        FEMTO,
        ATTO,
        ZEPTO,
        YOCTO;

        public string to_string() {
            var result = "";
            switch (this) {
                case YOTTA:
                    result = "Y";
                    break;
                case ZETA:
                    result = "Z";
                    break;
                case EXA:
                    result = "E";
                    break;
                case PETA:
                    result = "P";
                    break;
                case TERA:
                    result = "T";
                    break;
                case GIGA:
                    result = "G";
                    break;
                case MEGA:
                    result = "M";
                    break;
                case KILO:
                    result = "k";
                    break;
                case NONE:
                    result = "";
                    break;
                case MILLI:
                    result = "m";
                    break;
                case MICRO:
                    result = "μ";
                    break;
                case NANO:
                    result = "n";
                    break;
                case PICO:
                    result = "p";
                    break;
                case FEMTO:
                    result = "f";
                    break;
                case ATTO:
                    result = "a";
                    break;
                case ZEPTO:
                    result = "z";
                    break;
                case YOCTO:
                    result = "y";
                    break;
            }

            return result;
        }
       
       
        public static Prefix from_string(string prefix) {
            var result = Prefix.NONE;
            switch (prefix) {
                case "Y":
                    result = Prefix.YOTTA;
                    break;
                case "Z":
                    result = Prefix.ZETA;
                    break;
                case "E":
                    result = Prefix.EXA;
                    break;
                case "P":
                    result = Prefix.PETA;
                    break;
                case "T":
                    result = Prefix.TERA;
                    break;
                case "G":
                    result = Prefix.GIGA;
                    break;
                case "M":
                    result = Prefix.MEGA;
                    break;
                case "k":
                    result = Prefix.KILO;
                    break;
                case "":
                    result = Prefix.NONE;
                    break;
                case "m":
                    result = Prefix.MILLI;
                    break;
                case "μ":
                    result = Prefix.MICRO;
                    break;
                case "n":
                    result = Prefix.NANO;
                    break;
                case "p":
                    result = Prefix.PICO;
                    break;
                case "f":
                    result = Prefix.FEMTO;
                    break;
                case "a":
                    result = Prefix.ATTO;
                    break;
                case "z":
                    result = Prefix.ZEPTO;
                    break;
                case "y":
                    result = Prefix.YOCTO;
                    break;
            }

            return result;
        }
    }
}
