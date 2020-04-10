namespace United {

    public struct Value {
        double measure;
        string unit;
        Prefix prefix;
        string prefix_unit;

        public Value(double measure, string measure_unit) {
            this.measure = measure;
            parse(measure, measure_unit);
        }

        public Value.from_string(string value) {
            try {
                Regex regex = new Regex ("^([0-9.,]+)[\\s]{0,}(\\w+)$");
                MatchInfo info;
                if (regex.match(value, 0, out info)){
                    var measure = info.fetch(1);
                    var measure_unit = info.fetch(2);
                    if (measure != null) {
                        this.measure = double.parse(measure.replace(",", "."));
                    }
                    if (measure_unit != null) {
                        parse(this.measure, measure_unit);
                    }
                }
            } catch (RegexError e) {
                measure = 0;
                prefix = Prefix.NONE;
                unit = "";
                prefix_unit = "";
            }
        }

        public Value.from_attributes(double measure, string unit, Prefix prefix) {
            this.measure = measure;
            this.unit = unit;
            this.prefix = prefix;
            prefix_unit = prefix.to_string() + unit;
        }

        public string to_string(string? separator = null, uint8? precision = null) {
            var format = "%g";
            if (precision != null) {
                format = "%." + precision.to_string() + "f";
            }
            var sep = "";
            if (sep != null) {
                sep = separator;
            }
            return format.printf(measure).replace(",", ".") + separator + prefix_unit;
        }

        public Value human(uint8 decimal_precision = 2) {
            var factor = num_of_digits((int) measure) / 3;
            if (factor >= 1) {
                var k = decimal_precision == 0 ? 1 : Math.pow(10, (double) decimal_precision);
                return Value.from_attributes(
                    ((double) Math.round(measure / Math.pow(10, factor  * 3) * k) / k),
                    unit,
                    prefix - factor
                );
            }

            return this.clone();
        }

        public Value to(Prefix prefix) {
            int distance = prefix - this.prefix;
            return Value.from_attributes(
                this.measure * Math.pow(1000, (double) distance),
                unit,
                prefix
            );
        }

        public Value clone() {
            return Value.from_attributes(
                measure,
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

            prefix_unit = prefix.to_string() + unit;
        }

    }

    private int num_of_digits(int value) {
        var num_digits = 0;
        while (value != 0) {
            value /= 10;
            ++num_digits;
        }

        return num_digits;
    }
}
