namespace United {

    public interface Prefixable : Object {
        public abstract double get_factor();
        public abstract string to_string();
        public abstract int8 distance_from(Prefixable prefix);
        public abstract bool equals(int8 value);
        public abstract Prefixable from_string(string prefix);
        public abstract int8 get_value();
        public abstract Prefixable create_at(int8 distance);
    }

    public class BinaryPrefix : Prefixable, Object {
        public const int8 YOBI = 8;
        public const int8 ZEBI = 7;
        public const int8 EXBI = 6;
        public const int8 PEBI = 5;
        public const int8 TEBI = 4;
        public const int8 GIBI = 3;
        public const int8 MEBI = 2;
        public const int8 KIBI = 1;
        public const int8 NONE = 0;

        public int8 value;

        public BinaryPrefix(int8 value = BinaryPrefix.NONE) {
            this.value = value;
        }

        public double get_factor() {
            return 1024;
        }

        public string to_string() {
            var result = "";
            switch (this.value) {
                case BinaryPrefix.YOBI:
                    result = "Yi";
                    break;
                case BinaryPrefix.ZEBI:
                    result = "Zi";
                    break;
                case BinaryPrefix.EXBI:
                    result = "Ei";
                    break;
                case BinaryPrefix.PEBI:
                    result = "Pi";
                    break;
                case BinaryPrefix.TEBI:
                    result = "Ti";
                    break;
                case BinaryPrefix.GIBI:
                    result = "Gi";
                    break;
                case BinaryPrefix.MEBI:
                    result = "Mi";
                    break;
                case BinaryPrefix.KIBI:
                    result = "Ki";
                    break;
                case BinaryPrefix.NONE:
                    result = "";
                    break;
            }

            return result;
        }

        public int8 get_value() {
            return this.value;
        }


        public int8 distance_from(Prefixable prefix) {
            return this.value - prefix.get_value();
        }

        public bool equals(int8 value) {
            return this.value == value;
        }

        public Prefixable from_string(string prefix) {
            return new BinaryPrefix(this.value);
        }

        public Prefixable create_at(int8 distance) {
            return new BinaryPrefix(this.get_value() + distance);
        }

        public static BinaryPrefix yobi() {
            return new BinaryPrefix(BinaryPrefix.YOBI);
        }

        public static BinaryPrefix zebi() {
            return new BinaryPrefix(BinaryPrefix.ZEBI);
        }

        public static BinaryPrefix exbi() {
            return new BinaryPrefix(BinaryPrefix.EXBI);
        }

        public static BinaryPrefix pebi() {
            return new BinaryPrefix(BinaryPrefix.PEBI);
        }

        public static BinaryPrefix tebi() {
            return new BinaryPrefix(BinaryPrefix.TEBI);
        }

        public static BinaryPrefix gibi() {
            return new BinaryPrefix(BinaryPrefix.GIBI);
        }

        public static BinaryPrefix mebi() {
            return new BinaryPrefix(BinaryPrefix.MEBI);
        }

        public static BinaryPrefix kibi() {
            return new BinaryPrefix(BinaryPrefix.KIBI);
        }

        public static BinaryPrefix none() {
            return new BinaryPrefix(BinaryPrefix.NONE);
        }
    }

    public class Prefix : Prefixable, Object {

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
        public double get_factor() {
            return 1000;
        }

        public int8 distance_from(Prefixable prefix) {
            return this.value - prefix.get_value();
        }

        public int8 get_value() {
            return this.value;
        }

        public Prefixable create_at(int8 distance) {
            return new Prefix(this.get_value() + distance);
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

        public Prefixable from_string(string prefix) {
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

        public static Prefix yotta() {
            return new Prefix(Prefix.YOTTA);
        }

        public static Prefix zeta() {
            return new Prefix(Prefix.ZETA);
        }

        public static Prefix exa() {
            return new Prefix(Prefix.EXA);
        }

        public static Prefix peta() {
            return new Prefix(Prefix.PETA);
        }

        public static Prefix tera() {
            return new Prefix(Prefix.TERA);
        }

        public static Prefix giga() {
            return new Prefix(Prefix.GIGA);
        }

        public static Prefix mega() {
            return new Prefix(Prefix.MEGA);
        }

        public static Prefix kilo() {
            return new Prefix(Prefix.KILO);
        }

        public static Prefix none() {
            return new Prefix(Prefix.NONE);
        }

        public static Prefix milli() {
            return new Prefix(Prefix.MILLI);
        }

        public static Prefix micro() {
            return new Prefix(Prefix.MICRO);
        }

        public static Prefix nano() {
            return new Prefix(Prefix.NANO);
        }

        public static Prefix pico() {
            return new Prefix(Prefix.PICO);
        }

        public static Prefix femto() {
            return new Prefix(Prefix.FEMTO);
        }

        public static Prefix atto() {
            return new Prefix(Prefix.ATTO);
        }

        public static Prefix zepto() {
            return new Prefix(Prefix.ZEPTO);
        }

        public static Prefix yocto() {
            return new Prefix(Prefix.YOCTO);
        }
    }
}
