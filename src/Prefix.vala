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

    public class BiPrefix : Prefixable, Object {
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

        public BiPrefix(int8 value = BiPrefix.NONE) {
            this.value = value;
        }
        public double get_factor() {
            return 1024;
        }

        public string to_string() {
            var result = "";
            switch (this.value) {
                case BiPrefix.YOBI:
                    result = "Yi";
                    break;
                case BiPrefix.ZEBI:
                    result = "Zi";
                    break;
                case BiPrefix.EXBI:
                    result = "Ei";
                    break;
                case BiPrefix.PEBI:
                    result = "Pi";
                    break;
                case BiPrefix.TEBI:
                    result = "Ti";
                    break;
                case BiPrefix.GIBI:
                    result = "Gi";
                    break;
                case BiPrefix.MEBI:
                    result = "Mi";
                    break;
                case BiPrefix.KIBI:
                    result = "Ki";
                    break;
                case BiPrefix.NONE:
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
            return new BiPrefix(this.value);
        }

        public Prefixable create_at(int8 distance) {
            return new BiPrefix(this.get_value() + distance);
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
    }
}
