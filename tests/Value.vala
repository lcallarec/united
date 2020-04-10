private void register_value_test() {

     Test.add_func("/United/Value#g_to_string", () => {

        // Given
        var value = 12.897;
        var unit = "g";

        // When
        var object = United.Value(value, unit);

        // Then
        assert(object.quantity == 12.897);
        assert(object.to_string() == "12.897g");
        assert(object.prefix == United.Prefix.NONE);
        assert(object.unit == "g");        
    });

    Test.add_func("/United/Value#kg_to_string", () => {

        // Given
        var value = 77.28;
        var unit = "kg";

        // When
        var object = United.Value(value, unit);

        // Then
        assert(object.quantity == 77.28);
        assert(object.unit == "g");      
        assert(object.prefix == United.Prefix.KILO);
        assert(object.to_string() == "77.28kg");
    });

    Test.add_func("/United/Value/from_string#integer_value", () => {

        // Given
        var value = "415Mb";
        // When
        var object = United.Value.from_string(value);

        // Then
        assert(object.quantity == 415);
        assert(object.unit == "b");      
        assert(object.prefix == United.Prefix.MEGA);
        assert(object.to_string() == "415Mb");
    });


    Test.add_func("/United/Value/from_string#float_value_with_comma", () => {

        // Given
        var value = "15,89ml";
        // When
        var object = United.Value.from_string(value);

        // Then
        assert(object.quantity == 15.89);
        assert(object.unit == "l");      
        assert(object.prefix == United.Prefix.MILLI);
        assert(object.to_string() == "15.89ml");
    });

    Test.add_func("/United/Value/from_string#float_value_with_dot", () => {

        // Given
        var value = "2.21GW";
        // When
        var object = United.Value.from_string(value);

        // Then
        assert(object.quantity == 2.21);
        assert(object.unit == "W");      
        assert(object.prefix == United.Prefix.GIGA);
        assert(object.to_string() == "2.21GW");
    });

    Test.add_func("/United/Value/from_string#float_value_with_precision", () => {

        // Given
        var value = "7.89762nV";
        // When
        var object = United.Value.from_string(value);

        // Then
        assert(object.quantity == 7.89762);
        assert(object.unit == "V");      
        assert(object.prefix == United.Prefix.NANO);
        assert(object.to_string(null, 2) == "7.90nV");
    });    

    Test.add_func("/United/Value/from_string#to_string_with_space_between_quantity_and_prefix_unit", () => {

        // Given
        var value = "12.5pl";
        // When
        var object = United.Value.from_string(value);

        // Then
        assert(object.quantity == 12.5);
        assert(object.unit == "l");      
        assert(object.prefix == United.Prefix.PICO);
        assert(object.to_string(" ") == "12.5 pl");
    });

    Test.add_func("/United/Value/human_big_value", () => {

        // Given
        var value = "5050000000ng"; //nanogram
        var object = United.Value.from_string(value);

        // When
        var human = object.human().to_string();

        // Then
        assert(human == "5.05g");
    });


    Test.add_func("/United/Value/human_thousands_value", () => {

        // Given
        var value = "5050g";
        var object = United.Value.from_string(value);
        
        // When
        var human = object.human().to_string();
        
        // Then
        assert(human == "5.05kg");
    });

    Test.add_func("/United/Value/human_ten_thousands_value", () => {

        // Given
        var value = "50787g";
        var object = United.Value.from_string(value);
        
        // When
        var human = object.human().to_string();

        // Then
        assert(human == "50.79kg");
    });

    Test.add_func("/United/Value/human_decimal_precision", () => {

        // Given
        var value = "79851237PJ";
        var object = United.Value.from_string(value);
        
        // When
        var human = object.human(3).to_string(" ");

        // Then
        assert(human == "79.851 ZJ");
    });    
}
