namespace United {
    
    public class Bytes {
        public double value;
        public string unit;
        public Prefix prefix;

        public Bytes(double value, string measure_unit = "B") {
            this.value = value;
            parse(value, measure_unit);
        }

        public Bytes.from_attributes(double value, string unit, Prefix prefix) {
            this.value = value;
            this.unit = unit;
            this.prefix = prefix;
        }

        public Bytes to_human() {
            var tmp_value = value;

            int distance = 0;
            while (tmp_value >= 1000) {
                tmp_value /= 1000;
                distance++;
            }
            return to(this.prefix - distance);
        }

        public Bytes to(Prefix prefix) {
            int distance = prefix - this.prefix;
            // Doesnt't use value * Math.pow(1000, distance) to avoid floating point precision issue
            if (distance > 0) {
                return new Bytes.from_attributes(
                    value * Math.pow(1000, distance),
                    unit,
                    prefix
                );
            } else if (distance < 0) {
                return new Bytes.from_attributes(
                    value / Math.pow(1000, -distance),
                    unit,
                    prefix
                 );
            }

            return clone();
           
        }

        public string to_string(string format = "%g", string separator = "") {
             return format.printf(value).replace(",", ".") + separator + prefix.to_string() + unit;
        }

        public Bytes clone() {
            return new Bytes.from_attributes(
                value,
                unit,
                prefix
            );
        }

        private void parse(double measure, string measure_unit) {
            unit = measure_unit;
            prefix = Prefix.NONE;
            if (measure_unit.length > 1) {
                unit = measure_unit.substring(measure_unit.length - 1, 1);
                prefix = Prefix.from_string(measure_unit.substring(0, 1));
            }
        }
    }
}
