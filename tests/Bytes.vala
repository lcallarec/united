using United;

private void register_bytes_test() {

    Test.add_func("/United/Bytes#B->MB", () => {

        // Given
        var bytes = 1750000;

        // When
        var result = new United.Bytes(bytes);

        // Then
        assert(result.to_human().to_string() == "1.75MB");
    });

    Test.add_func("/United/Bytes/to_human#B->GB", () => {

        // Given
        var bytes = 5050000000;

        // When
        var result = new United.Bytes(bytes);

        // Then
        assert(result.to_human().to_string()  == "5.05GB");
    });

    Test.add_func("/United/Bytes/to#units_back_and_forth", () => {

        // Given
        var bytes = 5800000000;

        // When
        var B = new United.Bytes(bytes);

        // Then
        var GB = B.to(Prefix.GIGA);


        // When
        var B2 = GB.to(Prefix.NONE);
        
        // Then
        assert(B2.value == bytes);
        assert(B2.unit == "B");
        assert(B2.prefix == Prefix.NONE);
        
        // When
        var MB = B.to(Prefix.MEGA);
        
        // Then
        assert(MB.value == 5800);
        assert(MB.to_string() == "5800MB");

        // When
        var KB = MB.to(Prefix.KILO);
        
        // Then
        assert(KB.value == 5800000);
        assert(KB.to_string("%.0f") == "5800000kB");


        // When
        var GB2 = KB.to(Prefix.GIGA);
        
        // Then
        assert(GB2.value == 5.8);
        assert(GB2.to_string() == "5.8GB");
      });
}
