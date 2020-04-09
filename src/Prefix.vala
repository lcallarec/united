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
        HECTO,
        DECA,
        NONE,
        DECI,
        CENTI,
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
                case HECTO:
                    result = "h";
                    break;
                case DECA:
                    result = "da";
                    break;
                case NONE:
                    result = "";
                    break;
                case DECI:
                    result = "d";
                    break;
                case CENTI:
                    result = "c";
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
       
        public int32 to_factor() {
            int32 factor = 1;
            switch (this) {
                case YOTTA:
                    factor = (int32) Math.pow(10, 24);
                    break;
                case ZETA:
                    factor = (int32) Math.pow(10, 21);
                    break;
                case EXA:
                    factor = (int32) Math.pow(10, 18);
                    break;
                case PETA:
                    factor = (int32) Math.pow(10, 15);
                    break;
                case TERA:
                    factor = (int32) Math.pow(10, 12);;
                    break;
                case GIGA:
                    factor = (int32) Math.pow(10, 9);
                    break;
                case MEGA:
                    factor = (int32) Math.pow(10, 6);
                    break;
                case KILO:
                    factor = 1000;
                    break;
                case HECTO:
                    factor = 1000;
                    break;
                case DECA:
                    factor = 10;
                    break;
                case NONE:
                    factor = 1;
                    break;
                case DECI:
                    factor = (int32) Math.pow(10, -1);
                    break;
                case CENTI:
                    factor = (int32) Math.pow(10, -2);
                    break;
                case MILLI:
                    factor = (int32) Math.pow(10, -3);
                    break;
                case MICRO:
                    factor = (int32) Math.pow(10, -6);
                    break;
                case NANO:
                    factor = (int32) Math.pow(10, -9);
                    break;
                case PICO:
                    factor = (int32) Math.pow(10, -12);
                    break;
                case FEMTO:
                    factor = (int32) Math.pow(10, -15);
                    break;
                case ATTO:
                    factor = (int32) Math.pow(10, -18);
                    break;
                case ZEPTO:
                    factor = (int32) Math.pow(10, -21);
                    break;
                case YOCTO:
                    factor = (int32) Math.pow(10, -24);
                    break;
            }

            return factor;
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
                case "h":
                    result = Prefix.HECTO;
                    break;
                case "da":
                    result = Prefix.DECA;
                    break;
                case "":
                    result = Prefix.NONE;
                    break;
                case "d":
                    result = Prefix.DECI;
                    break;
                case "c":
                    result = Prefix.CENTI;
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
