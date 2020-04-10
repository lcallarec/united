namespace United {

    public struct Value {
        double quantity;
        string unit;
        Prefix prefix;
        string prefix_unit;

        public Value(double measure, string measure_unit) {
            quantity = measure;
            parse_measure_unit(measure_unit);
        }

        public Value.from_string(string value) {
            try {
                Regex regex = new Regex ("^([0-9.,]+)[\\s]{0,}(\\w+)$");
                MatchInfo info;
                if (regex.match(value, 0, out info)){
                    var quantity = info.fetch(1);
                    var measure_unit = info.fetch(2);
                    if (quantity != null) {
                        this.quantity = double.parse(quantity.replace(",", "."));
                    }
                    if (measure_unit != null) {
                        parse_measure_unit(measure_unit);
                    }
                }
            } catch (RegexError e) {
                quantity = 0;
                prefix = Prefix.NONE;
                unit = "";
                prefix_unit = "";
            }
        }

        public Value.from_attributes(double quantity, string unit, Prefix prefix) {
            this.quantity = quantity;
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
            return format.printf(quantity).replace(",", ".") + separator + prefix_unit;
        }

        public Value human(uint8 decimal_precision = 2) {
            var factor = num_of_digits((int) quantity) / 3;
            if (factor >= 1) {
                var k = decimal_precision == 0 ? 1 : Math.pow(10, (double) decimal_precision);
                return Value.from_attributes(
                    ((double) Math.round(quantity / Math.pow(10, factor  * 3) * k) / k),
                    unit,
                    prefix - factor
                );
            }

            return this.clone();
        }

        public Value clone() {
            return Value.from_attributes(
                quantity,
                unit,
                prefix
            );
        }

        private void parse_measure_unit(string measure_unit) {
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
