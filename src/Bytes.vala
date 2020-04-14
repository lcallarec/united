namespace United {
    
    public class Bytes {
        public double value;
        public string unit;
        public Prefixable prefix = new Prefix(Prefix.NONE);

        public Bytes(double value, string measure_unit = "B") {
            this.value = value;
            parse(value, measure_unit);
        }

        public Bytes.from_attributes(double value, string unit, Prefixable prefix) {
            this.value = value;
            this.unit = unit;
            this.prefix = prefix;
        }

        public Bytes to_human() {
            var tmp_value = value;

            int8 distance = 0;
            while (tmp_value >= prefix.get_factor()) {
                tmp_value /= prefix.get_factor();
                distance++;
            }
            return to(prefix.create_at(distance));
        }

        public Bytes to(Prefixable prefix) {
            
            var source_prefix_factor = this.prefix.get_factor();
            var target_prefix_factor = prefix.get_factor();
            int8 distance = prefix.distance_from(this.prefix);

            double new_value = value;

            //Particular case : source is in Byte
            if(this.prefix.equals(Prefix.NONE)) {
                new_value = value * Math.pow(target_prefix_factor, -distance);
            } else if (source_prefix_factor == target_prefix_factor) {
                new_value = value / Math.pow(target_prefix_factor, distance);
            } else {
                // Doesnt't use value * Math.pow(kfactor, distance) to avoid floating point precision issue
                if (distance > 0) {
                    //Calculate the translation, in distance, to the same prefix as the source (i.e KiB -> MiB)
                    new_value = Math.pow(target_prefix_factor, -distance) / Math.pow(source_prefix_factor, -distance) * value;
                    //Shift to new prefix (i.e. MiB -> MB)
                    new_value = new_value / Math.pow(target_prefix_factor, distance);

                } else if (distance < 0) {
                    //Calculate the translation, in distance, to the same prefix as the source (i.e MiB -> KiB)
                    new_value = Math.pow(target_prefix_factor, distance) * Math.pow(source_prefix_factor, -distance) * value;
                    //Shift to new prefix (i.e. MiB -> MB)
                    new_value = new_value / Math.pow(source_prefix_factor, distance);
                } else if (distance == 0) {
                    new_value = (source_prefix_factor / target_prefix_factor) * value;
                }
            }

            return new Bytes.from_attributes(
                new_value,
                unit,
                prefix
            );
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
            prefix = new Prefix(Prefix.NONE);
            if (measure_unit.length > 1) {
                unit = measure_unit.substring(measure_unit.length - 1, 1);
                prefix = prefix.from_string(measure_unit.substring(0, 1));
            }
        }
    }
}
