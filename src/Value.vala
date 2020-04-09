namespace United {

    public struct Value {
        double quantity;
        string unit;
        Prefix prefix;
        string prefix_unit;

        public Value(double measure, string measure_unit) {
            quantity = measure;
            parse_measure_unit(measure_unit, out prefix, out unit, out prefix_unit);
        }

        public Value.from_string(string value) {
            try {
                Regex regex = new Regex ("^([0-9.,]+)(\\w+)$");
                MatchInfo info;
                if (regex.match(value, 0, out info)){
                    var quantity = info.fetch(1);
                    var measure_unit = info.fetch(2);
                    if (quantity != null) {
                        this.quantity = double.parse(quantity.replace(",", "."));
                    }
                    if (measure_unit != null) {
                        parse_measure_unit(measure_unit, out prefix, out unit, out prefix_unit);
                    }
                }
            } catch (RegexError e) {
                quantity = 0;
                prefix = Prefix.NONE;
                unit = "";
                prefix_unit = "";
            }
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

        public void parse_measure_unit(string measure_unit, out Prefix prefix, out string unit, out string prefix_unit) {
            unit = measure_unit;
            prefix = Prefix.NONE;
            if (measure_unit.length > 1) {
                unit = measure_unit.substring(measure_unit.length - 1, 1);
                prefix = Prefix.from_string(measure_unit.substring(0, 1));
            }

            prefix_unit = prefix.to_string() + unit; 
        }
    }
}